class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.new(params[:comment])
 
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to(@comment.post)
    else
      flash[:notice] = "Please fill out all the required comment fields."
      @post = Post.find(params[:post_id])
  		@comments = @post.comments.page(params[:page]).per(20)
      render :action => "posts/show"
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
 
    redirect_to(@comment.post)
  end
end
