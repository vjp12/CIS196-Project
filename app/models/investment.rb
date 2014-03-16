class Investment < ActiveRecord::Base
  belongs_to :stock
  belongs_to :member  

  validates :member, presence: true
  validates :stock, presence: true 

end
