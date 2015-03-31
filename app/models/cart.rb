class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :buyer, :class_name => "User", :foreign_key => :owner_id
  belongs_to :owner, :class_name => "User"
  has_many :products, :through => :line_items
  has_many :stores, :through => :products
end