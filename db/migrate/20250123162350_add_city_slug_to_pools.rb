class AddCitySlugToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :city_slug, :string
  end
end
