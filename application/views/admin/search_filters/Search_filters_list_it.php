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
                                       <!-- <button class="btn btn-success dd success mr-4 rounded" onclick="window.location='<?php echo site_url('admin/'.$this->controller); ?>'">
                                        	<span><i class="fa fa-arrow-left" aria-hidden="true"></i> Back</span>
            							</button> -->
   									  </div>
                                </div>
                            </div>
    						<div class="content">
                            	<?php $this->load->view('admin/'.$this->controller.'/ajax_html_data_it'); ?>
                            </div>
                      </div>
                  </div>
            </div>
        </div>
    </div>


