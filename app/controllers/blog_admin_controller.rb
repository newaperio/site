class BlogAdminController < ApplicationController
  def index
		if current_user
			@posts = Post.order("created_at desc").page(params[:page]).per(10)
		else
			redirect_to login_path, :notice => "You must be logged in to do that."
		end
  end

  def new
		@post = Post.new
  end

  def create
		@post = Post.new(params[:post])
		if @post.save
			redirect_to blog_admin_index_path, :notice => "Post successfully added."
		else
			flash[:notice] = "Error adding post."
			render :action => "new"
		end
  end

  def edit
		@post = Post.find(params[:id])
  end

  def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to blog_admin_index_path, :notice => "Post successfully updated."
		else
			flash[:notice] = "Error updating post."
			render :action => "edit"
		end
  end

  def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to blog_admin_index_path, :notice => "Post successfully deleted."
  end
end
