class PostsController < ApplicationController
    before_action :set_post, only: [:destroy, :edit, :update]

    def create
        @post = Post.new(new_post_params)
        @post.user = current_user
        if @post.save
            redirect_to forum_path(params[:forum_id])
        else
            render forum_path(params[:forum_id])
        end
    end

    def edit
        session[:return_to] ||= request.referer
        return head(:forbidden) unless current_user == @post.user
    end

    def update
        if @post.update(new_post_params)
            redirect_to session.delete(:return_to)
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to session.delete(:return_to)
    end

    private

    def new_post_params
        params.permit(:content, :forum_id)
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end

end
