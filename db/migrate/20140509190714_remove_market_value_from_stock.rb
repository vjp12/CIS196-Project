class RemoveMarketValueFromStock < ActiveRecord::Migration
  def change
    remove_column :stocks, :market_value, :string
    remove_column :stocks, :decimal, :string
  end
end
