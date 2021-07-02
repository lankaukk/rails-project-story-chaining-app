  class UsersController < ApplicationController
    def new

    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to '/stories'
        else
            redirect_to '/users/new'
        end
    end

    def show

    end
     
    private
     
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :bio, :password, :password_confirmation)
    end
end
