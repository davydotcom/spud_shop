class SpudProductCategory < ActiveRecord::Base
  attr_accessible :description, :name, :spud_product_category_id
  belongs_to :spud_product_category
  has_many :spud_product_product_categories
  has_many :spud_products,:through => :spud_product_product_categories

  validates :name,:presence => true
  validates_uniqueness_of :name,:scope => :spud_product_category_id
end
