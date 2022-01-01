<?php
$tollFree = getField('config_value','configuration','config_key','TOLL_FREE_NO');
$infoEmail = getField('config_value','configuration','config_key','ADMIN_EMAIL');
?>
<!-- footer -->
<div class="footer">
	<div class="footer-grids">
		<div class="footer-top">
			<div class="footer-top-nav">
				<ul>
					<li><a href="<?php echo site_url('about-us');?>">About</a></li>
					<li class="hide"><a href="<?php echo site_url('');?>">Copyright</a></li>
					<li class="hide"><a href="<?php echo site_url('');?>">Developers</a></li>
					<li class=""><a href="<?php echo site_url('terms-conditions');?>">Terms</a></li>
					<li><a href="<?php echo site_url('privacy-policy');?>">Privacy</a></li>
					<li class="hide"><a href="<?php echo site_url('');?>">Policy & Safety </a></li>
					<li><a href="<?php echo site_url('contact-us');?>">Contact US</a></li>
				</ul>
			</div>
		</div>
	</div>
	<?php 
	$isMobile = isRunMobileDevice();
	?>
	<div class="side-bottom">
		<div class="side-bottom-icons <?php echo ( $isMobile ) ? "side-bottom-icons-mobile" : "side-bottom-icons-desktop"; ?>">
			<ul class="nav2 <?php echo ( $isMobile )?"center":"";?>">
				<li><a href="#" class="facebook"> </a></li>
				<li><a href="#" class="facebook twitter"> </a></li>
				<li><a href="#" class="facebook chrome"> </a></li>
				<li><a href="#" class="facebook dribbble"> </a></li>
			</ul>
		</div>
		<div class="copyright">
			<p>Copyright @ 2018 My Play. All Rights Reserved<?php echo ($isMobile) ? ". <br>" : " |"?> Design by <a href="http://cloudwebs.net/">Cloudwebs</a></p>
		</div>
	</div>
</div>
<!-- //footer -->
        