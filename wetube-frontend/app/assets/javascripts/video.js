var cache = {};
// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

function findCurrentVideo() {
    return playlist().children().first();
}

function playlist() {
    if (playlist in cache) {
        console.log("found something!")
        return cache[playlist];
    } else {
        console.log("MAN, we ain't found SHIT")
        return cache[playlist] = $('#playlists-container > div');
    }
}

function onYouTubeIframeAPIReady() {
    player = new YT.Player('video', {
        videoId: findCurrentVideo().data('video-id'),
        playerVars: {
            controls: 0,
            modestbranding: 1,
            rel: 0,
            showinfo: 0,
            iv_load_policy: 3,
            disablekb: 1
        },
        events: {
            // 'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
}

function onPlayerStateChange(event) {
    if (event.data === YT.PlayerState.ENDED) {
        findCurrentVideo().remove();
        player.loadVideoById(findCurrentVideo().data('video-id'));

//        Update ActiveRecord playlist to match
    }
}