class PostsController < ApplicationController
  def index
		@posts = Post.order("created_at desc").page(params[:page]).per(10)
  end

  def show
		@post = Post.find(params[:id])
  end

	def search
		@posts = Post.search(params[:term]).page(params[:page]).per(10)
	end
end
