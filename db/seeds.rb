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
User.create!(name:  "管理者",
             email: "example@gmail.com",
             password:              "example",
             password_confirmation: "example",
             category_id:1,
             sub_category_id:1,
             introduction:"サンプルユーザー(管理者)です。",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "田中 太郎",
             email: "example-1@gmail.com",
             password:              "example",
             password_confirmation: "example",
             category_id:2,
             sub_category_id:4,
             introduction:"サンプルユーザー1です。",
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "山田 花子",
             email: "example-2@gmail.com",
             password:              "example",
             password_confirmation: "example",
             category_id:3,
             sub_category_id:7,
             introduction:"サンプルユーザー2です。",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "吉田 祐介",
             email: "example-3@gmail.com",
             password:              "example",
             password_confirmation: "example",
             category_id:4,
             sub_category_id:10,
             introduction:"サンプルユーザー3です。",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "青山 恵子",
             email: "example-4@gmail.com",
             password:              "example",
             password_confirmation: "example",
             category_id:5,
             sub_category_id:13,
             introduction:"サンプルユーザー4です。",
             activated: true,
             activated_at: Time.zone.now)
             
User.create!(name:  "Michael",
             email: "example-5@gmail.com",
             password:              "example",
             password_confirmation: "example",
             category_id:5,
             sub_category_id:15,
             introduction:"サンプルユーザー5です。",
             activated: true,
             activated_at: Time.zone.now)

  users = User.order(:created_at).take(6)
1.times do
  content = "初Tweetです！！"
  users.each { |user| user.microposts.create!(content: content) }
end

  users = User.order(:created_at).take(6)
1.times do
  content = "よろしくお願いします！"
  users.each { |user| user.microposts.create!(content: content) }
end

# リレーションシップ
users = User.all
user  = users.first
following = users[2..6]
followers = users[3..5]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }