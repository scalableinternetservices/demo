# frozen_string_literal: true

class Community < ApplicationRecord
  has_many :submissions

  validates :name, length: { minimum: 4 }, uniqueness: true
end
