class StaticController < ApplicationController
  def home
		@posts = Post.order("created_at desc").where("post_type_id = ?",1).limit(3)
  end

  def about
  end

  def portfolio
  end

  def contact
  end
end
