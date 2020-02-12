class SessionsController < ApplicationController


    def welcome

    end

    def new
        return head(:forbidden) unless logged_in? == false
        session[:return_to] ||= request.referer
        @user = User.new
    end

    def create
        if User.exists?(username: params[:username])
            @user = User.find_by(username: params[:username])
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to session.delete(:return_to)
        else
            flash[:error] = "Please Enter Username and Password"
            render :new
        end
    end

    def destroy
        session[:return_to] ||= request.referer
        session.delete :user_id
        redirect_to session.delete(:return_to)
    end

end
