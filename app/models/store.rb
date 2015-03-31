class Store < ActiveRecord::Base
  has_many :products
  belongs_to :owner, :class_name => "User"
  belongs_to :seller, :class_name => "User", :foreign_key => :owner_id
end