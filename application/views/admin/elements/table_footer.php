<?php 
$dateFilter = array( 'manage_kapan', 'add_kapan', 'jama_kapan' );

if(in_array($this->router->class, $dateFilter)):
?>
<script language="javascript">
$(function() {
	if($( "#from" ).size()){
		// DATEPICKER FOR FILTER
		$( "#from" ).datepicker({
		  changeMonth: true,
   	  	  dateFormat : 'd-m-yy',
		  maxDate: "d",
		  numberOfMonths: 2,
		  onClose: function( selectedDate ) {
			  if(selectedDate != '')
				$( "#to" ).datepicker( "option", "minDate", selectedDate );
		  }
		});
	}
	if($( "#to" ).size()){
		// DATEPICKER FOR FILTER
		$( "#to" ).datepicker({
		  defaultDate: "+1w",
		  dateFormat : 'd-m-yy',
		  changeMonth: true,
		  numberOfMonths: 2,
		  maxDate: "d",
		  onClose: function( selectedDate ) {
			  if(selectedDate != '')
				$( "#from" ).datepicker( "option", "maxDate", selectedDate );
		  }
		});
	}

	<?php if($this->input->get('fromDate')){ ?>
			  $( "#to" ).datepicker( "option", "minDate", '<?php echo $this->input->get('fromDate'); ?>' );
	<?php };?>

	<?php if($this->input->get('toDate')){ ?>
			  $( "#from" ).datepicker( "option", "maxDate", '<?php echo $this->input->get('toDate'); ?>');
	<?php };?>

});
</script>
<?php endif;?>

<!-- pagination link -->
<?php if($links){ ?>
<div class="links"><?php echo $links;?></div>
<div class="results"><?php echo form_dropdown('perPage',$per_page_drop,set_value('perPage',@$this->session->userdata('perPage')),'class="perPageDropdown" onchange="perPageManage(this)"'); ?></div>
<?php }?>