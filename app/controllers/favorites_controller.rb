class FavoritesController < ApplicationController
    
    def create
        Favorite.create(user_id: session[:user_id], character_id: session[:character_id])
        redirect_to request.referer
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @favorite.destroy
        redirect_to request.referer
    end
end
