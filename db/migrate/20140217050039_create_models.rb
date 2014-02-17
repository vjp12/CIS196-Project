class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :Companies
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
