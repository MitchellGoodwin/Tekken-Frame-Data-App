class User < ApplicationRecord
    has_many :posts
    has_many :forums, through: :posts

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true
end
