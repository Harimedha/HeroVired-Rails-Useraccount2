require 'bcrypt'
class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render html: "User login"      
    end

   
    def create
        useracc = User.find_by(useremail: params[:useremail])
        if useracc != nil && useracc.authenticate(params[:password])
            session[:current_user_id] = useracc.id      
            render json: "Login in successful. User session created"
        else
            
            render json: "E-mail  password combination is incorrect."
        end
    end
 
end