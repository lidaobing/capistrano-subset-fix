# Capistrano::Subset::Fix

fix capistrano block when use max_hosts.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-subset-fix'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-subset-fix

## Usage

add following lines to `config/deploy.rb`

```ruby
gem 'capistrano-subset-fix'
require 'capistrano-subset-fix'
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
