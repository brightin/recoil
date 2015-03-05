module Recoil
  module Message
    class Abstract
      attr_reader :message

      def initialize(message)
        @message = message
      end

      def process!
        raise NotImplementedError
      end
    end
  end
end
