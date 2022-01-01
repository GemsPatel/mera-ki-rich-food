
<form id="form" enctype="multipart/form-data" method="post" action="<?php echo site_url('admin/'.$this->controller.'/searchFilterForm')?>">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                    
                        <div class="statbox widget box box-shadow">
                            <div class="widget-content widget-content-area add-manage-product-2">
                            
                            	    <div class="row">
	                                    <div class="col-xl-12 col-md-12">
	                                        <div class="card card-default">
	                                            <div class="card-heading"><h2 class="card-title"><span>Price Filter</span></h2></div>
	                                            <div class="card-body">
	                                                <div class="card-body">
	                                              <table class="list">
     												 <tbody>
											 				<?php
                                                    		if( MANUFACTURER_ID == 7 )
                                                    		{
                                                    			$result = executeQuery("SELECT * FROM filters 
                                                    									WHERE inventory_type_id=".inventory_typeIdForKey($this->session->userdata("IT_KEY"))." AND 
                                                    									filters_table_name='Price_Filter'");
                                                    		}
                                                    		else
                                                    		{
                                                    			$result = executeQuery("SELECT fc.* 
                                                    									FROM filters f 
                                                    									INNER JOIN filters_cctld fc 
                                                    									ON ( fc.manufacturer_id = ".MANUFACTURER_ID." AND fc.filters_id=f.filters_id ) 
                                                    									WHERE f.inventory_type_id=".inventory_typeIdForKey($this->session->userdata("IT_KEY"))." AND  
                                                    									fc.filters_table_name='Price_Filter' ");
                                                    		}
                                                    		$idA = array();
                                                    		if(!empty($result))
                                                    		{
                                                    		  $idA = explode("|",$result[0]['filters_table_id']);
                                                    		}
                                                          ?>
                                                           <tr>
                                                                <td class="left d-none" width="80%">Min Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <input type="text" class="form-control" name="min_price" value="<?php echo (isset($idA))?@$idA[0]:''; ?>" />
                                                                </td>
                                                                <td class="left d-none "  width="20%">Sort Order: &nbsp;&nbsp;&nbsp;
                                                                    <input type="text" class="form-control" name="price_filters_sort_order" value="<?php echo (isset($result[0]['filters_sort_order']))?@$result[0]['filters_sort_order']:''; ?>" />
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td class="left d-none" width="80%">Difference:&nbsp;&nbsp;&nbsp;
                                                                    <input type="text" class="form-control" name="diff_price" value="<?php echo (isset($idA))?@$idA[1]:''; ?>" />
                                                                </td>
                                                                <td class="left" width="20%">Price Filter:&nbsp;&nbsp;&nbsp;
                                                                     <select name="price_filter_status" class="form-control">
                                                                         <option value="1" <?php echo (isset($result[0]['filters_status']))?((@$result[0]['filters_status'] == 1)?'selected="selected"':''):''; ?>>Disabled</option>
                                                                         <option value="0" <?php echo (isset($result[0]['filters_status']))?((@$result[0]['filters_status'] == 0)?'selected="selected"':''):''; ?>>Enabled</option>
                                                                     </select>
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                                <td class="left d-none" width="100%" colspan="2">Max Price:&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <input type="text"  class="form-control" name="max_price" value="<?php echo (isset($idA))?@$idA[2]:''; ?>" />
                                                                </td>
                                                                <td class="left" width="100%" colspan="2">
                                                                	To update <b>Price Filter Range</b> got to Menu >> Localisation >> Currencies module.  
                                                                </td>
                                                              </tr>
                                                              <tr>
                                                              </tr>
                                                              <tr>
                                                              </tr>
                                                          </tbody>
                                                          </table>
                                              		   </div>
													</div>
	                                            </div>
	                                        </div>
	                                    </div>
                                </div>
	                                <?php
                                		/**
                                		 * 
                                		 */	
	                               
                                		if( hewr_isGenderOriented() ):	
                                		
                                			if( MANUFACTURER_ID == 7 )
                                			{
                                		 	  	$res = executeQuery("SELECT * FROM filters 
                                									 WHERE inventory_type_id=".inventory_typeIdForKey($this->session->userdata("IT_KEY"))." AND 
                                									 filters_table_name='Gender_Filter'");
                                			}
                                			else
                                			{
                                			 	  	$res = executeQuery("SELECT fc.* 
                                										FROM filters f 
                                										INNER JOIN filters_cctld fc 
                                										ON ( fc.manufacturer_id = ".MANUFACTURER_ID." AND fc.filters_id=f.filters_id ) 
                                										WHERE f.inventory_type_id=".inventory_typeIdForKey($this->session->userdata("IT_KEY"))." AND 
                                										fc.filters_table_name='Gender_Filter'");
                                			}
                                
                                
                                		?>  
                                		 <div class="widget-content widget-content-area add-manage-product-2">
                                    		<div class="row">
        	                                    <div class="col-xl-12 col-md-12">
        	                                        <div class="card card-default">
        	                                            <div class="card-heading"><h2 class="card-title"><span>Gender</span></h2></div>
        	                                            <div class="card-body">
        	                                                <div class="card-body">
        	                                            
                                                                   <table class="list">
                                                        	              <tbody>
                                                        	              	<tr>
                                                        	                  <td>Filter Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        	                      <input type="text"  class="form-control" name="gender_filters_name" value="<?php echo (isset($res[0]['filters_name']) && @$res[0]['filters_name'] != "")?@$res[0]['filters_name']:@$_POST['gender_filters_name']; ?>" />
                                                        	                  </td>
                                                        	                  <td class="left" width="50%">Sort Order:&nbsp;&nbsp;&nbsp;
                                                        	                      <input type="text"  class="form-control" name="gender_filters_sort_order" value="<?php echo (isset($res[0]['filters_sort_order']))?@$res[0]['filters_sort_order']:''; ?>" />
                                                        	                  </td>
                                                        	                </tr>
                                                        	              	<tr>
                                                        	                  <td class="left" width="80%"></td>
                                                        	                  <td class="left" width="20%">Status:&nbsp;&nbsp;&nbsp;
                                                        	                     <select name="gender_filter_status" class="form-control">
                                                        	                         <option value="1"  <?php echo (isset($res[0]['filters_status']))?((@$res[0]['filters_status'] == 1)?'selected="selected"':''):''; ?>>Disabled</option>
                                                        	                         <option value="0"  <?php echo (isset($res[0]['filters_status']))?((@$res[0]['filters_status'] == 0)?'selected="selected"':''):''; ?>>Enabled</option>
                                                        	                     </select>
                                                        	                  </td>
                                                        	                </tr>
                                                        	              </tbody>
                                                                  </table>
                                                      		   </div>
        													</div>
        	                                            </div>
        	                                        </div>
        	                                    </div>
                                        </div>
                                			<?php 	endif; 
                                			/**
                                			 * component and attribute derived filters
                                			 */
                                			
                                		
                                			if(is_array($resCompAttrFilter) && sizeof($resCompAttrFilter)>0):
                                			foreach($resCompAttrFilter as $k=>$ar):
                                			if( MANUFACTURER_ID == 7 )
                                			{
                                			    $result = executeQuery("SELECT *
												FROM filters
												WHERE inventory_type_id=".inventory_typeIdForKey($this->session->userdata("IT_KEY"))." AND
												filters_table_name='".$ar['table']."' AND
												filters_table_field_name='".$ar['key']."' ");
                                			}
                                			else
                                			{
                                			    $result = executeQuery("SELECT fc.*
												FROM filters f
												INNER JOIN filters_cctld fc
												ON ( fc.manufacturer_id = ".MANUFACTURER_ID." AND fc.filters_id=f.filters_id )
												WHERE f.inventory_type_id=".inventory_typeIdForKey($this->session->userdata("IT_KEY"))." AND
												fc.filters_table_name='".$ar['table']."' AND
												fc.filters_table_field_name='".$ar['key']."' ");
                                			}
                                			
                                			$idA = array();
                                			if(!empty($result))
                                			{
                                			    $idA = explode("|",$result[0]['filters_table_id']);
                                			}
                                			?>
                                	 <div class="widget-content widget-content-area add-manage-product-2" id="tab-<?php echo strtolower(str_replace(" ","_",$ar['name'])); ?>" style="display: block;">
                                    		<div class="row">
        	                                    <div class="col-xl-12 col-md-12">
        	                                        <div class="card card-default">
        	                                            <div class="card-heading"><h2 class="card-title"><span><?php echo $ar['name']; ?></span></h2></div>
        	                                            <div class="card-body">
        	                                                <div class="card-body">
                                            			<table class="list">
                                                          <tbody>
                                                          	<tr>
                                                              <td>Filter Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                  <input type="text"  class="form-control" name="filters_name[]" value="<?php echo (isset($result[0]['filters_name']) && @$result[0]['filters_name'] != "")?@$result[0]['filters_name']:@$ar['name']; ?>" />
                                                              </td>
                                                              <td class="left" width="50%">Sort Order:&nbsp;&nbsp;&nbsp;
                                                                  <input type="text"  class="form-control"  name="filters_sort_order[]" value="<?php echo (isset($result[0]['filters_sort_order']))?@$result[0]['filters_sort_order']:''; ?>" />
                                                              </td>
                                                            </tr>
                                                            <tr>  
                                                              <td width="80%">
                                                              	<?php
                                            						if(is_array($ar['data']) && sizeof($ar['data'])>0):
                                            							foreach($ar['data'] as $key=>$val):
                                            								if((int)$key > 0):
                                            					?>
                                                                  <label><input type="checkbox"  class="form-control" name="filters_table_id[<?php echo $k; ?>][]" value="<?php echo $key ?>" <?php echo ((isset($idA))?(in_array($key,@$idA)?'checked="checked"':''):''); ?> /><?php echo $val; ?></label>&nbsp;&nbsp;
                                                                <?php
                                            								endif;
                                                                		endforeach;
                                            						endif;
                                            					?>
                                                              </td>
                                                              <td class="left" width="20%">Status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                              	<select name="filters_status[]"  class="form-control">
                                                                     <option value="<?php echo $ar['table']."|".$ar['key']."|"; ?>1" <?php echo (isset($result[0]['filters_status']))?((@$result[0]['filters_status'] == 1)?'selected="selected"':''):''; ?> >Disabled</option>
                                                                     <option value="<?php echo $ar['table']."|".$ar['key']."|"; ?>0" 
                                            						 <?php echo (isset($result[0]['filters_status']))?((@$result[0]['filters_status'] == 0)?'selected="selected"':''):''; ?> >Enabled</option>
                                                                </select>
                                                              </td>
                                                            </tr>
                                                       	  </tbody>
                                                        </table>            
                                                  			 </div>
        													</div>
        	                                            </div>
        	                                        </div>
        	                                    </div>
                                        </div>
                                    	 <?php endforeach; endif; ?>
                        		</div>
                        </div>
                    </div>
     </form>
           