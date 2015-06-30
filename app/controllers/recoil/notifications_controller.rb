module Recoil
  class NotificationsController < ActionController::Base
    def index
      Message.for(JSON.parse(request.raw_post)).process!
      head :no_content
    end
  end
end
