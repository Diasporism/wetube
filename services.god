path = File.expand_path(File.dirname(__FILE__))

RAILS_ENV = 'development'

God.watch do |w|
  w.name = 'chat'
  w.start = 'cd #{path}/wetube-chat/; rails s -p 3000'
  w.keepalive
end

God.watch do |w|
  w.name = 'playlist'
  w.start = 'cd #{path}/wetube-playlist/; rails s -p 3001'
  w.keepalive
end
