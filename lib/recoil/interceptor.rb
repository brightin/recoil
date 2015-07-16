module Recoil
  class Interceptor
    def self.delivering_email(message)
      # cannot use reject! because .to is not a plain ruby-array.
      message.to = message.to.reject { |email| Email.new(email).blacklisted? }
    end
  end
end
