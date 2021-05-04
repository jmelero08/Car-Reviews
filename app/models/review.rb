class Review < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 11}
  
end
