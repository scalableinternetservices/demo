# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test 'should create comment' do
    (submission = new_submission).save!

    assert_difference('Comment.count') do
      post :create, params: { comment: { message: 'Message', submission_id: submission } }
    end
    assert_redirected_to submission_path(Comment.last.submission)
    assert_equal 'Comment was successfully created.', flash[:notice]
  end

  test 'should fail to create comment' do
    (submission = new_submission).save!

    assert_no_difference('Comment.count') do
      post :create, params: { comment: { submission_id: submission } }
    end
    assert_response :unprocessable_entity
  end

  test 'should fail to create comment with invalid parent' do
    (submission = new_submission).save!

    assert_no_difference('Comment.count') do
      post :create, params: { comment: { parent_id: -1, message: '1', submission_id: submission } }
    end
    assert_redirected_to root_path
    assert_equal 'Could not save the comment.', flash[:error]
  end

  test 'should fail to create comment with invalid submission' do
    (submission = new_submission).save!

    assert_no_difference('Comment.count') do
      post :create, params: { comment: { message: '1', submission_id: -1 } }
    end
    assert_redirected_to root_path
    assert_equal 'Could not save the comment.', flash[:error]
  end

  test 'should destroy comment' do
    (comment = new_comment).save!

    assert_difference('Comment.count', -1) do
      delete :destroy, params: { id: comment }
    end
    assert_redirected_to submission_path(comment.submission)
    assert_equal 'Comment was successfully destroyed.', flash[:notice]
  end

  test 'should get new' do
    (comment = new_comment).save!

    get :new, params: { comment: { submission_id: comment.submission_id } }
    assert_response :ok
    assert_select 'form[action=?]', comments_path
  end
end
