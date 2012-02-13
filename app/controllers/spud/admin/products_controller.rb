class Spud::Admin::ProductsController < Spud::Admin::ApplicationController
	belongs_to_spud_app :products
	before_filter :load_product,:only => [:edit,:update,:destroy,:show]
	add_breadcrumb "Products", :spud_admin_products_path
	def index
		@products = SpudProduct.order(:name).paginate :page => params[:page]
		respond_with @products
	end

	def new
		add_breadcrumb "New", :new_spud_admin_product_path
		@product = SpudProduct.new
		respond_with @product
	end

	def create
		add_breadcrumb "New", :new_spud_admin_product_path
		@product = SpudProduct.new(params[:spud_product])
		if @product.save
			flash[:notice] = "Product successfully saved."
		else
			flash[:error] = "Error saving the product."
		end

		respond_with @product,:location => spud_admin_products_url
	end

	def edit
		add_breadcrumb "Edit", :edit_spud_admin_product_path
		respond_with @product
	end

	def update
		add_breadcrumb "Edit", :edit_spud_admin_product_path
		if @product.update_attributes(params[:spud_product])
			flash[:notice] = "Product saved successfully"
		else
			flash[:error] = "Error saving this product!"
		end
		respond_with @product,:location => spud_admin_products_url
	end

	def destroy
		if @product.destroy
			flash[:notice] = "Product removed successfully!"
		else
			flash[:error] = "Error creating the product."
		end
		respond_with @product,:location => spud_admin_products_url
	end

private
	def load_product
		@product = SpudProduct.find(params[:id])
		if @product.blank?
			flash[:error] = "Product not found!"
			redirect_to spud_admin_products_url() and return
		end
	end
end
