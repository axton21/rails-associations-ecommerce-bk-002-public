class Product < ActiveRecord::Base
  belongs_to :store

  has_many :potential_sales, :class_name => "LineItem"
end