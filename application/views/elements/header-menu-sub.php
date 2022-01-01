<ul class="navmenu center">
	<li class="first active hide">
		<a href="<?php echo site_url() ?>" ><?php echo getLangMsg("hm")?></a>
	</li>
	<?php
	$res = cmn_vw_mainMenu(); 
	$segment = $this->uri->segments;

	if(!empty($res["res"]))
	{
		foreach($res["res"] as $k=>$ar)
		{
			$lowerMenuName = strtolower($ar['front_menu_name']);
			$activeClass='';
			if(!empty($segment))
				$activeClass = ($lowerMenuName == $segment[1]) ? 'active' : '';
				?>
				<li class="sub-menu hide"><a href="<?php $ar["pURL"]; ?>" ><?php echo $ar['front_menu_name'];?></a>
				<li class="sub-menu <?php echo $activeClass ?>"><a class="cursor"><?php echo $ar['front_menu_name'];?></a>
					<?php
					if((int)$ar["cnt"]>0){
						?>
						<ul class="mega_menu megamenu_col1 clearfix">
							<li class="col">
								<ol>
								<?php					
									frontmenuListing($ar['front_menu_id'],$res["fm_icon_is_display"],$ar["item"], $ar["res"]);			
								?>						
								</ol>
							</li>
						</ul><!-- //MEGA MENU -->
					<?php } ?>			
				</li>
				<?php
		}
	} ?>
	<li class=""><a href="<?php echo site_url('about-us') ?>"><?php echo getLangMsg("au")?></a></li>
	<li class="last sale_menu hide"><a href="<?php echo site_url('special-offers.html') ?>" ><?php echo getLangMsg("spoff")?></a></li>
</ul><!-- //MENU -->
