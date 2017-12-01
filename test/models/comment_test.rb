# frozen_string_literal: true

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'can access expected attributes' do
    comment = new_comment
    assert_nil comment.parent
    assert_equal Submission.last, comment.submission
    assert_equal [], comment.replies
  end

  test 'fail to create comment with an invalid parent' do
    comment = new_comment(parent_id: -1)
    assert_predicate comment, :invalid?
    assert_equal({ parent: ["can't be blank"] }, comment.errors.messages)
  end

  test 'fail to create comment with too short of a message' do
    [nil, ''].each do |message|
      comment = new_comment(message: message)
      assert_predicate comment, :invalid?
      assert_equal({ message: ['is too short (minimum is 1 character)'] }, comment.errors.messages)
    end

    assert_predicate new_comment(message: '1'), :valid?
  end

  test 'fail to create comment without a submission' do
    comment = new_comment(submission: nil)
    assert_predicate comment, :invalid?
    assert_equal({ submission: ['must exist'] }, comment.errors.messages)
  end

  test 'successfully create comment' do
    assert_predicate new_comment, :valid?
  end

  test 'successfully create comment with parent' do
    new_comment.save!

    assert_predicate new_comment(parent_id: Comment.last.id), :valid?
  end
end
