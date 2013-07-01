puts `cd wetube-chat; bundle; rake db:drop; rake db:create; rake db:migrate; cd ..`
puts `cd wetube-frontend; bundle; rake db:drop; rake db:create; rake db:migrate; rake db:seed; cd ..`
puts `cd wetube-playlist; bundle; rake db:drop; rake db:create; rake db:migrate; cd ..`