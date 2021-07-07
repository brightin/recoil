# Recoil
[![Gem Version](https://badge.fury.io/rb/recoil.svg)](http://badge.fury.io/rb/recoil)
[![Build Status](https://travis-ci.org/brightin/recoil.svg?branch=master)](https://travis-ci.org/brightin/recoil)
[![Code Climate](https://codeclimate.com/github/brightin/recoil/badges/gpa.svg)](https://codeclimate.com/github/brightin/recoil)
[![Test Coverage](https://codeclimate.com/github/brightin/recoil/badges/coverage.svg)](https://codeclimate.com/github/brightin/recoil/coverage)

Recoil makes sure your Amazon SES reputation is preserved by blacklisting emails with a bad reputation. Recoil does this with two simple tools:

1. An HTTP endpoint to receive bounce notifications and save them to the database.
2. An ActionMailer interceptor which is able to filter emails with high bounce rates.

## Getting started

Recoil works with Rails 4.0 onward. You can add it to you Gemfile with:

```ruby
gem 'recoil'
```

Run the bundle command to install it. After you've installed Recoil you need to copy the migrations and migrate the database:

```ruby
rake recoil:install:migrations
rake db:migrate
```

Add the endpoint to your `routes.rb`:

```ruby
mount Recoil::Engine => '/ses'
```

Add an initializer: `config/initializers/recoil.rb` to initialize the interceptor:

```ruby
ActionMailer::Base.register_interceptor(Recoil::Interceptor)
```

You're now ready to subscribe to SNS-notifications:

* Go to the SES dashboard and navigate to Topics > Create new topic.
* Enter a name and save.
* Create a new http/https subscription for this topic with the Recoil URL as endpoint. Make sure Recoil is mounted to this URL, as SNS will send a verification request as soon as you add the subscription.
* After the subscription is added and verified, you're able to let SES send notifications to the SNS topic. This is configurable in the SES dashboard.

## Configuration

There is just a single configuration option for recoil: `blacklist_threshold`. This is a lambda with an ActiveRecord scope as argument. The default configuration is to blacklist all email with 10+ bounces in the last two weeks. This is a very loose policy, but it's easy to change:

```ruby
# config/initializers/recoil.rb
  Recoil.blacklist_threshold = ->(scope) { scope.where('created_at > ?', 1.week.ago).count > 10 }
```

##RDocs

You can view the Recoil documentation in RDoc format here:

http://rubydoc.info/github/brightin/recoil

## Contributing

1. Fork it ( https://github.com/brightin/recoil/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
