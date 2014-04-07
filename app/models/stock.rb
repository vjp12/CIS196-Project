class Stock < ActiveRecord::Base
	  validates :ticker, presence: true
end
