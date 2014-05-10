class Investment < ActiveRecord::Base
  belongs_to :stock
  belongs_to :member

  validates :stock, presence: true
  validates :member, presence: true
  validates :share_change, presence: true
end
