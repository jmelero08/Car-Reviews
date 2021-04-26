class Vehicle < ApplicationRecord
  belongs_to :type
  belongs_to :user #creator
  has_many :reviews
  has_many :users, through: :reviews
end
