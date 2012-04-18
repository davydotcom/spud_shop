class SpudProductProductCategory < ActiveRecord::Base
  attr_accessible :spud_product_categoriy_id, :spud_product_id
  belongs_to :spud_product
  belongs_to :spud_product_category
  
  validates :spud_product_id,:presence => true
  validates :spud_product_category_id,:presence => true
end
