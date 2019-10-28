class PostsController < ApplicationController
  def index
    # Return all `Post` or Search matches
    @posts = Post.search(params[:search])
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    # Return view to create a new Post
    @post = Post.new
  end

  def create
    # Add a new `Post` to the database
    @post = Post.new(params.require(:post).permit(:title, :body))
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    # Remove a `Post` from the database
      @post = Post.find(params[:id])
  	  @post.destroy
 
      redirect_to posts_path
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body, :search)
  end
end
