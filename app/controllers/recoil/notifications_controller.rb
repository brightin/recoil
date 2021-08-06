module Recoil
  class NotificationsController < ActionController::Base
    def index
      post = JSON.parse(request.raw_post)
      Message.for(post).process!
      head :no_content
    end
  end
end
