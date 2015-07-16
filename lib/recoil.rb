require 'recoil/email'
require 'recoil/engine'
require 'recoil/interceptor'
require 'recoil/message'

module Recoil
  mattr_accessor :blacklist_threshold
  @@blacklist_threshold = ->(scope) { scope.where('created_at > ?', 2.weeks.ago).count > 10 }
end
