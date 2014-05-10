class RemoveMarketValueFromStock < ActiveRecord::Migration
  def change
    remove_column :stocks, :market_value, :string
  end
end
