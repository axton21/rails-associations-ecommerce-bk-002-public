class Store < ActiveRecord::Base
  has_many :products_for_sale, :source => :products, :class_name => "Product"
  belongs_to :owner, :class_name => "User"
  belongs_to :seller, :class_name => "User", :foreign_key => :owner_id
end