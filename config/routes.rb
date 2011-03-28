Newaperio11::Application.routes.draw do
	scope "/" do
		get 'about' => 'static#about', :as => :about
		get 'portfolio' => 'static#portfolio', :as => :portfolio
		get 'contact' => 'static#contact', :as => :contact
		scope "blog" do
			scope "admin" do
				get "logout" => "sessions#destroy", :as => :logout
				get "login" => "sessions#new", :as => :login
				post "login" => "sessions#create", :as => :do_login
				constraints lambda { |req| req.session[:author_id].present? } do
					get "/" => "blog_admin#index", :as => :blog_admin_index
					post "/" => "blog_admin#create", :as => :blog_admin_create
					get "/new" => "blog_admin#new", :as => :blog_admin_new
					get "/:id/edit" => "blog_admin#edit", :as => :blog_admin_edit
					put "/:id" => "blog_admin#update", :as => :blog_admin_update
					delete "/:id" => "blog_admin#destroy", :as => :blog_admin_destroy
				end
			end
			get "/" => "posts#index", :as => :blog
			get "/:id" => "posts#show", :as => :post
		end
	end
	root :to => "static#home"
end
