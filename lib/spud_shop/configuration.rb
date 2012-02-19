module Spud
  module Shop
    include ActiveSupport::Configurable

    config_accessor :currency,:currency_symbol,:cart_expires_in,:use_item_number,:base_layout,:fixed_shipping,:mail_carrier,:origin_location,:shipping_enabled,:carrier_credentials,:shipping_countries,:sales_tax_rate
	self.base_layout = 'application'    
    self.currency = "USD"
    self.currency_symbol = "$"
    self.cart_expires_in = 60.minutes
    self.use_item_number = false

    self.shipping_enabled = true
    self.fixed_shipping = true
    self.mail_carrier = "UPS"
    self.carrier_credentials = {}
    self.origin_location = nil
    self.sales_tax_rate = 0.07 #Seven Percent?

    self.shipping_countries = [["United States","US"],["Canada","CA"]]
  end
end