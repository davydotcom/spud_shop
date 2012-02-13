class SpudProduct < ActiveRecord::Base
	searchable
	has_many :spud_product_prices
    accepts_nested_attributes_for :spud_product_prices, :reject_if => lambda { |a| a[:price_code].blank? }, :allow_destroy => true

	validates :name,:presence => true,:uniqueness => true
	# validates :item_number,:presence => true,:uniqueness => true,:if => 

	def active?
		return self.active
	end
end
