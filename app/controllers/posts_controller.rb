class PostsController < ApplicationController
  def index
		@posts = Post.order("created_at desc").page(params[:page]).per(10)
  end

  def show
		@post = Post.find(params[:id])
		@comments = @post.comments.page(params[:page]).per(20)
		@comment = Comment.new(:post => @post)
  end

	def search
		@posts = Post.front_end_search(params[:term]).page(params[:page]).per(10)
	end
	
	def category
		@category = Category.find_by_name(params[:id])
		@posts = Post.where("category_id = ?",@category.id).page(params[:page]).per(10)
	end
end
