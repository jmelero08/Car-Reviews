class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_vehicles, through: :reviews, source: :vehicle
    has_many :vehicles #they created
    validates :username, uniqueness: true, presence: true
    has_secure_password
end
