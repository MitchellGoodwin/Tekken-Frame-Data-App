class FavoritesController < ApplicationController
    
    def create
        return head(:forbidden) unless logged_in?
        Favorite.create(user_id: session[:user_id], character_id: params[:character_id])
        redirect_to request.referer
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
        redirect_to request.referer
    end
end
