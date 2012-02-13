class SpudOrder < ActiveRecord::Base
	belongs_to :cart
	attr_accessor :card_number, :card_verification,
end
