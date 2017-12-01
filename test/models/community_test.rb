# frozen_string_literal: true

require 'test_helper'

class CommunityTest < ActiveSupport::TestCase
  test 'can access expected attributes' do
    community = new_community
    assert_equal [], community.submissions
  end

  test 'fail to create community with too short of a name' do
    [nil, '', 'bad'].each do |name|
      community = new_community(name: name)
      assert_predicate community, :invalid?
      assert_equal({ name: ['is too short (minimum is 4 characters)'] }, community.errors.messages)
    end

    assert_predicate new_community(name: 'good'), :valid?
  end

  test 'fail to create duplicate community' do
    new_community.save!

    community = new_community
    assert_predicate community, :invalid?
    assert_equal({ name: ['has already been taken'] }, community.errors.messages)
  end

  test 'successfully create community' do
    assert_predicate new_community, :valid?
  end
end
