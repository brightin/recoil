module Recoil
  module Store
    class Abstract
      def self.add_bounce(_email, _type)
        raise NotImplementedError
      end

      def self.blacklisted?(_email)
        raise NotImplementedError
      end
    end
  end
end
