class PostsController < ApplicationController
     before_filter :get_post, only: [ :show, :edit, :update, :destroy ]

    def index
        user = User.friendly.find(params[:username])
        @posts = Post.where(user_id: user)
    end
    
    def show
    end
    
    def new
        @post = Post.new
    end
    
    def edit
    end
    
    def create
        @post = Post.new(post_params)
        
        if @post.save
            flash[:success] = "Post created successfully!"
            redirect_to post_path(@post)
        else
            flash[:danger] = "Unable to create post"
            render 'edit'
        end
    end
    
    def update
    end
    
    def destroy
        @post = Post.destroy(params[:id])
        
        redirect_to user_posts_path
    end
    
    private
    def get_post
        @post = Post.friendly.find(params[:id])
    end
    
    def post_params
        params.require(:post).permit(:title, :body, :user_id, :user_username, :slug)
    end
end
