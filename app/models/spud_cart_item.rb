class SpudCartItem < ActiveRecord::Base
	belongs_to :spud_cart
	belongs_to :spud_product
	before_save :update_cart_item

	def update_cart_item
		if self.spud_product_id.blank? == false
			self.description = self.spud_product.name
			self.unit_price = self.spud_product.unit_price
			self.full_price = self.spud_product.full_price(self.quantity)
		end
	end
end
