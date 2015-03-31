class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
  delegate :buyer, :to => :cart
  delegate :store, :to => :product
  delegate :seller, :to => :store
end