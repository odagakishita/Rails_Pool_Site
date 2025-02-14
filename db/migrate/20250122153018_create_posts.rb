class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :category
      t.text :routine_steps
      t.integer :review_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
