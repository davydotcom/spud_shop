Rails.application.routes.draw do
	namespace :spud do
		namespace :admin do
			resources :products
		end
	end
   
end

