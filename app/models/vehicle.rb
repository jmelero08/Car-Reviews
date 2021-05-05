class Vehicle < ApplicationRecord
  belongs_to :type
  belongs_to :user #creator
  has_many :reviews
  has_many :users, through: :reviews
  accepts_nested_attributes_for :type

  validates :name, presence: true
  validates :year, presence: true
  validate :not_a_duplicate




  def not_a_duplicate
    vehicle = Vehicle.find_by(name: name, year: year, type_id: type_id)
    if !!vehicle && vehicle != self
      errors.add(:name, 'has already been added for that type')
    end
  end
end
