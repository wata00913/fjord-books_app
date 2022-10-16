# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  COMMON_TEST_PASSWORD = 'password'
  SELF_REPORT_LINE_NUM = 0
  OTHER_REPORT_LINE_NUM = 1

  setup do
    @alice = users(:alice)
    login_as(@alice)
  end

  def login_as(user)
    visit root_url

    fill_in 'Eメール', with: user.email
    fill_in 'パスワード', with: COMMON_TEST_PASSWORD

    click_on 'ログイン'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '日報テスト'
    fill_in '内容', with: '日報を提出できました'
    click_on '登録する'

    assert_text '日報が作成されました。'
  end

  test 'edit a Report' do
    visit reports_url

    self_report_line = all('tbody tr')[SELF_REPORT_LINE_NUM]
    self_report_line.click_on '詳細'

    click_on '編集'

    fill_in 'タイトル', with: '日報テスト'
    fill_in '内容', with: '日報を再提出しました'
    click_on '更新する'

    assert_text '日報が更新されました。'
  end

  test 'can not edit others Report' do
    visit reports_url

    other_report_line = all('tbody tr')[OTHER_REPORT_LINE_NUM]

    assert other_report_line.has_no_link? '編集'
    other_report_line.click_on('詳細')

    # 日報の編集リンクがないため、編集の文字を含むリンクはアカウントの編集リンクのみ
    assert has_link?('編集', count: 1)
  end

  test 'destroy a Report' do
    visit reports_url

    accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
