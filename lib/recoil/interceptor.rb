module Recoil
  class Interceptor
    def self.delivering_email(message)
      message.to = message.to.reject { |email| Email.new(email).blacklisted? }

      if message.to.empty?
        message.perform_deliveries = false
      end
    end
  end
end
