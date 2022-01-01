<form id="form" enctype="multipart/form-data" method="post" action="">
    <div class="widget-content widget-content-area">
		<div class="table-responsive">
		  <input type="hidden" name="item_id" value="<?php echo (@$this->cPrimaryId != '') ? _en(@$this->cPrimaryId) : ''; ?>"  />
          <input type="hidden" name="m_id"  value=""  />
        	<table class="multi-table table table-striped table-bordered table-hover list" style="width: 100%">
              <thead>
        		<tr id="heading_tr" style="cursor:pointer;">
                  <th class="left" width="40%">Inventory Name</th>
        		  <th class="left" width="40%">Key</th>
                  <th class="left" width="20%">Action</th>
                </tr>
                
              </thead>
                  <tbody class="ajaxdata">
                  <?php 
            	  	$extra = "";			
                	if(count($listArr)):
                		foreach($listArr as $k=>$ar):
            	  ?>
            	            <tr id="m_<?php echo $ar['inventory_type_id']?>">
            	                <td class="left"><?php echo $ar['it_name']?></td>
            	                <td class="left"><?php echo $ar['it_key']?></td>
            	                <td class="left">
            	                	[ <a data-toggle="tooltip" title="Edit in <?php echo $ar['it_name']?>" href="<?php echo site_url('admin/'.$this->controller.'/inventoryType?inventory=true&item_id='.$ar['inventory_type_id'].'&'.changeInventoryUriParams( $ar['it_key'] ) ) ?>"><i class="fa fa-pencil"></i></a> ]
            	                </td>
            	            </tr>
                  
            	  <?php 
            	  		endforeach;
            	  	else:
            			echo "<tr><td class='center' colspan='6'>No results!</td></tr>";
               	   	endif; 
            	  ?>
				  </tbody>
				  <tfoot>
          <tr>
            
            <th>Inventory Name</th>
            <th>Key</th>
            <th>Action</th>
          </tr>
        </tfoot>
                 </table>
    		</div>
    	</div>
    </form>