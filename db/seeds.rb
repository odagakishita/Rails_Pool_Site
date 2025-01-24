# データベースのリセット
Post.destroy_all
User.destroy_all
Pool.destroy_all
City.destroy_all

# 都市データの作成
cities = [
  { name: "横浜市", slug: "yokohama" },
  { name: "川崎市", slug: "kawasaki" },
  { name: "相模原市", slug: "sagamihara" },
  { name: "横須賀市", slug: "yokosuka" },
  { name: "藤沢市", slug: "fujisawa" },
  { name: "小田原市", slug: "odawara" },
  { name: "茅ヶ崎市", slug: "chigasaki" },
  { name: "平塚市", slug: "hiratsuka" },
  { name: "鎌倉市", slug: "kamakura" },
  { name: "逗子市", slug: "zushi" },
  { name: "三浦市", slug: "miura" },
  { name: "秦野市", slug: "hadano" },
  { name: "厚木市", slug: "atsugi" },
  { name: "大和市", slug: "yamato" },
  { name: "伊勢原市", slug: "isehara" },
  { name: "海老名市", slug: "ebina" },
  { name: "座間市", slug: "zama" },
  { name: "南足柄市", slug: "minamiashigara" },
  { name: "その他", slug: "others" }
]

cities.each do |city_data|
  City.create!(city_data)
end
puts "Cities created: #{City.count}"

# プールデータの作成
pools = [
  { name: "川崎市民プラザ", address: "川崎市高津区", city_slug: "kawasaki", adult_price: 500, child_price: 200, indoor: true, outdoor: false, sauna: false, fifty: false, url: "https://www.kawasaki-shiminplaza.jp/sisetu/pool/" },
  { name: "ヨネッティー王禅寺", address: "川崎市麻生区", city_slug: "kawasaki", adult_price: 330, child_price: 110, indoor: true, outdoor: false, sauna: true, fifty: false, url: "https://www.sportsoasis.co.jp/sh41/" },
  { name: "入江崎余熱利用プール", address: "川崎市川崎区", city_slug: "kawasaki", adult_price: 520, child_price: 200, indoor: true, outdoor: false, sauna: false, fifty: true, url: "https://www.sportsoasis.co.jp/sh43/" },
  { name: "横浜市西スポーツセンター", address: "横浜市西区", city_slug: "yokohama", adult_price: 300, child_price: 100, indoor: true, outdoor: false, sauna: false, fifty: false, url: "https://www.sportsoasis.co.jp/sh47/" },
  { name: "秋葉台公園温水プール", address: "藤沢市", city_slug: "fujisawa", adult_price: 400, child_price: 100, indoor: true, outdoor: true, sauna: true, fifty: true, url: "https://f-mirai.jp/sports/pool/akibadai-2-2" },
  { name: "八部公園屋内プール", address: "藤沢市", city_slug: "fujisawa", adult_price: 400, child_price: 100, indoor: true, outdoor: true, sauna: false, fifty: true, url: "https://f-mirai.jp/sports/pool/happe" }
]

pools.each do |pool_data|
  city = City.find_by(slug: pool_data[:city_slug])
  if city
    Pool.create!(
      name: pool_data[:name],
      address: pool_data[:address],
      city: city,
      adult_price: pool_data[:adult_price],
      child_price: pool_data[:child_price],
      indoor: pool_data[:indoor],
      outdoor: pool_data[:outdoor],
      sauna: pool_data[:sauna],
      fifty: pool_data[:fifty],
      url: pool_data[:url]
    )
  else
    puts "City not found for slug: #{pool_data[:city_slug]}"
  end
end
puts "Pools created: #{Pool.count}"

# ユーザーデータの作成
users = [
  { name: "小田垣椎太", email: "odagaki.job@gmail.com", password: "password", nickname: "shita" },
  { name: "田中太郎", email: "tanaka.taro@example.com", password: "password", nickname: "taro" },
  { name: "山田花子", email: "yamada.hanako@example.com", password: "password", nickname: "hanako" },
  { name: "鈴木一郎", email: "suzuki.ichiro@example.com", password: "password", nickname: "ichiro" },
  { name: "佐藤美咲", email: "sato.misaki@example.com", password: "password", nickname: "misaki" }
]

users.each do |user_data|
  User.create!(user_data)
end
puts "Users created: #{User.count}"

# 投稿データの作成
pools = Pool.all.to_a
users = User.all.to_a
posts = [
  { title: "初めての投稿", content: "これはテスト用の投稿です。", category: "レビュー", review_rating: 5, routine_steps: [] },
  { title: "田中太郎の投稿", content: "こんにちは、田中です！", category: "ルーティーン", routine_steps: ["プールで泳ぐ", "体操をする"] },
  { title: "山田花子の思い", content: "私はプールが大好きです！", category: "レビュー", review_rating: 4, routine_steps: [] },
  { title: "鈴木一郎のレビュー", content: "このプールは最高でした！", category: "レビュー", review_rating: 3, routine_steps: [] },
  { title: "佐藤美咲の体験談", content: "また行きたいと思います。", category: "ルーティーン", routine_steps: ["ウォームアップ", "泳ぐ"] }
]

posts.each_with_index do |post_data, index|
  user = users[index % users.length] # ユーザーを順番に割り当てる
  pool = pools.sample # プールをランダムに割り当てる
  Post.create!(
    title: post_data[:title],
    content: post_data[:content],
    category: post_data[:category],
    review_rating: post_data[:review_rating],
    routine_steps: post_data[:routine_steps],
    user: user,
    pool: pool
  )
end
puts "Posts created: #{Post.count}"
