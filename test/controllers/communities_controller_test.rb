# frozen_string_literal: true

require 'test_helper'

class CommunitiesControllerTest < ActionController::TestCase
  test 'should create community' do
    assert_difference('Community.count') do
      post :create, params: { community: { name: 'Programming' } }
    end
    assert_redirected_to community_path(Community.last)
    assert_equal 'Community was successfully created.', flash[:notice]
  end

  test 'should destroy community' do
    new_community.save!

    assert_difference('Community.count', -1) do
      delete :destroy, params: { id: Community.last }
    end
    assert_redirected_to root_path
    assert_equal 'Community was successfully destroyed.', flash[:notice]
  end

  test 'should fail to create community' do
    assert_no_difference('Community.count') do
      post :create, params: { community: { name: nil } }
    end
    assert_response :unprocessable_entity
  end

  test 'should get new' do
    get :new
    assert_response :ok
    assert_select 'form[action=?]', communities_path
  end

  test 'should show community' do
    new_community(name: 'Unique Name').save!

    get :show, params: { id: Community.last }
    assert_response :ok
    assert_select 'h1', 'Unique Name'
  end

  private

  def new_community(name: 'Valid Community')
    Community.new(name: name)
  end
end
