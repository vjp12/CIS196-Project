class RemoveMembersFromPortfolio < ActiveRecord::Migration
  def change
    remove_column :portfolios, :Members, :integer
  end
end
