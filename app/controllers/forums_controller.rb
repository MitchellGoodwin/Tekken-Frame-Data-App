class ForumsController < ApplicationController

    def index
        @forums = Forum.all
    end

    def show
        @forum = Forum.find(params[:id])
        @posts = @forum.posts.order(created_at: :desc).page(params[:page])
        @post = Post.new
    end
end
