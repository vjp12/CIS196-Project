class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.decimal :funds
      t.integer :active_investments
      t.decimal :value

      t.timestamps
    end
  end
end
