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
and type command in config.ru (for make localises file befoure start rails) or there where you want to make locales
```ruby
Excel2local::localize! './config/locales/locales.xlsx','./config/locales'
```

## Usage if not rails
require gem if not rails
```ruby
require 'excel2local' 
 
Excel2local::localize! '****.xlsx','locales path'
```


## Development
gem uses beautiful gem - "roo"  --> https://github.com/roo-rb/roo


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eliseevTech/excel2local or eliseevmail@ya.ru

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
