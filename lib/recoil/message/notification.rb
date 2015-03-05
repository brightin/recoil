require 'recoil/message/abstract'
require 'json'

module Recoil
  module Message
    class Notification < Abstract
      def process!
        body = JSON.parse(message['Message'])
        body['bounce']['bouncedRecipients'].each do |bounce|
          Recoil.add_bounce(bounce['emailAddress'], body['bounce']['bounceType'])
        end
      end
    end
  end
end
