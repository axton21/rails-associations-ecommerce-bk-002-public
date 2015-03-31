class User < ActiveRecord::Base
  has_many :stores, :foreign_key => "owner_id"
  has_many :products_for_sale, :through => :stores, :source => :products
  has_many :potential_sales, :through => :products_for_sale


  has_many :carts, :foreign_key => "buyer_id"
  has_many :potential_purchases, :through => :carts, :source => :line_items
end