module Recoil
  class Interceptor
    def self.delivering_email(message)
      message.to = message.to.reject { |email| Email.new(email).blacklisted? }

      message.perform_deliveries = false if message.to.empty?
    end
  end
end
