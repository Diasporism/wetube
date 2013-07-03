[![Code Climate](https://codeclimate.com/github/Diasporism/wetube.png)](https://codeclimate.com/github/Diasporism/wetube)

wetube
======

visit www.we-tube.us

To install and deploy:
* Pull down file.
* gem install god
* gem install postgres
* postgres start
* god -c services.god -D


This will run a procfile/god command, starting several local servers and faye through private pub.

You will then have to enter chat, frontend, and playlist individually and run a 'rake db:migrate' to migrate the development databases. Finally, enter frontend and run 'rake db:seed' to set up some initial theaters.

To run tests, enter any of chat, frontend, gem, or playlist. Run 'rake db:test:prepare' to migrate the test databases. Run 'bundle exec rspec spec'. Note: in the gem directory, there is no need to run db:test:prepare.

To debug individual services, cd into the app's directory and run 'tail -f log/development.log' to keep watch of the log file as events come in. It will output all raises and puts statements.

![System Setup](http://i.imgur.com/m5RfEpg.png)
