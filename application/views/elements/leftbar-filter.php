<div id="sidebar" class="col-lg-3 col-md-3 col-sm-3 padbot50">
	<form id="searchf" name="searchf">
		<?php
			//set hidden filed if seth parameter is set
			if( isset( $_GET['seth'] ) ): 
				$data = $this->input->get();	
				$cnt=0;		
				foreach($data as $k=>$ar):
					if( $cnt > $data['seth'] ) { break;}
					$cnt++;
					if( is_array($ar) ):
						foreach( $ar as $key=>$val):
		?>
							<input type="hidden" name="<?php echo $k?>[]" value="<?php echo $val?>" />
		<?php
						endforeach;
					else:
		?>
							<input type="hidden" name="<?php echo $k?>" value="<?php echo $ar?>" />
		<?php			
					endif;
				endforeach;
			endif;
		?>
		
		<input name="seo_url" id="seo_url" value="<?php echo generateSeoUrl( $search_url_tagArr, '', '')?>" type="hidden"/>
				
		<?php
			//pr($searchf); 
			//pr($filter_data); die; 
			$is_metal_dis = false;
			
			if( !isEmptyArr($filter_data) ):
			foreach($filter_data as $k=>$ar):
		?>
			<?php
				$table = "";
				$checked = "";
				$seo_url = "";
				$resArr = array();
				
				// if price filter then display price options
		    	if( $ar['filters_table_name'] == "price_filter" ):
					$table = $ar['filters_table_name'];
					
					$prcFil = generatePriceFilter();
		    ?>
		    
			<div class="sidepanel widget_brands">
				<h3><?php echo $ar['filters_name']; ?></h3>
		
				<?php
				
						$toRange = $range = 0;
						$i =1;
		          		foreach( $prcFil as $k=>$ar ):
							$tmpArr = explode( "-", $k );
							$range = trim( $tmpArr[0] ); $toRange = trim( $tmpArr[1] ); 
							
							$i++;
		
							//seo URL 
							$resArr = generatePriceTag( (array)@$searchf[$table], $range,  $toRange);
							$seo_url = generateSeoUrl( $search_url_tagArr, 'price_url_tag', $resArr['url_tag']);
							
							//check checkbox if it was checked by user
							if( $resArr['is_searched'] )
							{
								$checked='checked="checked"';
							}
							else
							{
								$checked='';
							}
				?>
				
							<input type="checkbox" id="pf<?php echo $i; ?>" name="<?php echo $table; ?>[]" value="<?php echo $k?>" act-="<?php echo $seo_url?>" class="search" <?php echo $checked;?>/>
							<label for="pf<?php echo $i; ?>"><?php echo $ar?></label>
				<?php
						endforeach;	
		    	?>

			</div>
		    	
			<?php
				/**
				 * if metal filter then display metal options right now there is different design for metal filter therefor separate condition required
				 */
				elseif( FALSE && !$is_metal_dis && ($ar['filters_table_name'] == "metal_color" || $ar['filters_table_name'] == "metal_purity")):  
					$is_metal_dis = true; 
					$kColor = associative_array_search($filter_data,'filters_table_name', 'metal_color');
					$kPurity = associative_array_search($filter_data,'filters_table_name', 'metal_purity');
					$resColor = executeQuery(generateFilterDisQuery($filter_data[$kColor]['filters_table_name'],$filter_data[$kColor]['filters_table_field_name'],$filter_data[$kColor]['filters_table_id'],',metal_color_icon '));
					$resPurity = executeQuery(generateFilterDisQuery($filter_data[$kPurity]['filters_table_name'],$filter_data[$kPurity]['filters_table_field_name'],$filter_data[$kPurity]['filters_table_id'],'',' ORDER BY metal_purity.metal_purity_sort_order '));
					
					$table = 'metal_color_purity';
					if(!empty($resColor) && !empty($resPurity)):
						$resColor = array_values($resColor);
						$resPurity = array_values($resPurity);
						$purity_names = "";
						$metal_image_class="";
						
						foreach($resPurity as $keyP=>$valP)
						{
							$valP = array_values($valP);
							$purity_names .= $valP[1]." &nbsp;&nbsp;";
						}
						
						//array is reversed just because anchor and img tags floating right : css issue
						$resPurity = array_reverse($resPurity);
			?>
			
			<div class="sidepanel widget_brands">
				<h3>Metal</h3>
				<span>Metal filter not supported yet! Make sure that whenever implemented requires both, metal_color and metal_purity in filter data or should add them directly.</span>
	        </div>
	        
	        <?php
					endif;
				// For any other filters
				elseif( $ar['filters_table_name'] != "metal_color" && $ar['filters_table_name'] != "metal_purity" && 
						$ar['filters_table_name'] != "gender_filter" && $ar['filters_table_name'] != "price_filter" && 
						$ar['filters_table_name'] != "cz" && $ar['filters_table_name'] != "product_categories" ): 
				$res = executeQuery(generateFilterDisQuery($ar['filters_table_name'],$ar['filters_table_field_name'],$ar['filters_table_id']));	                 
					if(!empty($res)):
			?>
			
			<div class="sidepanel widget_brands">
				<h3><?php echo $ar['filters_name']; ?></h3>
			
	        <?php
					$table = $ar['filters_table_name'];
	
					$i = 1;
					$original_table = $table;
					$pos = strpos($table,"-");
					if($pos != false)
					{
						$original_table = substr($table,0,$pos);					
					}
					
					foreach($res as $keyR=>$valR):
						$valR = array_values($valR);
						$i++;
						
						//check checkbox if it was checked by user
						if(is_searched($valR[0],(array)@$searchf[$table]))
						{
							$checked='checked="checked"';
							$seo_url = generateSeoUrl( $search_url_tagArr, $original_table.'_url_tag', 
																	str_replace( str_replace( " ", "-", $valR[1])."+","",$search_url_tagArr[$original_table.'_url_tag'] ) );
						}
						else
						{
							$checked='';
							$seo_url = generateSeoUrl( $search_url_tagArr, $original_table.'_url_tag', 
																	$search_url_tagArr[$original_table.'_url_tag'].str_replace( " ", "-", $valR[1])."+" );
						}
	    	?>
	    				<input type="checkbox" id="<?php echo $table."-".$i; ?>" name="<?php echo $table; ?>[]" value="<?php echo $valR[0]; ?>" act-="<?php echo $seo_url?>" class="search" <?php echo $checked;?>/>
	    				<label for="<?php echo $table."-".$i; ?>"><?php echo $valR[1]; ?></label>
			<?php
					endforeach;	
			?>
			
	        </div>
	      
	        <?php
					endif;
				
				/**
				 * product_categories filter
				 */
				elseif( $ar['filters_table_name'] == "product_categories" ): 
				
				$res = executeQuery( generateFilterDisQuery( $ar['filters_table_name'], $ar['filters_table_field_name'], $ar['filters_table_id'], ", category_alias " ) );	
				$product_categoriesArr = @$searchf['product_categories']; $parentRes;
				$sub_categoryKey = false;
	
				if( isset($product_categoriesArr) && is_array($product_categoriesArr) && !isEmptyArr($product_categoriesArr) )
				{
					$parentRes = executeQuery( "SELECT category_id, parent_id FROM product_categories WHERE category_id IN(".implode(",",$product_categoriesArr).") " );
				}
				if(!empty($res)):
			?>
			
			<div class="sidepanel widget_brands">
				<h3><?php echo $ar['filters_name']; ?></h3>
	        <?php
					$table = $ar['filters_table_name'];
	
					$i = 1;
					$original_table = $table;
					$pos = strpos($table,"-");
					if($pos != false)
					{
						$original_table = substr($table,0,$pos);					
					}
					
	//				$parent_category_id = 0;	//SUB_CATEGORY*	
	//				if( isset($category_id) ) 
	//				{ 
	//					$parent_category_id = getField('parent_id', 'product_categories', 'category_id', $category_id); //valid untill cloudwebs doesn't use second level category: ...
	//				}
	
					foreach($res as $keyR=>$valR):
						$valR = array_values($valR);
						$i++;
						
						//check checkbox if it was checked by user
						if(is_searched($valR[0],(array)@$searchf[$table]))
						{
							$checked='checked="checked"';
							
							$seo_url = generateSeoUrl( $search_url_tagArr, $original_table.'_url_tag', str_replace( "+".$valR[2]."+", "+", $search_url_tagArr[$original_table.'_url_tag'] ) );
						}
						else
						{
							$checked='';
							$seo_url = generateSeoUrl( $search_url_tagArr, $original_table.'_url_tag', $search_url_tagArr[$original_table.'_url_tag'].$valR[2]."+" );
						}
						
	    	?>
	    				<input type="checkbox" id="<?php echo $table."-".$i; ?>" name="<?php echo $table; ?>[]" value="<?php echo $valR[0]; ?>" act-="<?php echo $seo_url?>" class="search" <?php echo $checked;?>/>
	    				<label for="<?php echo $table."-".$i; ?>"><?php echo $valR[1]; ?></label>
			<?php
						if( isset($parentRes) || $checked != '' ):
						
						/**
						 * On 29-04-2015 Needs improvement in logic here, the error on special-offers category was due to it was being searched as category while
						 * it does not exist in search filter of category
						 */ 
							if( $checked == '' && !isEmptyArr($parentRes) )	
							{
								$sub_categoryKey = associative_array_search( $parentRes, 'parent_id', $valR[0]);
							}
							
							
							$wh="";
							if( MANUFACTURER_ID != 7 )
							{
								$cctldTable = $ar['filters_table_name'].'_cctld';
								$wh .= ' AND pc.manufacturer_id='.MANUFACTURER_ID;
							}
							else
								$cctldTable = $ar['filters_table_name'];
							
							if( $sub_categoryKey !== FALSE || $checked != '' ):
								$resSubCat = executeQuery( "SELECT DISTINCT ".$ar['filters_table_field_name'].", category_name, category_alias 
															FROM ".$cctldTable." pc 
															INNER JOIN front_menu fm 
															ON (fm.front_menu_primary_id=pc.category_id AND fm.front_menu_table_name='".$ar['filters_table_name']."' ".$wh." AND pc.category_status=0 ) 
															WHERE parent_id=".$valR[0]." AND fm_status=0 ORDER BY pc.category_sort_order ASC "); 
		
								if(!empty($resSubCat)):
									foreach($resSubCat as $key1=>$val1):
										$valR = array_values($val1);
										$i++;
										
										//check checkbox if it was checked by user
										if(  in_array( $valR[0] , $product_categoriesArr ) )
										{
											$checked='checked="checked"';
											$seo_url = generateSeoUrl( $search_url_tagArr, $original_table.'_url_tag',
																					"+".str_replace( $valR[2]."+", "+", $search_url_tagArr[$original_table.'_url_tag'] ) );
										}
										else
										{
											$checked='';
											$seo_url = generateSeoUrl( $search_url_tagArr, $original_table.'_url_tag', $search_url_tagArr[$original_table.'_url_tag'].$valR[2]."+" );
										}
			?>
			
				    					<input type="checkbox" id="<?php echo $table."-".$i; ?>" name="<?php echo $table; ?>[]" value="<?php echo $valR[0]; ?>" act-="<?php echo $seo_url?>" class="search" <?php echo $checked;?>/>
	    								<label class="marglef25" for="<?php echo $table."-".$i; ?>"><?php echo $valR[1]; ?></label>
			<?php			
									endforeach;
								endif;
							endif;
						endif;
					endforeach;	
			?>
			
	        </div>
	        
	        <?php
				endif;
				
				/**
				 * gender filters
				 * gender filters are not yet cctld-multi language supported, so it is required to implement that feature.
				 */ 
				elseif($ar['filters_table_name'] == "gender_filter"): 
	
					//don't display gender filter in cocktail category
					if( !empty($_GET['product_categories']) && sizeof($_GET['product_categories'])<=1 && in_array(COCKTAIL_PID, $_GET['product_categories']) )	continue;
					
					$table = $ar['filters_table_name'];
					//check checkbox if it was checked by user
					if(is_searched('F',(array)@$searchf[$table]))
						$checked='checked="checked"';
					else
						$checked='';
			?>
			
			<div class="sidepanel widget_brands">
				<h3><?php echo $ar['filters_name']; ?></h3>
			
	                    <?php
							//check checkbox if it was checked by user
							if(is_searched('F',(array)@$searchf[$table]))
							{
								$checked='checked="checked"';
								if( is_searched('M',(array)@$searchf[$table]) )
								{
									$seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "for-men+" );
								}
								else
								{
									$seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "" );
								}
							}
							else
							{
								$checked='';
								if( is_searched('M',(array)@$searchf[$table]) )
								{
									$seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "for-women-and-men+" );
								}
								else
								{
									$seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "for-women+" );
								}
							}
						?>
						
						<input type="checkbox" id="<?php echo $table."-".$i; ?>" name="<?php echo $table; ?>[]" value="F" act-="<?php echo $seo_url?>" class="search" <?php echo $checked;?>/>
	    				<label for="<?php echo $table."-".$i; ?>">Women</label>
						
	                    <?php
							//check checkbox if it was checked by user
							if(is_searched('M',(array)@$searchf[$table]))
							{
								$checked='checked="checked"';
								if( is_searched('F',(array)@$searchf[$table]) )
								{
									$seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "for-women+" );
								}
								else
								{
									$seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "" );
								}
							}
							else
							{
								$checked='';
								if( is_searched('F',(array)@$searchf[$table]) )
								{
									$seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "for-women-and-men+" );
								}
								else
								{
									$seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "for-men+" );
								}
							}
						?>
						
						<input type="checkbox" id="<?php echo $table."-".$i; ?>" name="<?php echo $table; ?>[]" value="M" act-="<?php echo $seo_url?>" class="search" <?php echo $checked;?>/>
	    				<label for="<?php echo $table."-".$i; ?>">Men</label>
	    				
		    </div>
	        <?php
				// For CZ filters
				elseif($ar['filters_table_name'] == "cz"): 
				
					$table = $ar['filters_table_name'];
					//check checkbox if it was checked by user
					if(is_searched('cz',(array)@$searchf[$table]))
						$checked='checked="checked"';
					else
						$checked='';
			?>
			
					<div class="sidepanel widget_brands">
						<h3><?php echo $ar['filters_name']; ?></h3>
			
                                <?php
                                    //check checkbox if it was checked by user
                                    if(is_searched('cz',(array)@$searchf[$table]))
                                    {
                                        $checked='checked="checked"';
                                        $seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', str_replace( "Cubic-Zirconia+", "", $search_url_tagArr[$table.'_url_tag'] ) );
                                    }
                                    else
                                    {
                                        $checked='';
                                        $seo_url = generateSeoUrl( $search_url_tagArr, $table.'_url_tag', "Cubic-Zirconia+" );
                                    }
                                ?>
                                
                                <input type="checkbox" id="<?php echo $table."-".$i; ?>" name="<?php echo $table; ?>[]" value="cz" act-="<?php echo $seo_url?>" class="search" <?php echo $checked;?>/>
	    						<label for="<?php echo $table."-".$i; ?>">Cubic Zirconia</label>
	                </div>
	    <?php
				endif;
			endforeach;
			endif;
		?>
		
		<?php 
// 		if($this->session->userdata('lType') == 'PC')
// 		{
// 			$data['category_id'] = @$searchf['product_categories'];
// 			$this->load->view('elements/ads-verticle', $data);
// 		}
		?>
		
	</form>
</div>