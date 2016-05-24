class PostsController < ApplicationController
     before_filter :get_post, only: [ :show, :edit, :update ]

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
        # authorize @post, :update?
    end
    
    def create
        @post = Post.new(post_params)
        
        if @post.save
            flash[:success] = "Post created successfully!"
            redirect_to user_posts_path(current_user.username)
        else
            flash[:danger] = "Unable to create post"
            render 'edit'
        end
    end
    
    def update
        authorize @post
        if @post.save
            redirect_to @post, flash[:success] = "Post updated successfully"
        else
            render 'edit'
        end
    end
    
    def destroy
        @post = Post.destroy(params[:id])
        flash[:success] = "Post successfully destroyed"

        redirect_to "/#{@post.user_username}/posts"
    end
    
    private
    def get_post
        @post = Post.friendly.find(params[:id])
    end
    
    def post_params
        params.require(:post).permit(:title, :body, :user_id, :user_username, :slug)
    end
end
