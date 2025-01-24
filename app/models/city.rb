class City < ApplicationRecord
    has_many :pools, dependent: :destroy
end
