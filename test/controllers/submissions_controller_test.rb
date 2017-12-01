# frozen_string_literal: true

require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  test 'should create submission' do
    (community = new_community).save!

    assert_difference('Submission.count') do
      post :create, params: { submission: { community_id: community, title: 'Learning to garden well', url: 'http://www.gardning.com/advanced' } }
    end
    assert_redirected_to submission_path(Submission.last)
    assert_equal 'Submission was successfully created.', flash[:notice]
  end

  test 'should destroy submission' do
    (submission = new_submission).save!

    assert_difference('Submission.count', -1) do
      delete :destroy, params: { id: submission }
    end
    assert_redirected_to root_path
    assert_equal 'Submission was successfully destroyed.', flash[:notice]
  end

  test 'should fail to create submission' do
    assert_no_difference('Submission.count') do
      post :create, params: { submission: { title: nil } }
    end
    assert_response :unprocessable_entity
  end

  test 'should get index' do
    get :index
    assert_response :ok
  end

  test 'should get new' do
    get :new
    assert_response :ok
    assert_select 'form[action=?]', submissions_path
  end

  test 'should show submission' do
    (submission = new_submission(title: 'Unique Title')).save!

    get :show, params: { id: submission }
    assert_response :ok
    assert_select 'h1', 'Unique Title'
  end
end
