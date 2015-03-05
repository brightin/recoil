require 'active_support/inflector'
require 'recoil/message/notification'
require 'recoil/message/subscription_confirmation'
require 'recoil/message/unsubscribe_confirmation'

module Recoil
  module Message
    TypeUnknown = Class.new(StandardError)

    def self.for(params)
      "Recoil::Message::#{params['Type']}".constantize.new(params)
    rescue NameError
      raise TypeUnknown, "Unknown type #{params['Type']}"
    end
  end
end
