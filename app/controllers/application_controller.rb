class ApplicationController < ActionController::Base
  protect_from_forgery

	helper_method :current_user

	private

	def current_user
	  @current_user ||= Author.find(session[:author_id]) if session[:author_id]
	end
end
