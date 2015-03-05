module Recoil
  class NotificationsController < ActionController::Base
    def index
      Message.for(params).process!
      head :no_content
    end
  end
end
