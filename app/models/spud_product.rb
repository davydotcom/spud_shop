class SpudProduct < ActiveRecord::Base
	searchable
	has_many :spud_product_prices
	validates :name,:presence => true,:uniqueness => true
	# validates :item_number,:presence => true,:uniqueness => true,:if => 

	def active?
		return self.active
	end
end
