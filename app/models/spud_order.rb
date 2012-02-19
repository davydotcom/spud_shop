class SpudOrder < ActiveRecord::Base
	belongs_to :cart
	attr_accessor :card_number, :card_verification
	before_save :calculate_prices

	def activeshipping_destination
		if self.ship_same_as_billing
			return {:country => self.bill_country,:state => self.bill_state,:city => self.bill_city,:zip => self.bill_zip}
		else
			return {:country => self.shipping_country,:state => self.shipping_state,:city => self.shipping_city,:zip => self.shipping_zip}
		end
	end


	def calculate_prices
		self.tax_price = (self.subtotal_price*Spud::Shop.sales_tax_rate).round(2)
		self.total_price = self.subtotal_price + self.tax_price + self.shipping_price
	end
end
