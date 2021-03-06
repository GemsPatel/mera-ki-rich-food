<script type="text/javascript">
	var base_url = "<?php echo base_url(); ?>";
	var asset_url = "<?php echo asset_url(); ?>";
	var controller = "<?php echo ucfirst($this->router->class); ?>";
	//see UML - An-JGV for more information on below variables
	var is_mobile = <?php echo ($this->session->userdata('lType') == 'PC' ? 'false' : 'true') ?>;
	var is_listing_page = false; 	//for scroll pagination
	var is_sol_listing = false;
	var p_id = 0; 
	var proConfig;
	var baseDomain = '<?php echo base_domain(); ?>';	//base domain for XMPP service
	var sessions_id = <?php echo $this->session->userdata('sessions_id'); ?>;	//used in setting default XMPP connection for front user(Exper...)
	var appLaunch = "<?php echo getSysConfig('appLaunch'); ?>";
	var is_download_app = "<?php echo $this->session->userdata('is_SID_c'); ?>";	//When on mobile the webapp is first time launched show download app popup, when is app is launched. 
	var filter_page = '';

	/**
	 * notification variables
	 */
	var type = ""; 
	var message = ""; 
	
	/**
	 * lang
	 */	
	function getLangMsg( type )
	{
		if( type == "qtyw" )
		{
			return "<?php echo getLangMsg("qtyw");?>"; 
		}
	}
</script>
<?php if( isLoggedIn() ):
		$login_link =  '<a href="'.site_url('login').'">LOGIN</a>';
?>		
			<script type="text/javascript">
				var is_logged_in = false;	
			</script>
<?php  
	  else:
?>
			<script type="text/javascript">
				var is_logged_in = true;	
			</script>
<?php     
		$login_link =  '<a href="'.site_url('logout').'">LOGOUT</a>';
	  endif;	
?>

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-116544476-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-116544476-1');
</script>
