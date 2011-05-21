Newaperio11::Application.routes.draw do
  ActiveAdmin.routes(self)
	get 'about' => 'static#about', :as => :about
	get 'portfolio' => 'static#portfolio', :as => :portfolio
	get 'contact' => 'static#contact', :as => :contact
	resources :blog, :as => "post", :controller => "posts", :only => [:index, :show] do
	  collection do
	    get "search"
	    get "category/:id" => "posts#category", :as => :category
	  end
	  resources :comments, :only => [:show, :create]
	end
	root :to => "static#home"
end
