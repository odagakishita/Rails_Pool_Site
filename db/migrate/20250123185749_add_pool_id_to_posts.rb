class AddPoolIdToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :pool_id, :integer
  end
end
