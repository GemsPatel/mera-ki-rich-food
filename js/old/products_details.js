$(document).ready(function()
{	
	/**
	 * slider image click
	 */
	$(document).on( 'click', '.product_detail_slider_image', function()
	{
		selected_index = $(this).find('img').attr('index');
	});

	/**
	 * ajax customize product
	 */
	$(document).on( 'click', '.prod_det', function()
	{
		ajaxCustomize(this);
	});
});


/** 
 * function will fetch prod details  
 * author Cloudwebs
 */
	function ajaxCustomize(obj)
	{
		var type = $(obj).attr('type-');
		var id = 0;
		var ring_size_id = 0;
		
		if($('#ring_size_drop_down').length > 0)
		{
			ring_size_id = $('#ring_size_drop_down').val();
		}
		else if( $('select[name="ring_size_id_f"]').length > 0)
		{
			ring_size_id = $('select[name="ring_size_id_f"]').val();
			ring_size_id = ring_size_id + '|' + $('select[name="ring_size_id_m"]').val();
		}
		
		if(type!='ring_size')
		{
			$('.'+type).removeClass( "active");
			$(obj).addClass('active');
			id = $(obj).attr('pid-');
		}
		
		form_data = {id : id,type : type,pid : pid,ring_size_id : ring_size_id}; 
		var loc = (base_url+'products/fetchProductDetailsAjax');
		$.post(loc, form_data, function (data)
		{
			var arr = $.parseJSON(data);
			if(arr['type']=='success')
			{
				updProdDet(arr['view_var']);
				updProdSlider(arr['product_images']);
			}
			else
			{
				$('.contain').prepend(getNotificationHtml(arr['type'],arr['msg']));
				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		});
	}
	
/**
 * update product details
 */	
	function updProdDet(view_var)
	{
		for(key in view_var)
		{
//			if( key!='product_discounted_price' && key!='product_generated_code_displayable' )
//			{
//				if( $('#'+key).length > 0 )
//				{
//					$('#'+key).html(view_var[key]);
//				}
//			}
//			else
//			{
//				$('#'+key+'_up').html(view_var[key]);
//				$('#'+key).html(view_var[key]);
//			}
			
			if( $('#'+key).length > 0 )
			{
				$('#'+key).html(view_var[key]);
			}
		}
		
		updProdDetCustom(view_var); 
	}

/**
 * On 16-04-2015 custom attribute updation moved here
 * update product details custom
 */	
	function updProdDetCustom(view_var)
	{
		$('#product_discounted_price_up').html(view_var['product_discounted_price']);
		$('#product_generated_code_displayable_up').html(view_var['product_generated_code_displayable']);
		$('#qty').val(view_var['qty']);
	}
	
	
/**
 * function will update product detail silder
 */	
	function updProdSlider(product_images)
	{
		//$('.ring_info_main').html(product_images);
		
		img_len = product_images.length;
		if( is_dynamic_images == 1 || ( img_len > 1 && is_component_besed_inv == 1 ) )
		{
			var slt_len = 0;	//length of slider thumbs
			var obj = null;
			var index = 0;	//image index attribute
			var i = 0;
			var active="";	//active or inactive class for images
			$(".product_detail_slider_image").each(function() { slt_len++; } );	//length count of slider thumbs
			
			for (i=0;i<img_len;i++)
			{
				
				if(img_len > selected_index)
				{
					if(i==selected_index)
					{
						imgsrc = asset_url+product_images[i];
//						if( !is_mobile )
//						{
//							$('.product_detail_right').find('img').attr('src', imgsrc);
//							$('.product_detail_right').find('img').attr("data-cloudzoom",'zoomImage:'+imgsrc+', zoomSizeMode: \'zoom\'');
//							$('.cloudzoom-lens').find('img').attr("src", imgsrc);
//						}
//						else
//						{
							//$('.product_detail_right').find('img').attr('src', imgsrc);
							$('.Cloudwebs_zoom').each(function()
							{
								obj = $(this);
								
								if(i==parseInt(obj.attr('index')))
								{
									obj.attr( 'src', imgsrc);
									return false;
								}
							});

//						}
					}
				}
				else if(i==0)
				{
					imgsrc = asset_url+product_images[i];
//					if( !is_mobile )
//					{
//						$('.product_detail_right').find('img').attr('src', imgsrc);
//						$('.product_detail_right').find('img').attr("data-cloudzoom",'zoomImage:'+imgsrc+', zoomSizeMode: \'zoom\'');
//						$('.cloudzoom-lens').find('img').attr("src", imgsrc);
//					}
//					else
//					{
//						$('.product_detail_right').find('img').attr('src', imgsrc);
						$('.Cloudwebs_zoom').each(function()
						{
							obj = $(this);
							
							if(i==parseInt(obj.attr('index')))
							{
								obj.attr( 'src', imgsrc);
								return false;
							}
						});

//					}
				}
				
				if(i>=slt_len)	//if images are more then previous load then append 
				{
//					if( !is_mobile )
//					{
//						if(i<=3)		//make first four images active
//						{active='style="position:relative; display:block" act="active"';} else{active='style="position:relative; display:none" act="in-active"';}
//
//						var html = '<div class="product_detail_slider_image" '+active+'><img index="'+i+'" class="cloudzoom-gallery" src="'+asset_url+product_images[i]+'" data-cloudzoom = "useZoom: \'.cloudzoom\', image: \''+asset_url+product_images[i]+'\', zoomImage: \''+asset_url+product_images[i]+'\' "/></div>';
//						$(".product_detail_bottom_arrow").before(html);
//					}
//					else
//					{
//						if(i<=4)		//make first five images active: mobile
//						{active='style="" act="active"';} else{active='style="position:relative; display:none" act="in-active"';}
//						
//						var html = '<img class="product_detail_slider_image" src="'+asset_url+product_images[i]+'" index="'+i+'" '+active+'/>';
//						$(".product_detail_bottom_arrow").before(html);
//					}

					
						
					var html = '<li><a href="javascript:void(0);"><img class="Cloudwebs_zoom" index="'+i+'" data-zoom-image="'+asset_url+product_images[i]+'" src="'+asset_url+product_images[i]+'" /></a></li>'; 
					$("#slides_main").append(html);

					
					html = '<li><a href="javascript:void(0);" class="product_detail_slider_image"><img src="'+asset_url+product_images[i]+'" index="'+i+'" alt="<?php echo ucfirst($product_name);?>" title="<?php echo ucfirst($product_name);?>" class="h100" /></a></li>'; 
					$("#slider_images").append(html);
				}
				else			//else just refresh img src
				{
					$('.Cloudwebs_zoom').each(function()
					{
						obj = $(this);
						
						if(i==parseInt(obj.attr('index')))
						{
							obj.attr( 'src', asset_url+product_images[i]);
							return false;
						}
					});

					
					$('.product_detail_slider_image').each(function()
					{
						obj = $(this).find('img');
						
						if(i==parseInt(obj.attr('index')))
						{
							obj.attr( 'src', asset_url+product_images[i]);
							return false;
						}
					});
				}
			}
			
			if(img_len<slt_len)	//remove if images are less then previous load then remove old images
			{
				temp =0;
				$('.Cloudwebs_zoom').each(function()
				{
					temp++;
					if(temp>img_len)
					{
						$(this).parent().parent().remove();
					}
				});

				
				temp =0;
				$('.product_detail_slider_image').each(function()
				{
					temp++;
					if(temp>img_len)
					{
						$(this).remove();
					}
				});
			}
		}
		
	}
	
/** 
 * author Cloudwebs
 */
	function pageClosePopUp()
	{
		var ring_size_id = 0;
		
		if($('#ring_size_drop_down').length > 0)
		{
			ring_size_id = $('#ring_size_drop_down').val();
		}
		else if( $('select[name="ring_size_id_f"]').length > 0)
		{
			ring_size_id = $('select[name="ring_size_id_f"]').val();
			ring_size_id = ring_size_id + '|' + $('select[name="ring_size_id_m"]').val();
		}
		
		form_data = {pid : pid,ring_size_id : ring_size_id}; 
		var loc = (base_url+'jewellery/pageClosePopup');
		$.post(loc, form_data, function (data)
		{
			$.facebox( data );
		});
	}
	
/**
 * function will validate ring size if applicable
 */	
	function valRingSize( url )
	{
		var ring_size = ''; 
		if( $( "select[name='ring_size_id']" ).length > 0 && $( "select[name='ring_size_id']" ).is(':visible') )
		{
			ring_size = $("select[name='ring_size_id']").val(); 
			if( ring_size == '' )
			{
				$("select[name='ring_size_id']").css({'border' : '1px solid #FF0000'});
				$('#ring-size-error').text('Select ring size.');
				return false;
			}
		}
		else if( $( "select[name='ring_size_id_f']" ).length > 0 && $( "select[name='ring_size_id_f']" ).is(':visible') )
		{
			ring_size = $("select[name='ring_size_id_f']").val(); 
			if( ring_size == '' )
			{
				$("select[name='ring_size_id_f']").css({'border' : '1px solid #FF0000'});
				$('#ring-size-error').text('Select ring size.');
				return false;
			}
	
			var temp = $("select[name='ring_size_id_m']").val(); 
			if( temp == '' )
			{
				$("select[name='ring_size_id_m']").css({'border' : '1px solid #FF0000'});
				$('#ring-size-error').text('Select ring size.');
				return false;
			}
	
			ring_size = ring_size + '|' + temp;
		}
		
		window.location.href = url+'&ring_size='+ring_size;
	}
