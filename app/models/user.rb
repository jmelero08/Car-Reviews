class User < ApplicationRecord
    has_many :reviews
    has_many :vehicles, through: :reviews
    has_many :vehicles #that they created
end
