class StaticController < ApplicationController
  def home
		@posts = Post.order("created_at desc").limit(3)
  end

  def about
  end

  def portfolio
  end

  def contact
  end
end
