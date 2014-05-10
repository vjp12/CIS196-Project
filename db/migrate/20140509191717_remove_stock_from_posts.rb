class RemoveStockFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :stock, :string
  end
end
