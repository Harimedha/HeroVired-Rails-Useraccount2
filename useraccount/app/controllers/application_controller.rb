class ApplicationController < ActionController::Base
    before_action :authorize, options:

    def index
        render html: "Book stock management page with postgres and rails"
    end

    def authorize
        # if !session[:current_user_id]
        #   render html: "User authorize check from application controller"          
        # #   redirect_to '/'
        # end
      end
end
