# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  COMMON_TEST_PASSWORD = 'password'

  def login_as(user)
    visit root_url

    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: COMMON_TEST_PASSWORD

    click_on 'ログイン'
  end
end
