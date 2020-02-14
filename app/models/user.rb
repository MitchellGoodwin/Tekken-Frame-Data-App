class User < ApplicationRecord
    has_many :posts, dependent: :destroy
    has_many :forums, through: :posts
    has_many :favorites, dependent: :destroy
    has_many :characters, through: :favorites
    has_many :reports, through: :posts, dependent: :destroy

    validates :username, presence: true
    validates :username, uniqueness: true

    has_secure_password
    

    def pic
        if self.picture_link
            return picture_link
        else
            return "//style.anu.edu.au/_anu/4/images/placeholders/person.png"
        end
    end
end
