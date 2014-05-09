class RemoveInvestorsFromStocks < ActiveRecord::Migration
  def change
    remove_column :stocks, :investors, :integer
  end
end
