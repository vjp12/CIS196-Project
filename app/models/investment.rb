class Investment < ActiveRecord::Base
  belongs_to :name
  belongs_to :stock
end
