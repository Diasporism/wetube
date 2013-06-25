puts `cd wetube-chat; rake db:test:prepare; rspec; cd ..`
puts `cd wetube-frontend; rake db:test:prepare; rspec; cd ..`
puts `cd wetube-playlist; rake db:test:prepare; rspec; cd ..`
puts `cd wetube-gem; rspec; cd ..`