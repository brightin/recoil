require 'aws-sdk'

module Recoil
  class DeliveryMethod
    attr_accessor :settings

    def initialize(options = {})
      @settings = options
    end

    def deliver!(email)
      # return if Recoil.blacklisted?(email['to'])
      AWS::SimpleEmailService.new.send_raw_email(email)
    end
  end
end
