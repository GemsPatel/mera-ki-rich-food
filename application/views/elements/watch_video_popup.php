<style>
	.modal-dialog { width: 70%; }
	.modal-header { padding: 5px; }
	.modal-header .close {
	    margin-top: 5px;
	    margin-right: 5px;
	}
	.modal-body {
	    position: relative;
	    padding: 13px;
	    margin-top: -13px;
	}
</style>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/styles/default.min.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/styles/tomorrow.min.css">
<div class="modal" id="modal_ads_description_<?php echo $product_id?>" aria-hidden="false" style="display:none">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header block">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
				<div style="color: rgb(119, 119, 119); font-size:15px;" class="block-title modal-title center">
					<span>You can watch minimum 1 minute this video and earm Rs 2.</span>
					<label class="hide" onclick="doTimer()">Start count!</label>
					<input class="hide" type="text" id="txt" />
					<label class="hide" onclick="stopCount()">Stop count!</label>
				</div>
			</div>
			<div class="modal-body">
				<div class="highlight-ads-box left">
					<div class="clearfix martop15">
					<?php 
					$isMobile = isRunMobileDevice();
					if( $isMobile )
					{
						?>
						<object id="popup-youtube-player-mobie" width="100%" height="250" data="http://www.youtube.com/v/<?php echo $product_video?>" type="application/x-shockwave-flash">
							<param name="src" value="http://www.youtube.com/v/<?php echo $product_video?>" />
						</object>
						<?php 
					}
					else
					{
						?>
						<!-- <object id="popup-youtube-player-desktop" width="895" height="420" data="http://www.youtube.com/v/<?php //echo $product_video?>" type="application/x-shockwave-flash">
							<param name="src" value="http://www.youtube.com/v/<?php //echo $product_video?>" />
						</object>-->
						<div id="video-placeholder"></div>
						<?php 
					}
					?>
				</div>
				</div>
            </div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div>

<script type="text/javascript">
var c=0;
var t;
var timer_is_on=0;

function timedCount()
{
	document.getElementById('txt').value=c;
	c=c+1;
	t=setTimeout("timedCount()",1000);
}

function doTimer()
{
	if (!timer_is_on)
	{
		timer_is_on=1;
		timedCount();
	}
}

function stopCount()
{
	clearTimeout(t);
	timer_is_on=0;
}

var player,
time_update_interval = 0;

function onYouTubeIframeAPIReady() 
{
	player = new YT.Player('video-placeholder', {
	    width: '100%',
	    height: 400,
	    videoId: '<?php echo $product_video?>',
	    playerVars: {
	        color: 'white',
	        playlist: ''
	    },
	    events: {
	        onReady: initialize
	    }
	});
}

function initialize()
{
	// Update the controls on load
	updateTimerDisplay();
	updateProgressBar();
	
	// Clear any old interval.
	clearInterval(time_update_interval);
	
	// Start interval to update elapsed time display and
	// the elapsed part of the progress bar every second.
	time_update_interval = setInterval(function () {
	    updateTimerDisplay();
	    updateProgressBar();
	}, 1000);
	
	$('#volume-input').val(Math.round(player.getVolume()));
}


//This function is called by initialize()
function updateTimerDisplay()
{
	// Update current time text display.
	$('#current-time').text(formatTime( player.getCurrentTime() ));
	$('#duration').text(formatTime( player.getDuration() ));
}


//This function is called by initialize()
function updateProgressBar()
{
	// Update the value of our progress bar accordingly.
	$('#progress-bar').val((player.getCurrentTime() / player.getDuration()) * 100);
}


//Progress bar

$('#progress-bar').on('mouseup touchend', function (e) 
{
	// Calculate the new time for the video.
	// new time in seconds = total duration in seconds * ( value of range input / 100 )
	var newTime = player.getDuration() * (e.target.value / 100);
	
	// Skip video to new time.
	player.seekTo(newTime);
});


//Playback

$('#play').on('click', function () {
	player.playVideo();
});


$('#pause').on('click', function () {
	player.pauseVideo();
});


//Sound volume
$('#mute-toggle').on('click', function() 
{
	var mute_toggle = $(this);
	
	if(player.isMuted()){
	    player.unMute();
	    mute_toggle.text('volume_up');
	}
	else{
	    player.mute();
	    mute_toggle.text('volume_off');
	}
});

$('#volume-input').on('change', function () {
	player.setVolume($(this).val());
});


//Other options
$('#speed').on('change', function () {
	player.setPlaybackRate($(this).val());
});

$('#quality').on('change', function () {
	player.setPlaybackQuality($(this).val());
});


//Playlist

$('#next').on('click', function () {
	player.nextVideo()
});

$('#prev').on('click', function () {
	player.previousVideo()
});


//Load video

$('.thumbnail').on('click', function () 
{
	var url = $(this).attr('data-video-id');
	player.cueVideoById(url);
});


//Helper Functions
function formatTime(time)
{
	time = Math.round(time);
	
	var minutes = Math.floor(time / 60),
	    seconds = time - minutes * 60;
	
	seconds = seconds < 10 ? '0' + seconds : seconds;
	
	return minutes + ":" + seconds;
}


$('pre code').each(function(i, block) 
{
	hljs.highlightBlock(block);
});
</script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/highlight.min.js"></script>
<script src="https://www.youtube.com/iframe_api"></script>
<script src="<?php //echo asset_url('js/youtubeScript.js')?>"></script>