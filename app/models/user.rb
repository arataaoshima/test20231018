class User < ApplicationRecord
    validates :username, presence:true, uniqueness:true, length: {minimum:3}
    validates :email, presence:true, uniqueness:true
    validates :password, {length:{minimum:5},allow_nil: true}

    has_many :posts
    has_one_attached :user_image
    has_secure_password
end