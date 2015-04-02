class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product
	delegate :buyer, to: :cart, class_name: 'User'
	delegate :store, to: :product
	delegate :seller, to: :store, class_name: 'User'
end
