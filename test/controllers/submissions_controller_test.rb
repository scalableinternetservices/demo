require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :ok
    assert_not_nil assigns(:submissions)
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post :create, params: { submission: { community_id: @submission.community, title: 'Learning to garden well', url: 'http://www.gardning.com/advanced' } }
    end

    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should show submission" do
    get :show, params: { id: @submission }
    assert_response :ok
  end

  test "should get edit" do
    get :edit, params: { id: @submission }
    assert_response :ok
  end

  test "should update submission" do
    patch :update, params: { id: @submission, submission: { community_id: @submission.community_id, title: @submission.title, url: @submission.url } }
    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete :destroy, params: { id: @submission }
    end

    assert_redirected_to submissions_path
  end
end
