require 'test_helper'

class CommunitiesControllerTest < ActionController::TestCase
  setup do
    @community = communities(:one)
  end

  test "should get index" do
    get :index
    assert_response :ok
    assert_not_nil assigns(:communities)
  end

  test "should get new" do
    get :new
    assert_response :ok
  end

  test "should create community" do
    assert_difference('Community.count') do
      post :create, params: { community: { name: "Programming" } }
    end

    assert_redirected_to community_path(assigns(:community))
  end

  test "should show community" do
    get :show, params: { id: @community }
    assert_response :ok
  end

  test "should get edit" do
    get :edit, params: { id: @community }
    assert_response :ok
  end

  test "should update community" do
    patch :update, params: { id: @community, community: { name: @community.name } }
    assert_redirected_to community_path(assigns(:community))
  end

  test "should destroy community" do
    assert_difference('Community.count', -1) do
      delete :destroy, params: { id: @community }
    end

    assert_redirected_to communities_path
  end
end
