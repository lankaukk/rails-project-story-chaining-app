  class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth
            User.find_or_create_from_github(auth)
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
        # redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end
     
    private
     
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :bio, :password, :password_confirmation)
    end

    def auth 
        request.env['omniauth.auth']
    end

end
