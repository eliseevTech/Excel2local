#add locales.xlsx to Your_Rails_App/config/locales/

# add gem to the gemfile
# gem "excel2local", '~> 0.1.3' to 
require "./excel2local" 

# add next for localize only one file './config/locales/locales.xlsx' to './config/locales'
#Excel2local::localize! './config/locales/locales.xlsx','./config/locales'

#add next to config.ru for localize all files from './config/locales'
Excel2local::localize_all! './config/locales'
