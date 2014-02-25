class Post < ActiveRecord::Base
  belongs_to :stock
  belongs_to :member
end
