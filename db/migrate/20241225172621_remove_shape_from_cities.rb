class RemoveShapeFromCities < ActiveRecord::Migration[7.0]
  def change
    remove_column :cities, :shape, :text
  end
end
