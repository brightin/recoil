module Recoil
  class NotificationsController < ActionController::Base
    def index
      Message.for(JSON.parse(request.body)).process!
      head :no_content
    end
  end
end
