Theater.create([ 
  {name: "James Blake Videos", genre: "Music Videos"},
  {name: "Hilarious Animals", genre: "Music Videos"},
  {name: "Top Plays of 2013", genre: "Music Videos"},
  {name: "Music From James Blakes EPs", genre: "Music Videos"},
  {name: "James Blakes DJing Prowess", genre: "Music Videos"}
])

# James Blake Videos
videos = ['6p6PcFFUm5I']
playlist_id = Theater.find_by_name("James Blake Videos").playlist_id
videos.each do |video_id|
  meta = Video.fetch_metadata(video_id)
  Wetube::Playlist.find_or_create_video(
    playlist_id,
    { video_id:  video_id,
      title:     meta[:title],
      thumbnail: meta[:thumbnail],
      duration:  meta[:duration]
    })
end