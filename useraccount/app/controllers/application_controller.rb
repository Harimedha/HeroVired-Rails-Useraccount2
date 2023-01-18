class ApplicationController < ActionController::Base
    before_action :check_authentication, options:

    def index
        render html: "Book stock management page with postgres and rails"
    end

    def check_authentication
        
      end
end
