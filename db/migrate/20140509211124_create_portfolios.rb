class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :funds_remaining
      t.string :market_value
      t.belongs_to :Members, index: true

      t.timestamps
    end
  end
end
