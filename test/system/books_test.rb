# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)

    login_as users(:alice)
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'

    header = all('thead th')
    ['タイトル', 'メモ', '著者', '画像', ''].each_with_index do |expected, idx|
      header[idx].has_text? expected
    end

    tbody = all('tbody tr')
    lines = [
      ['チェリー本', 'プログラミング経験者のためのRuby入門書です。', '伊藤 淳一', '詳細', '編集', '削除'],
      ['Ruby超入門', 'Rubyの文法の基本をやさしくていねいに解説しています。', '五十嵐 邦明', '詳細', '編集', '削除']
    ]
    lines.each_with_index do |line, lidx|
      line.each_with_index do |expected, cidx|
        tbody[lidx].all('td')[cidx].has_text? expected
      end
    end
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'メモ', with: @book.memo
    fill_in 'タイトル', with: @book.title
    click_on '登録する'

    assert_text '本が作成されました。'
  end

  test 'updating a Book' do
    visit books_url

    # click_onでは本の編集リンクを特定出来ない。そこで下記のような処理を行う。
    # 本一覧の先頭行を特定し、その行の編集リンクをクリックする
    book_line = all('tbody tr')[0]
    book_line.click_on '編集'

    fill_in 'メモ', with: @book.memo
    fill_in 'タイトル', with: @book.title
    click_on '更新する'

    assert_text '本が更新されました。'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
