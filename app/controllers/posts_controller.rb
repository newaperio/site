class PostsController < ApplicationController
  def index
		@posts = Post.order("created_at desc").page(params[:page]).per(10)
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