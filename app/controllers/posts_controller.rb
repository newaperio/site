class PostsController < ApplicationController
  def index
		@posts = Post.order("created_at desc").page(params[:page]).per(10)
  end

  def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = Comment.new(:post => @post)
  end

	def search
		@posts = Post.front_end_search(params[:term]).page(params[:page]).per(10)
	end
	
	def category
		@category = Category.find_by_name(params[:id])
		@posts = Post.where("category_id = ?",@category.id).page(params[:page]).per(10)
	end
	
	def feed
	  @posts = Post.order("created_at DESC").limit(20) 
	  respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_post_index_url("atom"), :status => :moved_permanently }
	  end
	end
end
