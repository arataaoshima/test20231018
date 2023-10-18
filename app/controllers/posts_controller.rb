class PostsController < ApplicationController

    before_action :authenticate_user

    before_action :find_post, only: [:edit, :update, :show, :destroy]

    def new
        @post = Post.new()
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path
        else
            render 'new'
        end
    end

    def index
        @posts = Post.all
    end

    def edit
    end

    def update
        if @post.update(post_params)
            redirect_to posts_path
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to posts_path
    end

    def show

    end

    private
    def post_params
        params.require(:post).permit(:title, :user_id, :content, category_ids: [])
    end

    def find_post
        @post = Post.find(params[:id])
    end
end