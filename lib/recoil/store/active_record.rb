module Recoil
  module Store
    class ActiveRecord < Abstract
      def self.add_bounce(email, type)
        Email.find_or_create_by_email(email).add_bounce(type)
      end

      def self.blacklisted?(email)
        Email.find_by_email(email).blacklisted?
      end

      if defined?(::ActiveRecord::Base)
        class ::Recoil::Email < ::ActiveRecord::Base
          def add_bounce(type)
            case type
            when :soft then increment(:soft_bounces)
            when :hard then increment(:hard_bounces)
            end
          end

          def blacklisted?
            Recoil.blacklist_threshold.call(self)
          end
        end
      end
    end
  end
end
