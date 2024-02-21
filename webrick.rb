 # webrick.rb
require 'webrick'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

trap(:INT){
    server.shutdown
}

server.mount_proc("/form_get") do |req, res|
  #リクエストからデータを取得
  form_data = req.query

  #フォームから取得したデータの「name属性」をキーにして
  body = 
  "<html><body><head><meta charset='utf-8'></head><p>クエリパラメータは#{form_data }です</p><p>こんにちは#{form_data ["user_name"]}さん。あなたの年齢は#{form_data ["age"]}ですね</p></body></html>"

  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_post") do |req, res|
  #リクエストからデータを取得
  form_data = req.query

  #フォームから取得したデータの「name属性」をキーにして
  body = 
  "<html><body><head><meta charset='utf-8'></head><p>クエリパラメータは#{form_data }です</p><p>こんにちは#{form_data ["user_name"]}さん。あなたの年齢は#{form_data ["age"]}ですね</p></body></html>"

  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end
server.start
