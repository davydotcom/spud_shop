class SpudCart < ActiveRecord::Base
	has_many :spud_cart_items
	has_one :spud_order
end
