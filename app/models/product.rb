class Product < ActiveRecord::Base
  belongs_to :store
  delegate :seller, :to => :store
  has_many :potential_sales, :class_name => "LineItem"
  has_many :carts, :through => :potential_sales
  has_many :buyers, :through => :carts
end