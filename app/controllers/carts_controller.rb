class CartsController < ApplicationController
	layout Spud::Shop.base_layout
	before_filter :load_cart
include ActiveMerchant::Shipping
include ActionView::Helpers::NumberHelper

	def show
	end


	def add
		if params[:product_id].blank?
			flash[:error] = "Product not specified!"
			redirect_to cart_url and return
		end
		@product = SpudProduct.where(:active => true,:id => params[:product_id]).first
		if @product.blank?
			flash[:error] = "Product not available!"
			redirect_to cart_url and return
		end
		quantity = params[:quantity].blank? ? 1 : params[:quantity].to_i
		if quantity > 0
			@current_cart.add_product_to_cart(@product,quantity)
		end
		redirect_to cart_url() and return
	end

	def update
		if @current_cart.update_attributes(params[:spud_cart])
			flash[:notice] = "Cart updated"
		else
			flash[:error] = "Error updating cart"
		end
		redirect_to cart_path() and return
	end

	def checkout
		@order = SpudOrder.new
	end
	def pay
		@order = @current_cart.spud_order
		if @order.blank?
			@order = SpudOrder.new()
			@order.spud_cart_id = @current_cart
		end
		@order.attributes = params[:spud_order]
		@order.subtotal_price = @current_cart.subtotal
		if Spud::Shop.fixed_shipping
			@order.shipping_price @current_cart.fixed_ship_price
			@order.shipping_method = "Fixed Price: #{@order.shipping_price}"
		end
		if !@order.save
			flash[:error] = "Whoops! Something went wrong while saving your order."
			redirect_to checkout_cart_path() and return
		end
		carrier = eval(Spud::Shop.mail_carrier).new(Spud::Shop.carrier_credentials)
		if carrier.blank?
			flash[:error] = "Whoops! Error getting shipping carrier. Try again later"
			redirect_to checkout_cart_path() and return
		end
		if !Spud::Shop.fixed_shipping
			response = carrier.find_rates(Location.new(Spud::Shop.origin_location),Location.new(@order.activeshipping_destination),@current_cart.packages)
			@shipping_rates = response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}
			if @shipping_rates.blank?
				flash[:error] = "Whoops! Error getting shipping rates!"
				redirect_to checkout_cart_path() and return
			end

			@shipping_options = @shipping_rates.collect{|s| ["#{s[0]} - #{number_to_currency s[1]*0.01, :unit => Spud::Shop.currency_symbol + " ", :precision => 2}",s[0]]}
		

		end
		# redirect_to cart_path() and return

	end

	
private
	def load_cart
		if !session[:cart_id].blank?
			@current_cart = SpudCart.where(:id => session[:cart_id]).includes(:spud_cart_items => [:spud_product]).first
			if @current_cart.blank?
				@current_cart = SpudCart.create(:session_id => session[:id])
				session[:cart_id] = @current_cart.id
			end
		else
			@current_cart = SpudCart.create(:session_id => session[:id])
			session[:cart_id] = @current_cart.id
		end
	end
end
