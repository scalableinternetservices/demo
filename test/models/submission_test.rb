# frozen_string_literal: true

require 'test_helper'

class SubmissionTest < ActiveSupport::TestCase
  test 'can access expected attributes' do
    submission = new_submission
    assert_equal [], submission.comments
    assert_equal Community.last, submission.community
    assert_equal [], submission.root_comments
  end

  test 'fail to create submission with an invalid url' do
    ['', 'bad1'].each do |url|
      submission = new_submission(url: url)
      assert_predicate submission, :invalid?
      assert_equal({ url: ['is not a valid URL'] }, submission.errors.messages)
    end
  end

  test 'fail to create submission with too short of a title' do
    [nil, '', 'bad1'].each do |title|
      submission = new_submission(title: title)
      assert_predicate submission, :invalid?
      assert_equal({ title: ['is too short (minimum is 5 characters)'] }, submission.errors.messages)
    end

    assert_predicate new_submission(title: 'good1'), :valid?
  end

  test 'fail to create submission without a community' do
    submission = new_submission(community: nil)
    assert_predicate submission, :invalid?
    assert_equal({ community: ['must exist'] }, submission.errors.messages)
  end

  test 'successfully create submission' do
    assert_predicate new_submission, :valid?
  end
end
