class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth 
            @user = User.find_or_create_from_github(auth)
        else

            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                flash[:error] = "Invalid email or password."
                redirect_to login_path
            end
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end