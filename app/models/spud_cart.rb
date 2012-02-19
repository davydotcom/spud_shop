class SpudCart < ActiveRecord::Base
	include ActiveMerchant::Shipping
	has_many :spud_cart_items
	has_one :spud_order

	accepts_nested_attributes_for :spud_cart_items, :allow_destroy => true


	def add_product_to_cart(product,quantity)
		cart_item = self.spud_cart_items.all.select{|ci| ci.spud_product_id == product.id}
		if cart_item.blank?
			self.spud_cart_items.create(:spud_product_id => product.id,:quantity => quantity)
		else
			cart_item = cart_item[0]
			cart_item.update_attributes(:quantity => cart_item.quantity + quantity)
		end
	end


	def packages
		packages = []
		self.spud_cart_items.each do |item|
			[1..item.quantity].each do |q|
				packages += [Package.new(item.spud_product.package_weight * 16,[item.spud_product.package_width,item.spud_product.package_length,item.spud_product.package_height],:units => :imperial)]
			end
			
		end

		return packages
	end
	def fixed_ship_price
		price = 0.0
		self.spud_cart_items.each do |item|
			[1..item.quantity].each do |q|
				price += item.spud_product.fixed_ship_cost
			end
			
		end

		return price
	end
	def subtotal
		total_price = 0
		self.spud_cart_items.all.each{|i| total_price += i.full_price}
		return total_price
	end
end
