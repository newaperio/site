class SessionsController < ApplicationController
	def new
	end

	def create
	  author = Author.authenticate(params[:email], params[:password])
	  if author
	    session[:author_id] = author.id
	    redirect_to root_url, :notice => "Logged in!"
	  else
	    flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end

	def destroy
	  session[:author_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
	end
end
