class AddProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :profile_image, :string
  end
end
