class Post < ApplicationRecord
  belongs_to :pool, optional: true # optional: true を指定するとnil でもエラーにならない
  belongs_to :user

  serialize :routine_steps, Array #こうすると配列として扱える


  validates :title, presence: true
  validates :category, inclusion: { in: %w(ルーティーン レビュー)}
  validates :review_rating, inclusion: { in: 1..5 }, if: -> { category == "レビュー" }
  #もしカテゴリをレビューにしてたら
end
