class Forum < ApplicationRecord
    belongs_to :character
    has_many :posts
    has_many :users, through: :posts

    def character_name
        self.character.proper_name
    end
end
