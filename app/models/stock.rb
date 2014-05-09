class Stock < ActiveRecord::Base
	validates :ticker, presence: true
	validates :ticker, uniqueness: true
	validates :id, uniqueness: true
end