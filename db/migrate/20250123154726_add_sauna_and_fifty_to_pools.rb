class AddSaunaAndFiftyToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :sauna, :boolean
    add_column :pools, :fifty, :boolean
  end
end
