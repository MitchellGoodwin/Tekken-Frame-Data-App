class Post < ApplicationRecord
    belongs_to :forum
    belongs_to :user

    validates :content, length: { maximum: 500 }


    def username
        self.user.username
    end


    def user_pic
        self.user.picture_link
    end

    def user_location
        self.user.location
    end
end
