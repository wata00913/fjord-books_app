# frozen_string_literal: true

print '開発環境のデータをすべて削除して初期データを投入します。よろしいですか？[Y/n]: ' # rubocop:disable Rails/Output
unless $stdin.gets.chomp == 'Y'
  puts '中止しました。' # rubocop:disable Rails/Output
  return
end

def picture_file(name)
  File.open(Rails.root.join("db/seeds/#{name}"))
end

Book.destroy_all

Book.create!(
  title: 'Ruby超入門',
  memo: 'Rubyの文法の基本をやさしくていねいに解説しています。',
  author: '五十嵐 邦明',
  picture: picture_file('cho-nyumon.jpg')
)

Book.create!(
  title: 'チェリー本',
  memo: 'プログラミング経験者のためのRuby入門書です。',
  author: '伊藤 淳一',
  picture: picture_file('cherry-book.jpg')
)

Book.create!(
  title: '楽々ERDレッスン',
  memo: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！',
  author: '羽生 章洋',
  picture: picture_file('erd.jpg')
)

50.times do
  Book.create!(
    title: Faker::Book.title,
    memo: Faker::Book.genre,
    author: Faker::Book.author,
    picture: picture_file('no-image.png')
  )
end

User.destroy_all

image_sample = { io: picture_file('cho-nyumon.jpg'), filename: 'cho-nyumon.jpg' }
50.times do |n|
  name = Faker::Name.name
  User.create!(
    email: "sample-#{n}@example.com",
    password: 'password',
    name: name,
    postal_code: "123-#{n.to_s.rjust(4, '0')}",
    address: Faker::Address.full_address,
    self_introduction: "こんにちは、#{name}です。",
    image: n == 1 ? image_sample : nil
  )
end

puts '初期データの投入が完了しました。' # rubocop:disable Rails/Output
