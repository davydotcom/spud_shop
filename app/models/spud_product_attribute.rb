class SpudProductAttribute < ActiveRecord::Base
  attr_accessible :spud_attribute_id, :spud_product_id, :value
  belongs_to :spud_attribute
  belongs_to :spud_product
  validates :spud_attribute_id,:presence=>true
  validates :spud_product_id,:presence=>true
  validates :value,:presence => true

  validates_uniqueness_of :spud_attribute_id,:scope => :spud_product_id
  
end
