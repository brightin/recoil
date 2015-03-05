# Recoil
[![Gem Version](https://badge.fury.io/rb/recoil.svg)](http://badge.fury.io/rb/recoil)
![Recoil](http://nowthatsgangsta.com/wp-content/uploads/Sniper-Rrifle-Recoil.gif)

Rails delivery method. Send via Amazon SES, but with local blacklist.

Warning: This is an early version of the gem. If you're sending an email to multiple receivers this gem might break in unexpected ways.

## Installation

Add this line to your application's Gemfile and run `bundle install`:

```ruby
gem 'recoil'
```

Copy migrations and run
```ruby
rake recoil:install:migrations
rake db:migrate
```

Change the action mailer delivery method:
```ruby
config.action_mailer.delivery_method = :recoil
```

Add endpoint to routes:
```ruby
mount Recoil::Engine => '/ses'
```

Subscribe to SES notifications... and profit!

## Contributing

1. Fork it ( https://github.com/brightin/recoil/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
