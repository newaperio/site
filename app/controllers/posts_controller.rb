class PostsController < ApplicationController
  def index
		@posts = Post.order("id").page(params[:page]).per(10)
  end

  def show
		@post = Post.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
