class RemoveActiveInvestmentsFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :active_investments, :value
  end
end
