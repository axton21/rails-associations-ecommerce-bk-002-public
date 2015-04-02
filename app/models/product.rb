class Product < ActiveRecord::Base
	belongs_to :store
	delegate :seller, to: :store, class_name: "User"

	has_many :line_items
	has_many :potential_sales, foreign_key: "product_id", class_name: "LineItem"
	has_many :carts, through: :line_items
	has_many :buyers, through: :carts
end
