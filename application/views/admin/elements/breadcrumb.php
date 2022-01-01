<style>
a { text-decoration: none; }
</style>
<?php
$controller = $this->controller;
?>

<div class="breadcrumb">
    <a href="<?php echo site_url('admin/lgs');?>">Home</a> &raquo; 
    <a href="<?php echo site_url('admin/'.$this->controller)?>"><?php echo pgTitle( $controller )?></a>
</div>
<div class="pre_loader">
	<div class="listingPreloader"></div>
</div>