# frozen_string_literal: true

class Community < ApplicationRecord
  has_many :submissions, dependent: :destroy

  validates :name, length: { minimum: 4 }, uniqueness: true
end
