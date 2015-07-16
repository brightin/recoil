module Recoil
  class Interceptor
    def self.delivering_email(message)
      if message.to.any? { |email| Email.new(email).blacklisted? }
        message.perform_deliveries = false
      end
    end
  end
end
