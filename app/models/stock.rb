class Stock < ActiveRecord::Base
	  validates :name, presence: true
	  validates :price, presence: true

	  priceFormatValidation = /[\d]+[.]\d{2}/
	  validates :price, format: {with: priceFormatValidation} 
end
