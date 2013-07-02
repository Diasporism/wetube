Theater.create([ 
  {name: "James Blake Videos", genre: "Music Videos"},
  {name: "Hilarious Animals", genre: "Music Videos"},
  {name: "Top Plays of 2013", genre: "Music Videos"}
])

# James Blake Videos
videos1 = ['6p6PcFFUm5I', 'AlaRjP8pg0Q', 'MVgEaDemxjc', 'oOT2-OTebx0', 'dOKXHzL6UVs']
playlist1 = Theater.find_by_name("James Blake Videos").playlist_id
videos1.each do |video_id|
  meta = Video.fetch_metadata(video_id)
  Wetube::Playlist.find_or_create_video(
    playlist1,
    { video_id:  video_id,
      title:     meta[:title],
      thumbnail: meta[:thumbnail],
      duration:  meta[:duration]
    })
end

# Funny Animal Videos
videos2 = ['D36JUfE1oYk', 'baqebCZe9Xg', 'L8fMePzrGVU', 'rFTRmjimtCc', '2Tgwrkk-B3k']
playlist2 = Theater.find_by_name("Hilarious Animals").playlist_id
videos2.each do |video_id|
  meta = Video.fetch_metadata(video_id)
  Wetube::Playlist.find_or_create_video(
    playlist2,
    { video_id:  video_id,
      title:     meta[:title],
      thumbnail: meta[:thumbnail],
      duration:  meta[:duration]
    })
end

# Top Play Videos
videos3 = ['uirM5sljfO8', 'gC44nP7ClxM', '_Jmisv1Spck', 'br2QVozDaA0', 'OnFWhYHvoWQ']
playlist3 = Theater.find_by_name("Top Plays of 2013").playlist_id
videos3.each do |video_id|
  meta = Video.fetch_metadata(video_id)
  Wetube::Playlist.find_or_create_video(
    playlist3,
    { video_id:  video_id,
      title:     meta[:title],
      thumbnail: meta[:thumbnail],
      duration:  meta[:duration]
    })
end