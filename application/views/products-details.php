<script type="text/javascript" src="<?php //echo asset_url('js/jquery-3.0.0.min.js')?>"></script>

<section class="tovar_details padbot70">
	<div class="container">
		<div class="row">
			<div id="txt"></div>
			<?php
			if($this->session->userdata('lType') == 'PC')
			{
				$data['related_productsArr'] = @$related_productsArr;
				$data['related_links'] = @$related_links;
				$data['category_id'] = $category_id;
				$data['product_id'] = $product_id;
				$data['product_discounted_price'] = $product_discounted_price;
				$data['angle_in'] = $product_angle_in;
// 				$this->load->view('elements/related_products',$data);
			}
			?>
			<div itemscope itemtype="http://schema.org/Product" itemref="product_discounted_price_up" class="col-lg-9 col-md-9 tovar_details_wrapper clearfix">
				<div class="clearfix padbot40 martop15">
					<?php 
					$isMobile = isRunMobileDevice();
					if( $isMobile )
					{
						?>
						<iframe width="100%" height="400" src="https://www.youtube.com/embed/<?php echo $product_video?>?autoplay=1" frameborder="0" allowfullscreen></iframe>
						<!-- <object width="100%" height="250" data="http://www.youtube.com/v/<?php //echo $product_video?>" type="application/x-shockwave-flash">
							<param name="src" value="http://www.youtube.com/v/<?php //echo $product_video?>" />
						</object>-->
						<?php 
					}
					else
					{
						?>
						<iframe width="700" height="400" src="https://www.youtube.com/embed/<?php echo $product_video?>?autoplay=1" frameborder="0" allowfullscreen></iframe>
						<!-- <object width="700" height="400" data="http://www.youtube.com/v/<?php //echo $product_video?>" type="application/x-shockwave-flash">
							<param name="src" value="http://www.youtube.com/v/<?php //echo $product_video?>" />
						</object>-->
						<?php 
					}
					?>
					<div class="song-grid-right mt15">
						<div class="share">
							<h5>Share this</h5>
							<ul>
								<li class="hide"><a href="#" class="icon gp-icon wd100px">Google +</a></li>
								<li class="hide"><a href="#" class="icon fb-icon wd100px">Facebook</a></li>
								<li class="hide"><a href="#" class="icon twitter-icon wd100px">Twitter</a></li>
								<li class=""><a id="whatsupShare" class="icon whatsapp-icon wd100px" href="whatsapp://send?text=<?php echo asset_url( $_SERVER['REQUEST_URI'] );?>" data-action="share/whatsapp/share">Whatsapp</a></li>
								<li class="hide"><a href="#" class="icon pinterest-icon wd100px hide">Pinterest</a></li>
								<li class="hide"><a href="#" class="icon dribbble-icon wd100px hide">Dribbble</a></li>
								<li class="hide"><a href="#" class="icon like wd100px hide">Like</a></li>
								<li class="hide"><a href="#" class="icon comment-icon wd100px hide">Comments</a></li>
								<li class="view hide">200 Views</li>
							</ul>
						</div>
					</div>
				</div><!-- //CLEARFIX -->
				<?php 
				$res = executeQuery( " SELECT * FROM product_review where product_id=".$product_id." AND product_review_status = 0 " );
				$count = count($res);
				?>
				<div class="tovar_information">
					<ul class="tabs clearfix">
						<li class="current"><?php echo getLangMsg("dtail")?></li>
						<li><?php echo getLangMsg("rvu");?> (<?php if(isEmptyArr($res)):
								echo "0";
							else:
								echo $count;
							endif;?>)
						</li>
					</ul>
					<div class="box visible clearfix">
						<p class="hide"> <?php echo $product_short_description;?></p>
						<div class="widget_categories product_details">
							<?php echo $product_description;?>
						</div>
					</div>
					<div class="box">
						<?php
						$dt["product_id"] = $product_id;
						$dt["res"] = $res;
						$this->load->view("elements/product_review", $dt);
						?>                                
					</div>
				</div><!-- //TOVAR INFORMATION -->
			</div><!-- //TOVAR DETAILS WRAPPER -->
		</div><!-- //ROW -->
	</div><!-- //CONTAINER -->
</section>        
<!-- NEW ARRIVALS -->
<section class="new_arrivals padbot50">
	<?php 
	//$this->load->view('elements/new-arrivals'); 
	?>
</section>
<!-- //NEW ARRIVALS -->

<script>
	function startTime()
	{
		var today=new Date();
		var h=today.getHours();
		var m=today.getMinutes();
		var s=today.getSeconds();
		// add a zero in front of numbers<10
		
		h=checkTime(h);
		m=checkTime(m);
		s=checkTime(s);
		document.getElementById('txt').innerHTML=h+":"+m+":"+s;
		t=setTimeout(function()
		{
			startTime()
		},500);
	}
	
	function checkTime(i)
	{
		if (i<10)
		{
			i="0" + i;
		}
		return i;
	}
</script>

<script type="text/javascript" src="<?php echo asset_url('js/products_details.js?ver=1.1')?>"></script>