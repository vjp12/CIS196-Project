class Post < ActiveRecord::Base
  belongs_to :member

  validates :body, length: {maximum: 200}, presence: true 
end
