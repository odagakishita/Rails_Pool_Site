class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|
      t.string :name
      t.string :address
      t.references :city, null: false, foreign_key: true
      #外部キーとしてcity_idを追加
      t.timestamps
    end
  end
end
