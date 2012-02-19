Rails.application.routes.draw do
	namespace :spud do
		namespace :admin do
			resources :products
		end
	end

	resource :cart do
		member do
			get 'add'
			get 'checkout'
			post 'pay'
		end
	end
   
end

