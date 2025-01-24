class AddUrlToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :url, :string
  end
end
