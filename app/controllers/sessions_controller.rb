class SessionsController < ApplicationController


    def welcome

    end

    def new
        session[:return_to] ||= request.referer
        @user = User.new
    end

    def create
        if User.exists?(user_params)
            @user = User.find_by(user_params)
            session[:user_id] = @user.id
            redirect_to session.delete(:return_to)
        else
            render :new
        end
    end

    def destroy
        session[:return_to] ||= request.referer
        session.delete :user_id
        redirect_to session.delete(:return_to)
    end

    private

    def user_params
        params.permit(:username, :password)
    end

end
