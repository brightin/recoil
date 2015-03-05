require 'recoil/message/abstract'
require 'json'

module Recoil
  module Message
    class Notification < Abstract
      def process!
        body = JSON.parse(message['Message'])
        body['bounce']['bouncedRecipients'].each do |bounce|
          Bounce.create!(
            email: bounce['emailAddress'],
            bounce_type: body['bounce']['bounceType']
          )
        end
      end
    end
  end
end
