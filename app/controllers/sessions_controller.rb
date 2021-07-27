class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        if auth 
            user = User.find_or_create_by(email: auth['info']['email']) do |u|
                u.password = SecureRandom.hex(12)
            end
            # @user = User.find_or_create_from_github(auth)
            if user 
                redirect_to user_path
            else
                redirect_to '/'
            end
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

    private

    def auth
      request.env['omniauth.auth']
    end

end