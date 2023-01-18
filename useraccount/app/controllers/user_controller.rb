require 'bcrypt'
class UserController < ApplicationController

skip_before_action :verify_authenticity_token
    
        def index
            render json: User.select(:id, :username, :useremail)
        end
    
        def show
            userval = User.find(params[:id])
            emaildetail = userval.useremail
            usernamedetail = userval.username
            render json: {message:"User details", usernamedetail: , emaildetail:}
            
        end
    
        def create      
            if(params) 
                 User.create('useremail': params[:useremail],
                'username': params[:username],              
                'password': params[:password])            
                userDetails = User.last.username
                render json: {message:"User account created" , userDetails:}
            else
                render json: "User account not added"
            end
            
        end
    
        def update
            useracc = User.find(params[:id].to_i)
            useracc.update('password': params[:password])
            render json: "User account updated"
        end
    
        def destroy
            deleteacc = User.find(params[:id].to_i).destroy
            if(deleteacc)
                render json: "User account deleted"
            else
                render json: "User account deletion failed"
            end
        end

    end
