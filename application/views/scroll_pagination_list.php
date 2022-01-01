<?php
if(isset($listArr) && sizeof($listArr)>0)
{
	foreach($listArr as $key=>$val)
	{
		$catidArr = explode("|",$val['category_id']);
		if(is_array($catidArr) && sizeof($catidArr)>0)
		{
			$val['category_id'] = $catidArr[0];
		}
		
		$prodUrl = getProductUrl($val['product_id'],$val['product_price_id'],$val['product_alias'],$val['category_id']);
		
		$product_images = front_end_hlp_getProductImages($val['product_generated_code'], $val['product_price_id'], $val["product_sku"], $val['product_generated_code_info']);?>

		<div class="tovar_wrapper col-lg-3 col-md-3 col-sm-4 col-xs-6 col-ss-12 padbot40" itemscope itemtype="http://schema.org/Product">
			<div class="resent-grid-img recommended-grid-img">
				<div class="hovereffect">
			        <img class="img-responsive imageHeightWidth" src="<?php echo load_image( $product_images[$val['product_angle_in']] )?>" alt="<?php echo $val["product_name"];?>">
			        <div class="overlay">
			            <h2><?php echo char_limit( $val["product_name"], 25 );?></h2>
			            <a class="info" href="<?php echo $prodUrl;?>">Whatch Now</a>
			        </div>
			    </div>
				<div class="time">
					<p><?php echo $val['product_internal_note']?></p>
				</div>
				<div class="clck">
					<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
				</div>
			</div>
			<div class="resent-grid-info recommended-grid-info">
				<ul>
					<li>
						<p class="author author-info">
							<a href="<?php echo $prodUrl;?>" class="author"><?php echo char_limit( $val["product_name"], 35 );?></a>
						</p>
					</li>
					<!-- <li><p class="author author-info"><a href="#" class="author">John Maniya</a></p></li> -->
					<!-- <li class="right-list"><p class="views views-info">2,114,200 views</p></li> -->
				</ul>
			</div>
		</div>
	<?php
	}
} ?>