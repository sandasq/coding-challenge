class CommentsController < ApplicationController
  def create
    # Add a new `Comment` to the database
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
    
  def edit
    # Edit an existing `Comment`
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end
  
  def update
    # Update an existing `Comment` in the database
    @post = Post.find(params[:post_id])
    @comment = @post.comments.update(comment_params)
    redirect_to post_path(@post)
  end
  
  def destroy
    # Remove a 'Comment' from the database
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    
    redirect_to post_path(@post)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
