# Excel2local
Hey! You want to EASY manage your localise?
Correct and change the location in Excel. Send it for transfer to outsourcing. Save time, spend it on yourself.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'excel2local'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install excel2local

## Usage if rails
Correct file localises.xlsx and place it to yiur your_rails_app/config/locales/
and type command in config.ru (for make localises file befoure every start rails) or there where you want to make locales

for one excel file
```ruby
Excel2local::localize! './config/locales/locales.xlsx','./config/locales'
```
or for all files in folder 
```ruby
Excel2local::localize_all! './config/locales'
```

notice: old locales files will be deleted!!!

## Usage if not rails
require gem if not rails
```ruby
require 'excel2local' 
```
for one file
```ruby
Excel2local::localize! '****.xlsx','locales path'
```
for all files
```ruby
Excel2local::localize_all! 'locales path'
```


## Correct localises.xlsx or other *.xlsx
Such Excel configuration = 3 files of locales: en.yml, ru.yml,ru_fan.yml

--- | en | ru | ru_fun |  
--- | --- | --- | --- |  
hello | hello | привет | приувет |
head.info.true | true | правда | тру | 
head.info.connect | connect to server | соединение | контакт  | 
head.true.test | test | тест | эй бро | 


#{filename}_en.yml 
```ruby
en:
  hello:  'hello'
  head:
    info:
      'true':  'true'
      connect:  'connect to server'
    'true':
      test:  'test'
```
#{filename}_ru.yml
```ruby
ru:
  hello:  'привет'
  head:
    info:
      'true':  'правда'
      connect:  'соединение'
    'true':
      test:  'тест'
```
#{filename}_ru_fun 
```ruby
ru_fun:
  hello:  'приувет'
  head:
    info:
      'true':  'тру'
      connect:  'контакт '
    'true':
      test:  'эй бро'
```


You see, that the specific is correctly processed (true = 'true')
and for example
x1.y1.n1 = 
```ruby
x1:
  y1: 
    n1: 
```
## Development
gem uses beautiful gem - "roo"  --> https://github.com/roo-rb/roo


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eliseevTech/excel2local or eliseevmail@ya.ru

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
