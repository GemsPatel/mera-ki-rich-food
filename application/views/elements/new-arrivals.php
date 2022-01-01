<?php $naArr = $this->jew->getProducts( staticCategoryIDs( "new-arrivals" ) );?>
<div class="container">
	<div class="recommended-info">
		<h3><?php echo getLangMsg("na")?></h3>
	</div>
	<div class="jcarousel-wrapper">
		<div class="jCarousel_pagination">
			<a href="javascript:void(0);" class="jcarousel-control-prev" ><i class="fa fa-angle-left"></i></a>
			<a href="javascript:void(0);" class="jcarousel-control-next" ><i class="fa fa-angle-right"></i></a>
		</div><!-- //NAVIGATION -->
		<div class="jcarousel" data-appear-top-offset='-100' data-animated='fadeInUp'>
			<ul>
				<?php 
				if(isset($naArr["data"]["result_array"]) && sizeof($naArr["data"]["result_array"])>0):
					foreach($naArr["data"]["result_array"] as $key=>$val):
						$catidArr = explode('|',$val['category_id']);
						if(is_array($catidArr) && sizeof($catidArr)>0)
						{
							$val['category_id'] = $catidArr[0];
						}
						$prodUrl = getProductUrl($val['product_id'],$val['product_price_id'],$val['product_alias'],$val['category_id']);
						$product_images = front_end_hlp_getProductImages($val['product_generated_code'], $val['product_price_id'], $val["product_sku"], $val['product_generated_code_info']);
						?>
						<li>
							<div class="tovar_item clearfix">
								<div class="tovar_img">
									<div class="tovar_img_wrapper">
										<a itemprop="url" href="<?php echo $prodUrl ?>">
											<img itemprop="image" src="<?php echo load_image( $product_images[ $val["product_angle_in"] ] )?>" alt="<?php echo $val["product_name"];?>" title="<?php echo $val["product_name"];?>" />
										</a>
									</div>
								</div>
								<div class="resent-grid-info recommended-grid-info">
									<h3>
										<a href="<?php echo $prodUrl;?>" class="title title-info"><?php echo char_limit( $val["product_name"], 30 );?></a>
									</h3>
									<ul>
										<li><p class="author author-info"><a href="#" class="author">John Maniya</a></p></li>
										<li class="right-list"><p class="views views-info">2,114,200 views</p></li>
									</ul>
								</div>
							</div>
						</li>						
						<?php 
					endforeach;
				endif;
				?>
			</ul>
		</div>
	</div><!-- //JCAROUSEL -->
</div><!-- //CONTAINER -->