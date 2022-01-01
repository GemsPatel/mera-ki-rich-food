<?php
	$res;
	
	$category_idArr = explode('|', $category_id);
	$category_id = @$category_idArr[0];

	/**
	 * only use you may like only if client request the feature
	 */
	if( FALSE )
	{
		$res = relatedProducts( $product_id, $category_id, $product_discounted_price );
	}
	?>
	<!-- Related products -->
    <div class="col-lg-3 col-md-3 sidebar_tovar_details">
<?php
    if( !empty($res) || !isEmptyArr($related_productsArr) ):
    
    	if( !isEmptyArr($related_productsArr) ):
?>

    				
						<h3><b><?php echo getLangMsg("r_product")?></b></h3>
						
						<ul class="tovar_items_small clearfix">
						
						<?php
			                	foreach($related_productsArr as $k=>$ar):
			                		if($k < 5):
				                		if( !is_array($ar) )	
				                			continue;
				                		$ar = showProductsDetails( (int)getPriorityPrPrID( '', $ar['product_id'] ), false, true );
				                		
					                	$prodUrl='';
					                	$image = '';
					                	$prodPrice='';
					                	
					                	$prodUrl = getProductUrl($ar['product_id'],$ar['product_price_id'],$ar['product_alias'],$ar['category_id']);
					                	$prodPrice = $ar['product_discounted_price'];
					                		
					                	if(!empty( $ar['product_images'] ))
					                		$image = $ar['product_images'][ $ar['product_angle_in'] ];
				                	
			            ?>
			            
			   							<li class="clearfix" itemscope itemtype="http://schema.org/Product">
											<a href="<?php echo $prodUrl ?>">
												<img class="tovar_item_small_img" itemprop="image" src="<?php echo load_image($image);?>" alt="<?php echo $ar[ 'product_name' ];?>" title="<?php echo $ar['product_name'];?>"/>
											</a>
											<a itemprop="url" href="<?php echo $prodUrl;?>" class="tovar_item_small_title">
												<span itemprop="name"><?php echo $ar[ 'product_name' ];?></span>
											</a>
											<span class="tovar_item_small_price" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
												<?php echo lp( $prodPrice,2,true );?>
											</span>
										</li>
			            
			            <?php
			            			endif;
								endforeach;
			            ?>
						
						</ul>
					
<?php
		endif; 
		
	else:
	
// 		$data['category_id'] = $category_id;
// 		$this->load->view('elements/ads-verticle');

	endif;	
?>
</div>
<!-- //Related products -->