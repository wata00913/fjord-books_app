# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @carol = users(:carol)
    @anonymous = users(:anonymous)
  end

  test 'Alice follow Bob' do
    @alice.follow(@bob)

    assert @alice.following?(@bob)
    assert @bob.followed_by?(@alice)
  end

  test 'carol unfollow alice' do
    @carol.unfollow(@alice)

    assert_not @carol.following?(@alice)
    assert_not @alice.followed_by?(@carol)
  end

  test 'return name if user name is presence' do
    assert_equal 'Alice', @alice.name_or_email
  end

  test 'return email if user name is not presence' do
    assert_equal 'sample-4@example.com', @anonymous.name_or_email
  end
end
