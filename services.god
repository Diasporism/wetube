path = File.expand_path(File.dirname(__FILE__))


RAILS_ENV = "development"

CHAT_PORT = 3000
PLAYLIST_PORT = 3001
FRONTEND_PORT = 8000

God.watch do |w|
  w.name = "chat"
  w.start = "cd #{path}/wetube-chat/; RAILS_ENV=#{RAILS_ENV}  bundle exec thin start -p #{CHAT_PORT}"
  w.keepalive
end

God.watch do |w|
  w.name = "playlist"
  w.start = "cd #{path}/wetube-playlist/; RAILS_ENV=#{RAILS_ENV}  bundle exec thin start -p #{PLAYLIST_PORT}"
  w.keepalive
end

God.watch do |w|
  w.name = "frontend"
  w.start = "cd #{path}/wetube-frontend/; RAILS_ENV=#{RAILS_ENV}  bundle exec thin start -p #{FRONTEND_PORT}"
  w.keepalive
end

God.watch do |w|
  w.name = "faye"
  w.start = "cd #{path}/wetube-frontend/; rackup private_pub.ru -s thin -E production"
  w.keepalive
end