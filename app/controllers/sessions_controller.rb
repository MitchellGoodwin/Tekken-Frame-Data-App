class SessionsController < ApplicationController


    def welcome

    end

    def new
        @user = User.new
    end

    def create
        if User.exists?(user_params)
            @user = User.find_by(user_params)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def user_params
        params.permit(:username, :password)
    end

end
