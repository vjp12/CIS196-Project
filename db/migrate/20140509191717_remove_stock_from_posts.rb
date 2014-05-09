class RemoveStockFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :stock, :string
    remove_column :posts, :string, :string
  end
end
