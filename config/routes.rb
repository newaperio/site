Newaperio11::Application.routes.draw do
	# scope "/" do
	# 	match 'about' => 'static#about', :as => :about
	# 	match 'portfolio' => 'static#portfolio', :as => :portfolio
	# 	match 'contact' => 'static#contact', :as => :contact
	# end

	root :to => "static#home"
end
