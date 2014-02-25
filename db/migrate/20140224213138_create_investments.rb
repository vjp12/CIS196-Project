class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.belongs_to :member, index: true
      t.belongs_to :stock, index: true
      t.decimal :share_change

      t.timestamps
    end
  end
end
