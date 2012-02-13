module Spud
  module Shop
    include ActiveSupport::Configurable

    config_accessor :currency,:currency_symbol,:cart_expires_in
    
    self.currency = "USD"
    self.currency_symbol = "$"
    self.cart_expires_in = 60.minutes
  end
end