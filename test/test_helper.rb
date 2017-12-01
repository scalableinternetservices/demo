# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all

  private

  def new_comment(message: 'Comment', parent_id: nil, submission: :DEFAULT)
    if submission == :DEFAULT
      submission = Submission.first
      (submission = new_submission).save! if submission.nil?
    end
    Comment.new(message: message, parent_id: parent_id, submission: submission)
  end

  def new_community(name: 'Community')
    Community.new(name: name)
  end

  def new_submission(community: :DEFAULT, title: 'Submission', url: 'http://localhost')
    if community == :DEFAULT
      community = Community.first
      (community = new_community).save! if community.nil?
    end
    Submission.new(community: community, title: title, url: url)
  end
end
