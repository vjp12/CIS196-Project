class Stock < ActiveRecord::Base
	  validates :ticker, presence: true
	  validates :name, presence: true
	  validates :price, presence: true
end
