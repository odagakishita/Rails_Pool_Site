class User < ApplicationRecord
    has_secure_password
    mount_uploader :profile_image, ProfileImageUploader

    #バリデーションを追加
    validates :nickname, presence: true, length: { maximum: 50 }
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, confirmation: true, length: { minimum: 6 }, allow_blank: true
    has_one_attached :profile_image
end
