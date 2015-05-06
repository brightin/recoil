module Recoil
  class Interceptor
    def self.delivering_email(message)
      if message.to.any? { |email| Email.blacklisted?(email) }
        message.perform_deliveries = false
      end
    end
  end
end
