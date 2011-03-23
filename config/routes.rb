Newaperio11::Application.routes.draw do
	scope "/" do
		get 'about' => 'static#about', :as => :about
		get 'portfolio' => 'static#portfolio', :as => :portfolio
		get 'contact' => 'static#contact', :as => :contact
	end
	
	scope "/blog" do
		scope "/admin" do
			get "logout" => "sessions#destroy", :as => "logout"
			get "login" => "sessions#new", :as => "login"
			post "login" => "sessions#create", :as => "do_login"
			constraints lambda { |req| !req.session[:author_id].blank? } do
			end
		end
		get "/" => "posts#index", :as => :blog
		get "/:id" => "posts#show", :as => :post
	end

	root :to => "static#home"
end
