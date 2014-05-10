class Investment < ActiveRecord::Base
  belongs_to :stock
  belongs_to :member

  validates :stock, presence: true
  validates :member, presence: true
  validates :share_change, presence: true
  validate :share_change_not_zero

  def share_change_not_zero
  	errors.add(:base, "Cannot purchase zero shares!") if (share_change == 0)
  end
end
