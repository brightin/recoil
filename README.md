# Recoil

Rails delivery method. Send via Amazon SES, but with local blacklist
TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recoil'
```

And then execute:

    $ bundle


Add initializer:

```ruby
ActiveSupport.on_load :action_mailer do
  ActionMailer::Base.add_delivery_method :recoil, Recoil::DeliveryMethod, {}
end
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
