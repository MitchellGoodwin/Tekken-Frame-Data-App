class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def show

    end

    def new
        return head(:forbidden) unless logged_in? == false
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def edit
        return head(:forbidden) unless current_user == @user
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.permit(:username, :password, :password_confirmation, :location, :picture_link, :bio)
    end

end
