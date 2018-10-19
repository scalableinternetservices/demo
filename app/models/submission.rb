# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :community
  has_many :comments, dependent: :destroy

  validates :title, length: { minimum: 5 }
  validates :url, url: true

  has_many :root_comments, ->{ where parent_id: nil}, class_name: 'Comment'
end
