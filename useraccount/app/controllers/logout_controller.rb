class LogoutController < ApplicationController

    def index
        session.delete(:current_user_id)
        render json: "User logged out"
    end     

end
