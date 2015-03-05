module Recoil
  class Engine < ::Rails::Engine
    isolate_namespace Recoil

    initializer "Add delivery method" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method :recoil, DeliveryMethod, {}
      end
    end
  end
end
