class AddMemberIdToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :member_id, :integer
  end
end
