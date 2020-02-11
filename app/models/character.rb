class Character < ApplicationRecord
    has_many :moves
    has_one :forum
    has_many :favorites
    has_many :users, through: :favorites

    def proper_name
        self.name.split("-").map(&:capitalize).join(" ")
    end
end
