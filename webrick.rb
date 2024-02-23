 # webrick.rb
require 'webrick'
require "erb" # erbをrequireする記述が必要

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

trap(:INT){
    server.shutdown
}

# 実際のWebアプリはこれらの情報はDBから取得してきますが、今回はサンプルのため静的に定義しておきます。
foods = [
  { id: 1, name: "りんご", category: "fruits" },
  { id: 2, name: "バナナ", category: "fruits" },
  { id: 3, name: "いちご", category: "fruits" },
  { id: 4, name: "トマト", category: "vegetables" },
  { id: 5, name: "キャベツ", category: "vegetables" },
  { id: 6, name: "レタス", category: "vegetables" },
]

server.mount_proc("/foods") do |req, res|
  template = ERB.new( File.read('./foods/index.erb') )
  p req.query
  tmp = []
  # ここにロジックを書く
  if req.query != {} then
    x = req.query
    p x['food_list']
    if x['food_list'] == "all" then
      # foods テーブルのレコードを全て取得する
      p "if all"
      @foods = foods
      @list_selected_name = "all"

    elsif x['food_list'] == "fruits" then
      # foods テーブルのカテゴリーがfruitsのレコードを全て取得する
      p "if fruits"
      p foods
      foods.each do |food|
        if food[:category] == "fruits" then
            p food
            tmp.push(food)
        end
      end
      @foods = tmp
      @list_selected_name = "fruits"

    elsif x['food_list'] == "vegetables" then
      p "if vegetables"
      #foods テーブルのカテゴリーがvegetablesのレコードを全て取得する
      foods.each do |food|
        if food[:category] == "vegetables" then
            p food
            tmp.push(food)
        end
      end
      @foods = tmp
      @list_selected_name = "vegetables"
      
    else
      p "if none"
      @foods = foods
      @list_selected_name = "all"

    end 
  else
    @foods = foods   
  end
  res.body << template.result( binding )
end
server.start