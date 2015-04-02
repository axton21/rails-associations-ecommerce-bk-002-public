class Store < ActiveRecord::Base
	belongs_to :seller, class_name: 'User'
	has_many :products

	has_many :products_for_sale, foreign_key: "store_id", class_name: "Product"
end
