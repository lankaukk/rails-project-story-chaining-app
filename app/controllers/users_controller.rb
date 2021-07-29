  class UsersController < ApplicationController

    def index
        redirect_to users_path
    end

    def new
        @user = User.new
    end

    def create
        if auth
            User.find_or_create_from_github(auth)
            binding.pry
        else
            @user = User.new(user_params)
            if @user.save
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render '/users/new'
            end
        end
    end

    def show
        if !logged_in?
            redirect_to '/'
        else
            @user = current_user
            @stories = @user.stories
        end
    end
     
    private
     
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :bio, :password, :password_confirmation)
    end

    def auth 
        request.env['omniauth.auth']
    end

end
