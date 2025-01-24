class AddDetailsToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :adult_price, :integer
    add_column :pools, :child_price, :integer
    add_column :pools, :indoor, :boolean
    add_column :pools, :outdoor, :boolean
  end
end
