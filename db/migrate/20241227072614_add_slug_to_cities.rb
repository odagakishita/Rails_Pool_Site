class AddSlugToCities < ActiveRecord::Migration[7.0]
  def change
    add_column :cities, :slug, :string
  end
end
