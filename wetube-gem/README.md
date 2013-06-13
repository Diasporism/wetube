# WetubeGem

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'wetube'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wetube

## Usage

1.9.3-p374 > Wetube::Playlist.find(5)
 => #<Hashie::Mash created_at="2013-06-13T22:23:50Z" id=5 videos=[]>
1.9.3-p374 > Wetube::Playlist.find_or_create_video(5, {title: "Yolo", url: "Nola"})
 => #<Hashie::Mash duration=nil id=3 title="Yolo" uploaded_at=nil uploader=nil url="Nola">
1.9.3-p374 > Wetube::Playlist.find(5)
 => #<Hashie::Mash created_at="2013-06-13T22:23:50Z" id=5 videos=[#<Hashie::Mash duration=nil id=3 title="Yolo" uploaded_at=nil uploader=nil url="Nola">]>
1.9.3-p374 > Wetube::Playlist.find(5).videos
 => [#<Hashie::Mash duration=nil id=3 title="Yolo" uploaded_at=nil uploader=nil url="Nola">]
1.9.3-p374 > Wetube::Playlist.find(5).videos.first
 => #<Hashie::Mash duration=nil id=3 title="Yolo" uploaded_at=nil uploader=nil url="Nola">

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
