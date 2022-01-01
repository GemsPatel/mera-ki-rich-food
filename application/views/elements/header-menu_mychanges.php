		<header class="contain">
			
			<!-- TOP INFO -->
			<div class="top_info">
				
				<!-- CONTAINER -->
				<div class="container clearfix">
					<ul class="secondary_menu">
						
					
						<?php
							if( !isLoggedIn() ):
						?>
								<li><a href="<?php echo site_url('login'); ?>" title="My Account"><?php echo getLangMsg("lgn");?></a></li>
								<li><a href="<?php echo site_url('register') ?>" title="Register"><?php echo getLangMsg("reg");?></a></li>
						<?php
							else:
						?>		
								<li><a href="<?php echo site_url('account'); ?>" title="My Account"><?php echo getLangMsg("ma");?></a></li>
								<li><a href="<?php echo site_url('logout') ?>" title="Logout"><?php echo getLangMsg("lo");?></a></li>
						<?php
							endif;
						?>
						
						<li>
							<div class="dis-in-block language">
								<?php
									$sql = " SELECT currency_id,currency_code FROM currency WHERE currency_status=0 GROUP BY currency_code ORDER BY currency_code ";
									
									$currArr = getDropDownAry( $sql, "currency_id", "currency_code", "", false );
									echo form_dropdown( 'currency_id', @$currArr, CURRENCY_ID, 'onchange="changeCurrency(this.value)" class="tovar_view qty_box" ');
								?>
                            </div>
						</li>
                        <li>
							<div class="dis-in-block language">
								<select onchange="updateLang(this);" name="lang" class="tovar_view qty_box" title="Language">
									<option value="EN_US" <?php echo ( $this->session->userdata("LANG") == "EN_US" ? 'selected="selected"' : '' );?>>English</option>
									<option value="HI" <?php echo ( $this->session->userdata("LANG") == "HI" ? 'selected="selected"' : '' );?>>Hindi</option>
									<!--<option value="GU" <?php //echo ( $this->session->userdata("LANG") == "GU" ? 'selected="selected"' : '' );?>>Gujrati</option>-->
								</select>
                            </div>
						</li>
					</ul>
					
					<div class="live_chat"><a title="<?php echo getLangMsg("lc");?>" class="cursor" onclick="zopimOpenWin()"><i class="fa fa-comment-o"></i> <?php echo getLangMsg("lc");?></a></div>
					<?php $tollFree = getField('config_value','configuration','config_key','TOLL_FREE_NO') ?>
					<div class="phone_top"><?php echo getLangMsg("haq");?><a href="tel:<?php echo $tollFree ?>" ><?php echo $tollFree ?></a></div>
				</div><!-- //CONTAINER -->
			</div><!-- TOP INFO -->
			
			<!-- SEARCH FORM -->
			
			<!-- <div class="top_search_form" <?php //echo ( isMobile() ? ' style="display:none;" ' : '' );?>>
				<a class="top_search_btn hide" href="javascript:void(0);" id="show_search"><i class="fa fa-search"></i></a>
				<a class="top_search_btn hide" href="javascript:void(0);" id="hide_search"><i class="fa fa-times"></i></a>
				<form id="wild_searchf" class="site-search"  onSubmit="keywordSearch(); return false;" <?php echo ( !isMobile() ? 'style="width: 51%;"' : 'style="width: 355px;"' );?>>
					<input type="text" value="<?php echo @$searchf['search_terms_keywords']; ?>" placeholder="Start Searching …" name="search_terms_keywords" id="term" class="fleft" >
	                <i class="fa fa-search btn_search" onClick="keywordSearch()" style="cursor:pointer"></i>
	                <span class="error_msg"><?php //echo (@$error)?form_error('article_key'):''; commented on 18-08-2015?> </span>
                </form>
                <!-- 
                	old backup
                 -->
				<!-- <form method="get" action="#">
					<input type="text" name="search" value="Search" onFocus="if (this.value == 'Search') this.value = '';" onBlur="if (this.value == '') this.value = 'Search';" />
				</form>-->
			<!-- </div> --><!-- SEARCH FORM -->
			<!-- MENU BLOCK -->
			<div class="menu_block">
			
				<!-- CONTAINER -->
				<div class="container clearfix">

					<!-- LOGO -->
					<div class="logo">
						<a href="<?php echo site_url() ?>" ><img src="<?php echo asset_url("images/logo.png")?>" alt="Online Video Viewer" title="Online Vegetables and Fruits Shopping Store" /></a>
					</div><!-- //LOGO -->
					
					<!-- re-change code 11-18-2016 -->
					<!-- SEARCH FORM -->
					<?php if( true ){?>
					<div class="top_search_form" <?php //echo ( !isMobile() ? ' style="display:none;" ' : '' );?>>
						<a class="top_search_btn" href="javascript:void(0);" id="show_search"><i class="fa fa-search"></i></a>
						<a class="top_search_btn" href="javascript:void(0);" id="hide_search"><i class="fa fa-times"></i></a>
						<form id="wild_searchf" class="site-search"  onSubmit="keywordSearch(); return false;">
							<input type="text" value="<?php echo @$searchf['search_terms_keywords']; ?>" placeholder="Start Searching …" name="search_terms_keywords" id="term" class="fleft" >
			                <i class="fa fa-search btn_search" onClick="keywordSearch()" style="cursor:pointer"></i>
			                <span class="error_msg"><?php //echo (@$error)?form_error('article_key'):''; commented on 18-08-2015?> </span>
		                </form>
		                <!-- 
		                	old backup
		                 -->
						<!-- <form method="get" action="#">
							<input type="text" name="search" value="Search" onFocus="if (this.value == 'Search') this.value = '';" onBlur="if (this.value == '') this.value = 'Search';" />
						</form>-->
					</div><!-- SEARCH FORM -->
					<!-- re-change code complete -->
					<?php }?>
		          	<?php
						$resArr = getCartWishCount();
					?>
					
					<!-- SHOPPING BAG -->
					<div class="shopping_bag">
						<a class="shopping_bag_btn" href="<?php echo site_url("cart")?>" title="Cart"><i class="fa fa-shopping-cart"></i><p><?php echo getLangMsg("sb");?></p><span id="h_cart"><?php echo $resArr['cart'];?></span></a>
					</div><!-- //SHOPPING BAG -->
					
					
					<!-- LOVE LIST -->
					<div class="love_list">
						<a class="love_list_btn" href="<?php echo site_url("cart/wishlist")?>" title="Lovelist"><i class="fa fa-heart-o"></i><p><?php echo getLangMsg("ll");?></p><span id="h_wish"><?php echo $resArr['wish'];?></span></a>
					</div><!-- //LOVE LIST -->
					
				    <?php 
				    	/**
				    	 * header-menu-sub
				    	 */
						if( IS_CACHE )
						{
							$header_menu;
							$cache_key = cacheKey( 'header_menu' );
							
							if ( ! $header_menu = get_cache( $cache_key ) )
							{
								$header_menu = $this->load->view('elements/header-menu-sub', '', TRUE);
							
								saveCacheKey( $cache_key, 'header');
							
								// Save into the cache for infinite time
								save_cache( $cache_key, $header_menu, 0 );
							}
							
							echo $header_menu;
						}
						else
						{
							$this->load->view('elements/header-menu-sub');
						}
					?>
					
					
				</div><!-- //MENU BLOCK -->
			</div><!-- //CONTAINER -->
            
            <?php $this->load->view('elements/notifications'); ?>
            
            <?php $this->load->view('elements/notification-popup');?>
		</header>
		
        
        
        
		<?php $this->load->view('elements/breadcrumbs-img') ?>
		<?php
		if( ($this->router->class!="home") || $this->router->method!="index"):
			$this->load->view('elements/breadcrumbs');			
		endif;
		?>
        
		
<?php
	function frontmenuListing($front_menu_id,$fm_icon_is_display,$parent_item, $res, $extra='')
	{
		if(!empty($res)):
			foreach($res as $k=>$ar):
				$icon = "";  $item = "";
				//$icon = '&rsaquo;';
				//$icon = ($fm_icon_is_display)?'<img alt="'.$ar['front_menu_name'].'" src="'.load_image($ar['fm_icon']).'" class="small-inner">':'';
				//$subURL = site_url('/'.$ar['front_hook_alias'].$item.'.html');
				  
				if($ar['front_hook_alias'] == "products")
				{
					$item = getField("category_alias","product_categories","category_id",$ar['front_menu_primary_id']);			  
				}
				else if($ar['front_hook_alias'] == "articles")
				{
					$item = getField("article_alias","article","article_id",$ar['front_menu_primary_id']);
				}
						  
				$item = (($item != "")?'/'.$item:'');
				//$subURL = site_url('/'.$ar['front_hook_alias'].$item.'.html');
				
				//$cnt commented on 02-05-2015
				//$cnt = getField("front_menu_id","front_menu","fm_parent_id",$ar['front_menu_id']);
				
				
				$icon = ($fm_icon_is_display)?'<img alt="'.$ar['front_menu_name'].'" src="'.load_image($ar['fm_icon']).'" class="small-inner">':'';
?>					
				<li><a href="<?php echo getListingUrl($parent_item, $item);?>" title="<?php echo $ar['front_menu_name'];?>"><?php echo $ar['front_menu_name'];?></a></li>
<?php						
			endforeach;
		endif;	
	}
?>