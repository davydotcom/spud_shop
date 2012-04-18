class SpudProductPhoto < ActiveRecord::Base
  attr_accessible :caption, :display_order, :name, :photo_content_type, :photo_file_name, :photo_file_size, :spud_product_id
end
