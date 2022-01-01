<!DOCTYPE html>
<html lang="en">
    <head>
    	<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<!-- START META -->
    	<?php
    		/**
    		 * global meta in case of local is missing
    		 */ 
    		$scArr;
    		if( IS_CACHE )
    		{
    			$cache_key = cacheKey( 'site_config' );
    			
    			if ( ! $header_menu = get_cache( $cache_key ) )
    			{
    				$scArr = $this->db->where('manufacturer_id',MANUFACTURER_ID)->get('site_config')->row_array();
    			
    				saveCacheKey( $cache_key, 'site_config');
    			
    				// Save into the cache for infinite time
    				save_cache( $cache_key, $header_menu, 0 );
    			}
    		}
    		else
    		{
    			$scArr = $this->db->where('manufacturer_id',MANUFACTURER_ID)->get('site_config')->row_array();
    		}
    	?>
    	<title><?php echo ( !empty($custom_page_title) ) ? $custom_page_title : $scArr['custom_page_title']; ?></title>
    	<base href="<?php echo site_url();?>" />
    	
    	<?php 
    	$favicon = 'images/fevicon.png?v=0.1';
    	if( isset( $product_id ) && !empty( $product_id) )
    	{
    		$favicon = getField( "product_image" , "product", "product_id", $product_id );
    	}
    	?>
    	
    	<link rel="shortcut icon" href="<?php echo asset_url( $favicon );?>">
    	<meta name="description" content="<?php echo ( !empty($meta_description) ) ? $meta_description : $scArr['meta_description'];?>" />
    	<meta name="keywords" content="<?php echo ( !empty($meta_keyword) ) ? $meta_keyword : $scArr['meta_keyword'];?>" />
    	<meta name="robots" content="<?php echo ( !empty($robots) ) ? getField('robots_name','seo_robots','robots_id', $robots) : getField('robots_name','seo_robots','robots_id', $scArr['robots']); ?>" />
    	<meta name="author" content="<?php echo ( !empty($author) ) ? $author : $scArr['author']; ?>" />
    	<meta name="copyright" content="Copyright (c) <?php echo date('Y') ?>" />
    	<meta name="generator" content="<?php echo getField('config_value','configuration','config_key','SEO_GENERATOR') ?>" />
    
    	<link rel="canonical" href="<?php echo asset_url( $_SERVER['REQUEST_URI'] );?>" >
    	<meta property="og:image"         content="<?php echo asset_url( $favicon ); ?>" />
    		
    	<?php if( !empty($canonical) ):?>
    	<link rel="canonical" href="<?php echo $canonical; ?>" />
    	<?php endif;?>
    	
    	<!-- END META -->
    
    	<meta http-equiv="vary" content="User-Agent">
        
        <!-- Bootstrap CSS -->
        <link href="<?php echo asset_url('css/bootstrap.css')?>" rel="stylesheet">
        <link href="<?php echo asset_url('css/style.css')?>" rel="stylesheet">
        <!-- icons -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
        integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
        crossorigin="anonymous" />
        <!-- Fonts -->
        <!-- <link rel="preconnect" href="https://fonts.gstatic.com"> -->
        <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <title>index</title>
        <!-- slider -->
        <link href="<?php echo asset_url('css/slick-theme.css')?>" rel="stylesheet" />
        <link href="<?php echo asset_url('css/slick.css')?>" rel="stylesheet" />
        <!-- jQuery -->
        <script type="text/javascript" src="<?php echo asset_url('js/admin/jquery/jquery-1.7.1.min.js');?>"></script>
        <script src="<?php echo asset_url('js/jquery-1.11.1.min.js');?>"></script>
        
        <?php $this->load->view('elements/js-variables');  ?>
    
        <noscript> <!-- Show a notification if the user has disabled javascript -->
    	<div class="notification error png_bg">
    	    <div>
    	        Javascript is disabled or is not supported by your browser. Please <a href="http://browsehappy.com/" title="Upgrade to a better browser" rel="nofollow,noindex">upgrade</a> your browser or <a href="http://www.google.com/support/bin/answer.py?answer=23852" title="Enable Javascript in your browser" rel="nofollow,noindex">enable</a> Javascript to navigate the interface properly.
    	    </div>
    	</div>
    	</noscript>    
    	
    </head>
    <body> 
    	<!-- Begin:: navbar -->
        <?php $this->load->view('elements/header-menu'); ?>
		<!-- End:: Header -->