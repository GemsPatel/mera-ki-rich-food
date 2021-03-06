<div id="content">
	<?php $this->load->view('admin/elements/breadcrumb');
	$controller = $this->controller;
	?>
	<div class="box">
		<div class="heading">
			<h1>
				<img alt="<?php echo $controller; ?>" src="<?php echo getMenuIcon($this->controller)?>" height="22"> 
				<?php echo pgTitle( $controller );?>
			</h1>
      <div class="buttons">
      	<?php if($this->per_add == 0):?>
        	<?php if( INVENTORY_TYPE_ID == 0 ): ?>
		      	<a class="button" href="<?php echo site_url('admin/'.$this->controller.'/inventoryType?insert=true&item_id='._en(@$this->cPrimaryId) );?>">Insert</a>
		    <?php else:?>
		      	<a class="button" href="<?php echo site_url('admin/'.$this->controller.'/categoryForm'); ?>">Insert</a>
		    <?php endif;?>
        <?php endif;?>
        
		
		<?php if($this->per_delete == 0):?>
      			<a class="button" onclick="return deleteAjaxData()">Delete</a>
      	<?php endif;?>
      
        </div>
    </div>
  </div>
    
    <!--<div class="pre_loader"><div class="listingPreloader"></div></div>-->
    
    <div class="content">
	<?php $this->load->view('admin/'.$this->controller.'/ajax_html_data'); ?>    
    </div>
  </div>
  
</div>

