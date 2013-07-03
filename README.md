[![Code Climate](https://codeclimate.com/github/Diasporism/wetube.png)](https://codeclimate.com/github/Diasporism/wetube)

WeTube
======

#### About WeTube

WeTube is an open source project for gSchool, built by [Geoff Schorkopf](http://www.github.com/gschorkopf), [Paul Blackwell](http://www.github.com/pnblackwell), [Logan Sears](http://www.github.com/Diasporism), and [Kyle Suss](http://www.github.com/kylesuss). The app implements service-oriented design; this repository contains three services (a frontend, playlist API, and chat API), a gem directory, and several rake commands, capistrano files, and spec files.

The product is a way to watch YouTube videos simultaneously with friends. Think of it as [turntable.fm](http://turntable.fm) for video playlists. You can enter "theaters" (the seed data contains three - a theater for music videos, adorable animals, and sports plays) and chat with friends, add new videos, and play and pause videos as a group. Note: yes, we know that right now that things can get pretty trolly. Please be kind to your neighbor. We're working on a feature to solve that.

The graph below depicts our multi-app platform, and how the pieces intersect:

![System Setup](http://i.imgur.com/m5RfEpg.png)

#### Visit WeTube's production site

![WeTube Production](http://i.imgur.com/yJCVdyt.jpg)

Production server is available at [www.we-tube.us](http://www.we-tube.us).

#### Install WeTube locally

To install and deploy:
* Pull down repository
* `gem install god`
* `gem install postgres`
* `postgres start` (or your system's equivalent) 
* `ruby bundle.rb`
* `god -c services.god -D`


The last command will run a procfile/god command, starting several local servers and faye through private pub. In the change that you run into an error with bundle.rb, you may then have to enter chat, frontend, and playlist individually and run a 'rake db:migrate' to migrate the development databases. 

Finally, enter frontend and run `rake db:seed` to set up some initial theaters.

To run tests, run `ruby rspec.rb` from the root directory. This will run a db:test:prepare on all relevant subdirectories and run the spec files.

To debug individual services, cd into the app's directory and run `tail -f log/development.log` to keep watch of the log file as events come in. It will output all raises and puts statements.

#### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#### Contact

We all use twitter, so feel free to contact us there:

* [Geoff Schorkopf](http://twitter.com/gschork)
* [Paul Blackwell](http://twitter.com/pnblackwell)
* [Logan Sears](https://twitter.com/diasporism)
* [Kyle Suss](http://twitter.com/kylesuss)
