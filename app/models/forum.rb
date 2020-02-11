class Forum < ApplicationRecord
    belongs_to :character
    has_many :posts
    has_many :users, through: :posts

    def character_name
        self.character.proper_name
    end

    def last_post
        posts.last
    end

    def last_user_pic
        last_post.user.pic
    end

    def last_user_name
        last_post.user.username
    end

    def last_post_time
        last_post.last_edit
    end

    def content
        last_post.content
    end
end
