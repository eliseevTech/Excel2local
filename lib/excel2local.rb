require "excel2local/version"
require "roo"

module Excel2local
  
  def self.localize_all! (locate)
    backup_all! locate # делаем бекапп 
    Dir["#{locate}/*.xlsx"].each { |file|  
      localize! "#{file}","#{locate}"
    }
  end

  def self.localize! (excel_file, save_place)    #excel_file - фаил с переводом 
    puts "Excel2local::localize! from #{excel_file} ---> to #{save_place}/"
    workbook = Roo::Excelx.new(excel_file)    #подсовываем фаил в библиотеку
    yml_file = []    #  создаем массив для имен файлов
    simbol_memory = []
    workbook.each_with_index {|row, row_index|    #начинаем перебор строк
      if (row_index == 0) then    #если первая строка то начинаем создавать файлы локализаций
        row.each_with_index { |col, col_index|    # перебираем колонки
          File.open("#{save_place}/#{File.basename(excel_file, ".xlsx")}_#{col}.yml", "w") { |file| file.puts "#{col}:"   } if col_index != 0 && col != "#" #если не 1 колонка то создаем фаил локали 
          yml_file[col_index] = col    #кладем имя файла в массив в соответствующий индекс
          simbol_memory[col_index] = []
        } 
      else
        row.each_with_index { |col, col_index|    #если не первая строка
          @simbol = col if col_index == 0    #если 
          if (col_index != 0) and (@simbol != nil ) and (col != nil) 
            @simbol.to_s.split(".").each_with_index { | simbol, index |
              simbol = "\'" + simbol + "\'" if [ "true", "false", "on", "off", "yes", "no" ].member?(simbol)
              if simbol != simbol_memory[col_index][index]  then
                File.open("#{save_place}/#{File.basename(excel_file, ".xlsx")}_#{yml_file[col_index]}.yml", "a") { |file| file.print "  "*(index+1) + "#{simbol}:"   }  if @simbol.to_s.split(".").length - 1 == index
                File.open("#{save_place}/#{File.basename(excel_file, ".xlsx")}_#{yml_file[col_index]}.yml", "a") { |file| file.puts "  "*(index+1) + "#{simbol}:"  }  if @simbol.to_s.split(".").length - 1 != index
                index.upto(@simbol.to_s.split(".").length ) { |n| simbol_memory[col_index].delete_at(n)}
              end
              simbol_memory[col_index][index] = simbol 
            }
            File.open("#{save_place}/#{File.basename(excel_file, ".xlsx")}_#{yml_file[col_index]}.yml", "a") { |file| file.puts "  \"#{col}\""  }  # пишем сам символ
          end
        }
      end
    }
  end

  def self.backup_all! (locate)
    if (Dir["#{locate}/*.yml"][0] != nil) then   # проверяем есть ла файлы для бекапа
      print "Excel2local::backup_all!   to #{locate}/backups .. "    
      Dir.mkdir("#{locate}/backups") if File.directory?("#{locate}/backups") == false  #  проверяем есть папка бекап, если нет создаем
      Dir.mkdir(dir_name = "#{locate}/backups/#{Time.now.to_i}") # создаем папку для конкретного бекапа
      Dir["#{locate}/*.yml"].each { |file| 
        FileUtils.cp(file, dir_name)  #копируем файл
      }
      puts "Done!"
    else
      puts "nothing to backup"
    end
  end
end