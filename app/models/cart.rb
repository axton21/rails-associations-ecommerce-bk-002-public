class Cart < ActiveRecord::Base
	belongs_to :buyer, class_name: "User"
	has_many :line_items
	has_many :products, through: :line_items
	has_many :stores, through: :products
end
