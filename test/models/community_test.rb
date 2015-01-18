require 'test_helper'

class CommunityTest < ActiveSupport::TestCase
  test 'create community success' do
    community = Community.new name: 'Good'
    assert community.valid?

    community = Community.new name: 'A really long valid community name'
    assert community.valid?
  end

  test 'community name must be at least 4 characters' do
    community = Community.new name: nil
    assert community.invalid?

    community = Community.new name: ''
    assert community.invalid?

    community = Community.new name: 'Bad'
    assert community.invalid?

    community = Community.new name: 1
    assert community.invalid?
  end

  test 'community name must be unique' do
    community = Community.new name: communities(:one).name
    assert community.invalid?
    assert_equal({ name: ['has already been taken'] }, community.errors.messages)
  end
end
