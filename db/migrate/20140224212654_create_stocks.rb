class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :name
      t.decimal :price
      t.decimal :market_value
      t.integer :investors

      t.timestamps
    end
  end
end
