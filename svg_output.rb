require 'nokogiri'
require 'json'

# SVGファイルのパス
svg_file_path = 'kanagawa_pref.svg'
# JSONファイルの保存先
output_json_path = 'output.json'

# SVGファイルを読み込み
svg_content = File.read(svg_file_path)
doc = Nokogiri::XML(svg_content)

# データを格納するハッシュ
data = {}

# gタグを解析
doc.css('g').each do |g_tag|
  id = g_tag['id']
  next unless id # idが存在する場合のみ処理

  # すべてのpathタグを取得
  paths = g_tag.css('path').map { |path_tag| path_tag['d'] }.compact
  data[id] = paths unless paths.empty? # pathsが空でなければデータを格納
end

# JSONファイルに保存
File.open(output_json_path, 'w') do |file|
  file.write(JSON.pretty_generate(data))
end

puts "データがJSON形式で保存されました: #{output_json_path}"