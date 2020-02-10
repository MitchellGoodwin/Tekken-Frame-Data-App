class Character < ApplicationRecord
    has_many :moves
    has_one :forum

    def proper_name
        self.name.split("-").map(&:capitalize).join(" ")
    end
end
