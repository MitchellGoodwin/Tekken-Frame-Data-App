class Character < ApplicationRecord
    has_many :moves
    has_one :forum
end
