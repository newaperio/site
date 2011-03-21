Newaperio11::Application.routes.draw do
	scope "/" do
		get 'about' => 'static#about', :as => :about
		# match 'portfolio' => 'static#portfolio', :as => :portfolio
		get 'contact' => 'static#contact', :as => :contact
	end

	root :to => "static#home"
end
