class AddTickerToStock < ActiveRecord::Migration
  def change
    add_column :stocks, :ticker, :string
  end
end
