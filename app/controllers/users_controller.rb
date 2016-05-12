class UsersController < ApplicationController
    
    def show
        @user = User.friendly.find(params[:username])
    end
end
