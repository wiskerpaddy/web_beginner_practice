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

# erb を使うにはこういった記述が必要。理解する必要はありません。このまま使いましょう。
WEBrick::HTTPServlet::FileHandler.add_handler("erb", WEBrick::HTTPServlet::ERBHandler)
server.config[:MimeTypes]["erb"] = "text/html"

server.mount_proc("/hello") do |req, res|
  template = ERB.new( File.read('hello.erb') )
  # 現在時刻についてはインスタンス変数をここで定義してみるといいかも？
  @time = DateTime.now
  res.body << template.result( binding )
end
server.start
