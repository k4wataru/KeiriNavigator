# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(
  email: "admin@admin",
  password: "admin1"
)
# アカウントの作成
users = [
  { name: "accounting_manager1", email: "accounting_manager1@example.com", password: "123456", job: "会計担当者" },
  { name: "entrepreneur2", email: "entrepreneur2@example.com", password: "abcdef", job: "企業経営者" },
  { name: "freelancer3", email: "freelancer3@example.com", password: "password", job: "個人事業主" },
  { name: "accounting_staff4", email: "accounting_staff4@example.com", password: "test123", job: "会計担当者" },
  { name: "smallbiz_owner5", email: "smallbiz_owner5@example.com", password: "password123", job: "企業経営者" },
  { name: "freelancer6", email: "freelancer6@example.com", password: "freelance123", job: "個人事業主" },
  # 追加のアカウント情報をここに追加
]

users.each do |user_params|
  User.create(user_params)
end

# 質問の作成
posts = [
  { title: "インボイス制度の最新情報について", content: "最近のインボイス制度の変更について教えてください。", user: User.find_by(name: "accounting_manager1") },
  { title: "電子帳簿保存法の適用範囲について", content: "電子帳簿保存法はどのような場合に適用されるのでしょうか？", user: User.find_by(name: "entrepreneur2") },
  { title: "税務申告の締め切りについて", content: "法人税の確定申告の締め切りはいつですか？", user: User.find_by(name: "accounting_staff4") },
  { title: "中小企業向けの会計ソフトについて", content: "中小企業向けのオンライン会計ソフトでおすすめのものはありますか？", user: User.find_by(name: "smallbiz_owner5") },
  # 追加の質問情報をここに追加
]

posts.each do |post_params|
  Post.create(post_params)
end

# コメントの作成
comments = [
  { content: "インボイス制度に関する最新情報はこちらのリンクから確認できます。[リンク](https://example.com)", user: User.find_by(name: "freelancer3"), post: Post.find_by(title: "インボイス制度の最新情報について") },
  { content: "ありがとうございます！", user: User.find_by(name: "accounting_manager1"), post: Post.find_by(title: "インボイス制度の最新情報について") },
  { content: "法人税の確定申告の締め切りは、一般的に3月15日です。", user: User.find_by(name: "accounting_staff4"), post: Post.find_by(title: "税務申告の締め切りについて") },
  { content: "ありがとうございます！参考にします。", user: User.find_by(name: "smallbiz_owner5"), post: Post.find_by(title: "中小企業向けの会計ソフトについて") },
  # 追加のコメント情報をここに追加
]

comments.each do |comment_params|
  Comment.create(comment_params)
end

# 投稿のジャンルの作成
genres = [
  { name: "インボイス制度" },
  { name: "電子帳簿保存法" },
  { name: "法人税" },
  { name: "会計ソフトウェア" },
  # 追加のジャンル情報をここに追加
]

genres.each do |genre_params|
  Genre.create(genre_params)
end

# グループの作成
groups = [
  { name: "会計情報共有グループ", introduction: "会計情報を共有し、最新の税務情報や法律に関する議論を行います。" },
  { name: "中小企業経営者交流会", introduction: "中小企業経営者同士で情報交換を行うためのグループです。" },
  { name: "経理疑問解決グループ", introduction: "経理に関する疑問やトラブルを解決するためのグループです。" },
  # 追加のグループ情報をここに追加
]

groups.each do |group_params|
  Group.create(group_params)
end

# ユーザーをグループに追加
group_users = [
  { user: User.find_by(name: "accounting_manager1"), group: Group.find_by(name: "会計情報共有グループ") },
  { user: User.find_by(name: "entrepreneur2"), group: Group.find_by(name: "中小企業経営者交流会") },
  { user: User.find_by(name: "freelancer6"), group: Group.find_by(name: "経理疑問解決グループ") },
  # 追加のユーザーとグループの関連情報をここに追加
]

group_users.each do |group_user_params|
  GroupUser.create(group_user_params)
end