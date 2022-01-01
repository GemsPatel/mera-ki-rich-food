<div class="col-sm-3 col-md-2 sidebar">
	<div class="top-navigation">
		<div class="t-menu">MENU</div>
		<div class="t-img">
			<img src="images/lines.png" alt="" />
		</div>
		<div class="clearfix"> </div>
	</div>
	<div class="drop-navigation drop-navigation">
		<ul class="nav nav-sidebar">
			<li class="active">
				<a href="<?php echo site_url();?>" class="home-icon">
					<span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home
				</a>
			</li>
			<li>
				<a href="<?php echo site_url('computer.html');?>" class="user-icon">
					<span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span>Computer
				</a>
			</li>
			<li>
				<a href="<?php echo site_url('ga-gk.html');?>" class="sub-icon">
					<span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span>GA/GK
				</a>
			</li>
			<li class="">
				<a class="menu1">
					<span class="glyphicon glyphicon-film" aria-hidden="true"></span>MicroSoft
					<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
				</a>
			</li>
			<ul class="cl-effect-2">
				<li><a href="<?php echo site_url('microsoft.html');?>">Excel</a></li>                                             
				<li><a href="<?php echo site_url('microsoft.html');?>">Word</a></li>
				<li><a href="<?php echo site_url('microsoft.html');?>">Power Point</a></li> 
			</ul>
			<!-- script-for-menu -->
			<script>
				$( "li a.menu1" ).click(function() {
					$( "ul.cl-effect-2" ).slideToggle( 300, function() {
						// Animation complete.
					});
				});
			</script>
			<li class="">
				<a href="<?php echo site_url('education.html');?>" class="education-icon">
					<span class="glyphicon glyphicon glyphicon-education" aria-hidden="true"></span>Education
				</a>
			</li>
			<li class="">
				<a href="<?php echo site_url('internet.html');?>" class="info-icon">
					<span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Internet
				</a>
			</li>
			<li>
				<a href="<?php echo site_url('health.html');?>" class="heart-icon">
					<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>Health
				</a>
			</li>
		</ul>
		<!-- script-for-menu -->
		<script>
			$( ".top-navigation" ).click(function() {
				$( ".drop-navigation" ).slideToggle( 300, function() {
					// Animation complete.
				});
			});
		</script>
	</div>
</div>