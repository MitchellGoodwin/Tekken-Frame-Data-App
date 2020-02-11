class Post < ApplicationRecord
    belongs_to :forum
    belongs_to :user

    validates :content, length: { maximum: 500 }


    def username
        self.user.username
    end


    def user_pic
        self.user.pic
    end

    def user_location
        self.user.location
    end

    def last_edit
        if created_at == updated_at
            return "Created on: #{created_at.strftime("%m/%d/%Y at %I:%M%p")}"   
        else
            return "Edited on: #{updated_at.strftime("%m/%d/%Y at %I:%M%p")}"
        end
    end
end
