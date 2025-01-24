class Pool < ApplicationRecord
  belongs_to :city
  has_many :posts
  validates :name, presence: true
  validates :address, presence: true
end
