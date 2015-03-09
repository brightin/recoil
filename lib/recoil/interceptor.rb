class Interceptor
  def self.delivering_email(message)
    if Email.blacklisted?(email['to'])
      message.perform_deliveries = false
    end
  end
end
