class ForumsController < ApplicationController

    def index
        @forums = Forum.all
    end

    def show
        @forum = Forum.find(params[:id])
        @post = Post.new
    end
end
