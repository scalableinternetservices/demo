class Community < ApplicationRecord
  has_many :submissions

  validates :name, uniqueness: true
  validates :name, length: { minimum: 4 }
end
