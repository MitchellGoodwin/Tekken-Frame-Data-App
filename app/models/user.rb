class User < ApplicationRecord
    has_many :posts
    has_many :forums, through: :posts
    has_many :favorites
    has_many :characters, through: :favorites

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true

    validates_uniqueness_of :user_id, :scope => :character_id

    def pic
        if self.picture_link
            return picture_link
        else
            return "//style.anu.edu.au/_anu/4/images/placeholders/person.png"
        end
    end
end
