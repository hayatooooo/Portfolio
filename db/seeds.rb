Category.create!(name:"リーガ・エスパニョーラ")
Category.create!(name:"プレミアリーグ")
Category.create!(name:"ブンデスリーガ")
Category.create!(name:"セリエA")
Category.create!(name:"リーグ・アン")

SubCategory.create!(name:  "バルセロナ",
             category_id: 1,
)
SubCategory.create!(name:  "レアル・マドリード",
             category_id: 1,
)
SubCategory.create!(name:  "アトレティコ・マドリード",
             category_id: 1,
)
SubCategory.create!(name:  "リヴァプール",
             category_id: 2,
)
SubCategory.create!(name:  "マンチェスター・ユナイテッド",
             category_id: 2,
)
SubCategory.create!(name:  "マンチェスター・シティ",
             category_id: 2,
)
SubCategory.create!(name:  "バイエルン・ミュンヘン",
             category_id: 3,
)
SubCategory.create!(name:  "ドルトムント",
             category_id: 3,
)
SubCategory.create!(name:  "ライプツィヒ",
             category_id: 3,
)
SubCategory.create!(name:  "ユヴェントス",
             category_id: 4,
)
SubCategory.create!(name:  "インテル",
             category_id: 4,
)
SubCategory.create!(name:  "ミラン",
             category_id: 4,
)
SubCategory.create!(name:  "パリ・サンジェルマン",
             category_id: 5,
)
SubCategory.create!(name:  "モナコ",
             category_id: 5,
)
SubCategory.create!(name:  "マルセイユ",
             category_id: 5,
)
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             category_id:1,
             sub_category_id:1,
             introduction:"サンプルユーザーです。",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
              password_confirmation: password,
             category_id:2,
             sub_category_id:1,
             introduction:"テストユーザーです。",
              activated: true,
              activated_at: Time.zone.now)
end

  users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }