require 'recoil/message'
require 'json'

module Recoil
  class Endpoint
    def self.call(env)
      message = JSON.parse(env['rack.input'].read)
      Recoil::Message.for(message).process!
      [204, { 'Content-Type' => 'text/plain' }, []]
    end
  end
end
