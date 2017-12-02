# frozen_string_literal: true

class Submission < ApplicationRecord
  belongs_to :community
  has_many :comments, dependent: :destroy

  validates :title, length: { minimum: 5 }
  validates :url, url: true

  def root_comments
    comments.where parent_id: nil
  end
end
