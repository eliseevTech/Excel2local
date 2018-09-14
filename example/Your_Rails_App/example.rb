#add locales.xlsx to Your_Rails_App/config/locales/

# add gem to the gemfile
# gem "excel2local", '~> 0.1.3' to 
require "Excel2local" 

# add Excel2local::localize! './config/locales/locales.xlsx','./config/locales' to config.ru
Excel2local::localize! './config/locales/locales.xlsx','./config/locales'

