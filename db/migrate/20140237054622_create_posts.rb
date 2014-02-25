class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :text
      t.belongs_to :stock, index: true
      t.belongs_to :member, index: true

      t.timestamps
    end
  end
end
