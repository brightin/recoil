require 'recoil/delivery_method'
require 'recoil/endpoint'

module Recoil
  mattr_accessor :store_adapter
  @store_adapter = :active_record

  mattr_accessor :blacklist_threshold
  @blacklist_threshold = ->(record) { record.soft_bounces > 3 || record.hard_bounces > 0 }

  def self.setup
    yield self
  end

  def self.blacklisted?(_email)
    store_adapter_class.blacklisted?(emails)
  end

  def self.add_bounce(email, type)
    store_adapter_class.add_bounce(email, type)
  end

  def self.store_adapter_class
    "Recoil::Store::#{store_adapter.classify}".constantize
  end
end
