class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_vehicles, through: :reviews, source: :vehicle
    has_many :vehicles #they created
end
