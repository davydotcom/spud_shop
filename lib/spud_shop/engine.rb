require 'spud_shop'
require 'active_merchant'
require 'active_shipping'
module Spud
	module Shop
		 class Engine < Rails::Engine
			engine_name :spud_shop
			initializer :admin do
				Spud::Core.configure do |config|
				  config.admin_applications += [{:name => "Products",:thumbnail => "spud/admin/template_thumb.png",:url => "/spud/admin/products",:order => 12}]
				end
			end
			initializer :assets do |config| 
				Rails.application.config.assets.precompile += [ 
				     "spud/admin/template*"
				]
			 end
		 end
	end
end
