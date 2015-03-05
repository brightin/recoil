require 'recoil/engine'
require 'recoil/delivery_method'
require 'recoil/message'
require 'recoil/email'

module Recoil
  mattr_accessor :blacklist_threshold
  @@blacklist_threshold = ->(record) { record.bounces > 3 }

  def self.setup
    yield self
  end
end
