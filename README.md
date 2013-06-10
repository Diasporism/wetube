WeTube
======

Turntable.fm is pretty cool, but looking at those little characters is boring. So we built a collaborative music listening & watching service where you can:

* Create or join a room with friends
* We can watch music videos together
* Add music videos to a queue
* Have a chat room where we can discuss the music / video while it’s playing
* Get a message in the room when a video begins
* "Favorite" videos, creating a list I can replay later

Installation:
=============

* Fork it
* Clone it
* Bundle
* In one terminal run "rackup faye.ru -s thin -E production" (this will take up your terminal window)
* In another terminal run "rails s" (this will also take up your terminal window)
* Navigate to localhost:3000 and have fun