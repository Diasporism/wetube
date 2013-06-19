// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player = '';
function onYouTubeIframeAPIReady() {
    player = new YT.Player('video', {
        videoId: gon.playlist[0],
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange
        }
    });
}

function onPlayerReady(event) {
    event.target.playVideo();
}

function onPlayerStateChange(event) {
    if (event.data === YT.PlayerState.ENDED) {
        console.log("Video " + gon.playlist[0] + " completed");
        $("#playlists-container > ul").children().first().remove();
        player.loadVideoById(gon.playlist[1]);
        gon.playlist.shift();
    }
}