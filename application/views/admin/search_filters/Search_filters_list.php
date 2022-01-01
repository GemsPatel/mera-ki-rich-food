 <!--  BEGIN CONTENT PART  -->
     <div id="content" class="main-content">
            <div class="container">
                <div class="page-header"> </div>
                
                <div class="row mt-4" id="cancel-row">
                
                    <div class="col-xl-12 col-lg-12 col-sm-12">
                        <div class="statbox widget box box-shadow">
                            <div class="widget-header">
                                <div class="row">
                                    <div class="col-xl-6 col-md-6 col-sm-6 col-6">
                                        <h4><?php echo pgTitle($this->controller);?></h4>
                                    </div>
                                    <div class="col-xl-6 col-md-6 col-sm-6 col-6 text-right back-to-home">
               					 <?php if($this->per_edit == 0):?>
                                        <button class="btn btn-success dd success mr-4 rounded" onclick="$('#form').submit();">
                                        	<span>
                                        		<i class="fa fa-plus" aria-hidden="true"></i> 
                                        		Save
                							</span>
        								</button>
                  	
                    <?php endif;?>    
                        <button class="btn btn-danger dd  mr-4 rounded"  onclick="window.location='<?php echo site_url('admin/'.$this->controller); ?>'">
                        	<span><i class="" aria-hidden="true"></i> Cancel</span>
						</button>
                       	</div>
                        </div>
                    </div>
                    <div class="content">
                    <?php $this->load->view('admin/'.$this->controller.'/ajax_html_data'); ?>    
                    </div>
			   </div>
              </div>
            </div>
        </div>
    </div>

