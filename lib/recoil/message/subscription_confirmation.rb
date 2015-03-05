require 'recoil/message/abstract'

module Recoil
  module Message
    class SubscriptionConfirmation < Abstract
      def process!
        Net::HTTP.get(subscribe_url)
      end

      private

      def subscribe_url
        URI(message['SubscribeURL'])
      end
    end
  end
end
