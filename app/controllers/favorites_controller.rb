class FavoritesController < ApplicationController
    
    def create
        Favorite.create(user_id: session[:user_id], character_id: session[:character_id])
        redirect_to character_path(session[:character_id])
    end

    def destroy
        @favorite = Favorite.find(params[:id])
        @character = @favorite.character
        @favorite.destroy
        redirect_to character_path(@character)
    end
end
