class Post < ApplicationRecord
    belongs_to :forum
    belongs_to :user

    paginates_per 5

    validates :content, length: { maximum: 500 }


    def username
        user.username
    end

    def self.size
        Post.all.size
    end

    def page
        ((forum.posts.all.reverse.find_index(self) + 1)/5) + 1
    end

    def user_pic
        user.pic
    end

    def user_location
        user.location
    end

    def last_edit
        if created_at == updated_at
            return "Created on: #{created_at.strftime("%m/%d/%Y at %I:%M%p")}"   
        else
            return "Edited on: #{updated_at.strftime("%m/%d/%Y at %I:%M%p")}"
        end
    end
end
