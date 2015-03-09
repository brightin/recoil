require 'recoil/email'
require 'recoil/engine'
require 'recoil/interceptor'
require 'recoil/message'

module Recoil
  mattr_accessor :blacklist_threshold
  @@blacklist_threshold = ->(record) { record.bounces > 3 }

  def self.setup
    yield self
  end
end
