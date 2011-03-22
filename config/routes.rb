Newaperio11::Application.routes.draw do
	scope "/" do
		get 'about' => 'static#about', :as => :about
		# match 'portfolio' => 'static#portfolio', :as => :portfolio
		get 'contact' => 'static#contact', :as => :contact
	end
	
	scope "/blog" do
		get "/" => "posts#index", :as => :blog
		get "/:id" => "posts#show", :as => :post
	end

	root :to => "static#home"
end
