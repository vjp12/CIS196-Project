class Portfolio < ActiveRecord::Base
  belongs_to :member
  has_many :investments
  has_many :stocks
end
