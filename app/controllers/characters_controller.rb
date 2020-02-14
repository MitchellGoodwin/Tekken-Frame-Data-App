class CharactersController < ApplicationController

    def index
        @characters = Character.all
    end

    def show
        @favorite = Favorite.new
        @character = Character.find(params[:id])
    end
end
