class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        return redirect_to '/login' unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end
end