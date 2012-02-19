class SpudProduct < ActiveRecord::Base
	searchable
	has_many :spud_product_prices
    accepts_nested_attributes_for :spud_product_prices, :reject_if => lambda { |a| a[:price_code].blank? }, :allow_destroy => true

	validates :name,:presence => true,:uniqueness => true
	validates :base_price,:presence => true
	# validates :item_number,:presence => true,:uniqueness => true,:if => 

	def active?
		return self.active
	end

	def full_price(qty)
		return unit_price * qty
	end

	def unit_price
		return self.base_price
	end
end
