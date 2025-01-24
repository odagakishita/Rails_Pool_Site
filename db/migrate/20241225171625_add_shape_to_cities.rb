class AddShapeToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :shape, :text
  end
end
