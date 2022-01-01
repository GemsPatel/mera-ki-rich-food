jQuery(document).ready(function(){
	
	jQuery('#CloudwebsModal').modal('hide');
	
							
	/*
	+-------------------------------------------------------------+
		function  will detect if any serach filter elements is clicked
	+-------------------------------------------------------------+
	*/	
		jQuery('body').on( 'change', '.search',function()
		{
			submitSearchNew( jQuery(this).attr('act-'), false ); 
		});
		
		//Review Form
		jQuery(".rstar").on('click',function()
		{
			jQuery(".rstar").removeClass("fa-star").addClass("fa-star-o");
			
			var rat = jQuery(this).data("rat");
			for(var i = 1; i <= rat; i++ )
			{
				jQuery("#rat"+i).removeClass("fa-star-o").addClass("fa-star");
			}
			document.getElementById("product_review_rating").value = rat;
		
		});

		
		//sol_dia_filter event
		var sol_fil_ev = '';
		if( is_mobile )
		{
			sol_fil_ev = 'change';	
		}
		else
		{
			sol_fil_ev = 'click';	
		}

		jQuery('#solfilter').on( sol_fil_ev, '.dia_fil', function() {
			if( !is_mobile )
			{
				if( jQuery( this ).hasClass( 'act_dia' ) )
				{ jQuery( this ).removeClass('act_dia'); }
				else
				{ jQuery( this ).addClass('act_dia'); }
			}
			else 
			{
				if( jQuery( this ).val() == '' )
				{ jQuery( this ).removeClass('act_dia'); }
				else if( !jQuery(this).hasClass( 'act_dia' ) )
				{ jQuery( this ).addClass('act_dia'); }
			}
		  
			searchDiamond( this );					
		});
		
		jQuery('body').on( 'click', '.sort_by', function(){
		  
		  if( jQuery( this ).hasClass( 'asc' ) )
		  { jQuery( this ).removeClass('asc').addClass('desc'); }
		  else
		  { jQuery( this ).removeClass('desc').addClass('asc'); }
		  
		  searchDiamond( this );
		});
		
		// Create Account 
		jQuery('button[name=create_account]').on('click',function(){
//			document.getElementById("signup").disabled = true;
			jQuery('#signup').addClass("hide");
			jQuery('#signup_loading_img').removeClass("hide");
			form_data = jQuery('#form-validate-register').serialize();
			var loc = (base_url+'login/createNewAccount');		
			jQuery.post(loc, form_data, function (json) {
				var resp = (jQuery.parseJSON(json));
				
				if(resp['error'])
					displayErrors(resp['error']);
				
				if(resp['success'])
				{
					jQuery('input[class=c-form]').val('');
					jQuery('.input-notification').hide();
					window.location.href = base_url+'account/invite-friends';
					//jQuery('.contain').prepend(getNotificationHtml('success',resp['success']));
				}		
				jQuery('#signup_loading_img').addClass("hide");
				jQuery('#signup').removeClass("hide");
				document.getElementById("signup").disabled = false;
			});
		});
		
		// Login 
		jQuery('button[name=sign_in]').on('click',function(){
//			document.getElementById("login").disabled = true;
			jQuery('#login').addClass("hide");
			jQuery('#login_loading_img').removeClass("hide");
			login_data = jQuery('#login-form').serialize();
			var loc = (base_url+'login');		
			jQuery.post(loc, login_data, function (json) {
				var resp = (jQuery.parseJSON(json));
				
				if(resp['error'])
					displayErrors(resp['error']);
				
				if(resp['warning'])
				{
					jQuery('.contain').prepend(getNotificationHtml('warning',resp['warning']));
//					document.getElementById("Error_login").innerHTML=resp['warning'];
				}
				
				if(resp['success'])
				{
					jQuery('.input-notification').hide();
					window.location = resp['ref_url'];
				}		
				
				jQuery('#login_loading_img').addClass("hide");
				jQuery('#login').removeClass("hide");
				document.getElementById("login").disabled = false;
			});
		});
		
		// Forgot Password 
		jQuery('input[name=forgot_password]').on('click',function(){
			jQuery('#forgot_loading_img').removeClass("hide");
			jQuery('#btn_f_password').addClass("hide");
			forgot_data = jQuery('#forgot').serialize();
			var loc = (base_url+'login/forgotpassword');		
			
			jQuery.post(loc, forgot_data, function (json) {
				var resp = (jQuery.parseJSON(json));		
				if(resp['error'])
					displayErrors(resp['error']);
				
				if(resp['success'])
				{
					jQuery('.input-notification').hide();
					jQuery('input[name=forgot_email]').val('');
					jQuery('.contain').prepend(showPopUpNotification('success',resp['success']));
				}
				jQuery('#forgot_loading_img').addClass("hide");
				jQuery('#btn_f_password').removeClass("hide");
			});
		});
		
});

/**
 * added on 17-04-2015
 */
jQuery(window).load(function()
{
	/**
	 * check if notification on load is available then show it
	 */
	if( type != "" && message != "" )
	{
		showPopUpNotification(type,message); 
	}
	
	if( appLaunch && is_download_app == 1 )
	{
		jQuery('#mobile_app').click();
	}
	
});

/*
+----------------------------------------------+
	This function will return notification html
	@params : type -> type of notification.
			  message - > message you want dispaly 
			  				as error.
+----------------------------------------------+
*/
function getNotificationHtml(type,message)
{
	var ht = '<div class="notification '+type+' png_bg"><a href="#" class="close"><img src="'+asset_url+'images/admin/cross_grey_small.png" title="Close this notification" alt="close"></a><div>'+message+'."getNotificationHtml"</div></div>';
		window.setTimeout(hideNotification, 5000);
	return ht;
}	

/*
+----------------------------------------------+
	This function will return notification html
	@params : type -> type of notification.
			  message - > message you want dispaly 
			  				as error.
+----------------------------------------------+
*/
function showPopUpNotification(type,message)
{
	
	var ht = '<div class="notification '+type+'"><div>'+message+'</div></div>';
	jQuery("#modal_body").html(ht);
	jQuery("#noti_popup_a").click();
	
}	

/**	
 * function will add prod in cart
 */
function addWishList(pid,token)
{
	showLoader();
	var loc = (base_url+'cart/add_wishlist');
	form_data = {pid : pid,token : token};
	jQuery.post(loc, form_data, function (data)
	{
		hideLoader();
		var arr = jQuery.parseJSON(data);
		if(arr['type']=='success')
		{
			showPopUpNotification('success',arr['msg']);
			refreshWishCart();
		}
		else if(arr['type']=='warning')
		{
			showPopUpNotification('warning',arr['msg']);	//On 11-05-2015 changed to warning from success as obvious
		}
	});
}
 
/**	
 * function will add prod in cart
 */
function addProduct(pid, is_cart, token, type, ring)
{
	 var qty = 1;
	 if( jQuery( "#qty" ).length > 0 ) 
	 {
		 qty = jQuery( "#qty" ).val(); 
	 }
	 else if( jQuery( "#qty_"+pid ).length > 0 ) 
	 {
		 if( jQuery( "#qty_"+pid ).val().length == 0 )
		 {
			 showPopUpNotification('warning', getLangMsg("qtyw") );
			 return false; 
		 }
		 
		 qty = jQuery( "#qty_"+pid ).val();
	 }
	
	if(typeof token === 'undefined')
		 token = '';
	 
	var ring_size = ring; 
	if( jQuery( "select[name='ring_size_id']" ).length > 0 && jQuery( "select[name='ring_size_id']" ).is(':visible') )
	{
		ring_size = jQuery("select[name='ring_size_id']").val(); 
		if( is_cart && ring_size == '' )
		{
			jQuery("select[name='ring_size_id']").css({'border' : '1px solid #FF0000'});
			jQuery('#ring-size-error').text('Select ring size.');
			return false;
		}
	}
	else if( jQuery( "select[name='ring_size_id_f']" ).length > 0 && jQuery( "select[name='ring_size_id_f']" ).is(':visible') )
	{
		ring_size = jQuery("select[name='ring_size_id_f']").val(); 
		if( is_cart && ring_size == '' )
		{
			jQuery("select[name='ring_size_id_f']").css({'border' : '1px solid #FF0000'});
			jQuery('#ring-size-error').text('Select ring size.');
			return false;
		}

		var temp = jQuery("select[name='ring_size_id_m']").val(); 
		if( is_cart && temp == '' )
		{
			jQuery("select[name='ring_size_id_m']").css({'border' : '1px solid #FF0000'});
			jQuery('#ring-size-error').text('Select ring size.');
			return false;
		}

		ring_size = ring_size + '|' + temp;
	}
	else if( jQuery( "#include_chain" ).length > 0 && jQuery( "#include_chain" ).is(':checked') ) 
	{
		ring_size = "include_chain"; 
	}
	
	showLoader();
	var loc = (base_url+'cart/add');
	form_data = {pid : pid,token : token,ring_size : ring_size, type : type, qty:qty};
	jQuery.post(loc, form_data, function (data)
	{
		hideLoader();
		var arr = jQuery.parseJSON(data);
		if(arr['type']=='success')
		{
			if(is_cart)
			{
				window.location.replace(base_url+'cart');
			}
			else
			{
				refreshWishCart();
				showPopUpNotification('success',arr['msg']);
			}
		}
	});
}

 /*	
 * refresh wishlist cart
 */
 function refreshWishCart()
 {
	var loc = (base_url+'cart/refreshWishCart');
	jQuery.post(loc, '', function (data)
	{
		var arr = jQuery.parseJSON(data);
		jQuery("#h_wish").text( arr['wish'] );
		jQuery("#h_cart").text( arr['cart'] );
	});
 }

/**
 * @author Cloudwebs
 * @abstract used in page scroll pagination
 */
function scrPagination(e)
{
	if( is_listing_page )
	{
		if(jQuery(window).scrollTop() + jQuery(window).height() > jQuery(document).height() - 200)
		{
		   if(is_records && is_called===false)
		   {
				is_called = true;
				
				if( is_mobile )
				{
					jQuery.mobile.loading( 'show' );
   				}
				else
				{
					jQuery('#right-catagory').append('<img src="'+asset_url+'images/bx_loader.gif" title="loading" alt="loading" id="scroll_loader" style="margin-left: 48.5%;margin-top: 5%;"/>');										   				}
					
				var loc = base_url + 'products/scrollPagination';
				form_data = { page : filter_page, cz : cz };
				jQuery.get(loc, form_data, function(data)
				{
					if(data!='')
					{
						jQuery('#scroll_loader').remove();
						jQuery('#right-catagory').append(data);
						
						if( is_mobile )
						{
							jQuery.mobile.loading( 'hide' ); 
							jQuery('#right-catagory').listview( "refresh" );							
						}
					}
					else
					{
						if( is_mobile )
						{
							jQuery.mobile.loading( 'hide' ); 
						}
						else
						{
							jQuery('#scroll_loader').remove();
						}
						
						is_records = false;	
					}
					is_called = false;
				});
		   }
		}
	}
	else if( is_sol_listing )
	{
		//only used in mobile version
		if( jQuery(window).scrollTop() + jQuery(window).height() > jQuery(document).height() - 900 )
		{
			if(is_records && is_called===false)
			{
				is_called = true;
				
				if( is_mobile )
				{
					jQuery.mobile.loading( 'show' );
   				}
				else
				{
					jQuery('#diamond_loader').show();
   				}
				
				var loc = base_url + 'solitaires/diamondScroll';
				form_data = {  ev : ev };
				jQuery.get(loc, form_data, function(data)
				{
					if(data!='')
					{ 
						jQuery('#dia_fil_res').append(data); 
						if( is_mobile )		
						{
							jQuery.mobile.loading( 'hide' ); 
							jQuery('#sol_list_grid').trigger("create");
							jQuery('#table-column-toggle').table( "refresh" ).trigger("create");
						}
					}
					else
					{ 
						is_records = false; 
					}
					
					if( is_mobile )
					{
						jQuery.mobile.loading( 'hide' ); 
					}
					else
					{
						jQuery('#diamond_loader').show();
					}
					
					is_called = false;
				});
			}
		}
	}
}

/*
+-------------------------------------------------------------+
	function  will detect if any serach filter elements is clicked
+-------------------------------------------------------------+
*/	
	function changeSelect(obj)
	{
		checkbox = document.getElementById(jQuery(obj).attr('id').substring(2));
		if(jQuery(checkbox).is(':checked'))
		{
			jQuery(checkbox).removeAttr('checked');
		}
		else
		{
			jQuery(checkbox).prop('checked','true');
		}
		submitSearchNew( jQuery(obj).attr('act-'), false );
	}
	
/*
+-------------------------------------------------------------+
	function  will detect if any serach filter elements is clicked
+-------------------------------------------------------------+
*/	
	function applySort(obj)
	{
		submitSearchNew('', true);
	}
	
/*
+-------------------------------------------------------------+
	@author Cloudwebs Note: New implementation on 25/10/2013
	function  will submit filter form
+-------------------------------------------------------------+
*/	
	function submitSearchNew(loc, is_term_or_sort)
	{
		if( loc == '' && is_term_or_sort == true && jQuery('#seo_url').length > 0 )
		{
			loc = jQuery('#seo_url').val();		
		}
		
		var term = jQuery('input[name="search_terms_keywords"]').val();
		if(  typeof term !== 'undefined' && term != null && term != '' )
		{
			 term = term.replace(" ","-"); 	
		}
		else { term = ''; }

		var sort_by = jQuery('#sort_by').val();
		if( typeof sort_by !== 'undefined' && sort_by != null && sort_by != '' )
		{}
		else { sort_by = ''; }

		if( term != '' && sort_by != '' )
		{
			loc = loc + '+sort-' + sort_by + '+' + term;				
		}
		else if( term != '' )
		{
			loc = loc + '+' + term;				
		}
		else if( sort_by != '' )
		{
			if( loc != 'valentine-gifts/' && loc != 'ready-to-ship/' )
			{
				loc = loc + '+sort-' + sort_by;				
			}
			else
			{
				loc = loc + 'sort-' + sort_by;				
			}
		}
		
		
		if( loc == '' )
		{
			loc = '';
		}
		else if( loc.substring( 0, 1) == '+' )
		{
			loc = loc.substring( 1 ); 	
			loc = loc + '.html';
		}
		else
		{
			loc = loc + '.html';	
		}
		
		//jQuery('#searchf').submit();
		//console.log( base_url+'products/'+loc );
		window.location.href = base_url+'search/'+loc;
	}
	
/*
 * @author Cloudwebs
 * function will search accordings to keywords entered
*/
function keywordSearch()
{
	submitSearchNew('', true);
}

/**
 * @author Cloudwebs
 * @abstract changes currency as specified by user
 */
function changeCurrency(id)
{
	var loc = base_url+'home/changeCurrency';
	form_data = {currency_id : id};
	jQuery.post(loc, form_data, function (data)
	{

		var arr = jQuery.parseJSON(data);
		if(arr['type']=='success' )
		{
			window.location.reload(); 
		}
		else
		{
			jQuery('.contain').before( getNotificationHtml(arr['type'], arr['msg']) );
		}
		
	});
}

/** 
 * @author Cloudwebs
 * @abstract function will concatenate two ringsize of men and women in case of couple product
 **/
 function concateRingSize( obj )
 {
	 var type = jQuery(obj).attr('type-');
	 var pid = jQuery(obj).attr('pid-');
	 
	 if(type=='F')
	 {
		return jQuery(obj).val()+'|'+jQuery('#ring_size_m_'+pid).val();	 
	 }
	 else
	 {
		return jQuery('#ring_size_f_'+pid).val()+'|'+jQuery(obj).val();	 
	 }
 }

/**
 * function will remove prod from cart
 */
function proceedCheckout(url)
{
	var is_ring_size = true;
	jQuery('.ring_size').each(function()
	{
		if( is_mobile && !jQuery(this).is('[id]') )
		{
							
		}
		else
		{
			if(jQuery(this).val()=='')
			{
				if( !is_mobile )
				{
					jQuery(this).css({'border' : '1px solid #FF0000'});
				}
				else
				{
					jQuery( '#'+jQuery(this).attr('id')+'-button' ).css({'border' : '2px solid #FF0000'});
				}
	
				jQuery('#'+jQuery(this).attr('id')+'_s').text('Select size');
				is_ring_size=false;
			}
			else
			{
				if( !is_mobile )
				{
					jQuery(this).css({'border' : '1px solid #000000'});
				}
				else
				{
					jQuery( '#'+jQuery(this).attr('id')+'-button' ).css({'border' : '1px solid #000000'});
				}
				jQuery('#'+jQuery(this).attr('id')+'_s').text('');
			}
		}
	});
	
	if(is_ring_size)
	{
		document.location.href= url;
	}
}

/**
 * function will remove prod from cart
 */
function removeProduct(id,cid)
{
	if(confirm('Are you sure to delete?'))
	{
		form_data = {id : id,cid : cid}; 
		var loc = (base_url+'cart/removeProduct');
		jQuery.post(loc, form_data, function (data)
		{
			var arr = jQuery.parseJSON(data);
			if(arr['type']=='success')
			{
				location.reload(); 
			}
		});
	}
}

/**
 * function will remove prod from wishlist 
 */
 function removeWishlist(id,cid)
 {
	if(confirm('Are you sure to delete?'))
	{
		form_data = {id : id,cid : cid}; 
		
		var loc = (base_url+'cart/removeWishlist');
		jQuery.post(loc, form_data, function (data)
		{
			var arr = jQuery.parseJSON(data);
			if(arr['type']=='success')
			{
				location.reload(); 
			}
		});
	}
 }
 
/**
 * function will update qty of product cart
 */
 function updateQty(qty,id,cid,ring_size)
 {
	if(qty==0)
	{
		qty = jQuery("select[name='product_qty-"+id+"']").val();	 
	}
	 
    //console.log( qty );
	form_data = {id : id,cid : cid,qty : qty,ring_size : ring_size}; 
	var loc = (base_url+'cart/updateQty');
	jQuery.post(loc, form_data, function (data)
	{
		var arr = jQuery.parseJSON(data);
	    //console.log( arr );
		if(arr['type']=='success')
		{
			location.reload(); 
		}
	});
 }
 
/**
 * function will update qty of product cart
 */
 function applyCoupon()
 {
	form_data = {coupon : jQuery('#coupon_in').val()}; 
	var loc = (base_url+'cart/applyCoupon');
	jQuery.post(loc, form_data, function (data)
	{
		jQuery('.coupon').remove();
		var arr = jQuery.parseJSON(data);
		if(arr['type']=='success')
		{
			jQuery('#coupon_msg').css({'color':'green'});
			jQuery('#coupon_msg').text(arr['msg']);
			var html = '<tr class="clearfix coupon shipping"><th>Discount '+arr['coupon_type']+':</th>';
		    html += '<td>'+arr['coupon_discount_amt']+'</td></tr>';
        	html += '<tr class="total clearfix coupon"><th>Grand Total:</th>';
		    html += '<td>'+arr['grand_total']+'</td></tr>';
        	
			jQuery('#check_tbl').append(html);
		}
		else
		{
			jQuery('#coupon_msg').css({'color':'red'});
			jQuery('#coupon_msg').html(arr['msg']);
		}
	});
 }
 
 /*
+---------------------------------------------+
	Function is displaying form error beside the
	input area.
	@params : errorArray : 2 dimensional array with
							name of input.
+---------------------------------------------+
*/
function displayErrors(errorArray)
{
	//hide all previous notifications
	jQuery('.input-notification').hide();
	
	//setting error into form
	for(x in errorArray)
	{
		jQuery('.input-notification[for="'+x+'"]').html(errorArray[x]).show();
		//jQuery('.c-form').attr('class','c-form error');
		//jQuery('.content-field1 ul li').attr('class','li error');
	}
}	

/*+---------------------------------------------+
	New 
	@author Cloudwebs 
	get state form country id
	@param id country id
	@param name state select box name
+---------------------------------------------+
*/
function getState(id,name)
{
	jQuery('select[name="'+name+'"] option:first').text('Please Wait...') // displaying loading texts;
	var loc = base_url+'login/getState';
	form_data = {country_id : id, name : name};
	jQuery.post(loc, form_data, function (data) {
		jQuery('select[name="'+name+'"]').html(data);
		
		if( is_mobile )
		{
			jQuery("#"+name).closest( 'div' ).find('span').text( jQuery('select[name='+name+'] > option:first-child').text() );
		}
		
	});
}

/*
 *	function will load city as per state selected
 */
function loadCity(state_id,class_name,con_url)
{
	return false;	//disabled: 14/1/2014
	jQuery("."+class_name).html('Loading...');
	form_data={state_id : state_id};
	var loc = (base_url+con_url);
	jQuery.post(loc, form_data, function (data)
	{
		jQuery("."+class_name).html(data);
	});
}

/**
 * @author Cloudwebs
 * @abstract function will search and display diamonds
 */
function searchDiamond(obj)
{
	//to overcome jQuery mobile multiple onload call
	if( is_called )
	{
		return false;	
	}
	
	jQuery('#diamond_loader').show();
    is_records = true;
	is_called = true;

	var param = '';
	jQuery('.act_dia').each(function(data) {
		if( is_mobile )
		{
			if( _hasAttr( this, 'data-type' ) )
			{
				param = param + jQuery(this).data('type') + '=' + jQuery(this).val() + '-';
			}
		}
		else
		{
			param = param + jQuery(this).data('type') + '=' + jQuery(this).data('id') + '-';
		}
	});
	
	var sf = jQuery(obj).attr('f');
	var ss = jQuery(obj).attr('s');
	
	var ct_str = jQuery('#carat_start').val();	var ct_end = jQuery('#carat_end').val();
	form_data = { prc_str:prc_str, prc_end:prc_end, ct_str:ct_str, ct_end:ct_end, param:param, ev:ev, f:sf, s:ss };
	
	var loc = base_url + 'solitaires/searchDiamond';
	jQuery.get(loc, form_data, function(data){
		 jQuery('.dia_fil_rm').remove();
		 jQuery('.SearchPanel').after(data);
		 
		 if( is_mobile )
		 {
			jQuery('#sol_list_grid').trigger("create");
		 }
	 
		 is_called = false;
	});
}

/**
* @abstract Function Product click pagination
*/
function diamondCcPag( start )
{
	if(is_called===false)
	{
		is_called = true;
		jQuery('#diamond_loader').show();
		var loc = base_url + 'solitaires/diamondScroll';
		form_data = {  ev : ev, start:start };
		jQuery.get(loc, form_data, function(data)
		{
			if(data!='')
			{ jQuery('#dia_fil_res').html(data); }
			else
			{ is_records = false; }
				  
			jQuery('#diamond_loader').hide();
			is_called = false;
		});
	}
}

/**
 * @abstract common helper function to check if element has particular attr
 */
function _hasAttr( obj, attr)
{

	if( jQuery(obj).is("["+attr+"]") )
	{
		return true;
	}
	else
	{
		return false;
	}
	
}

/*+---------------------------------------------+
	@author Cloudwebs 
	funxtion will delete customer address from address book
	@param id custmoer_id
	@param add_id
+---------------------------------------------+
*/
function deleteAddress(id,add_id)
{
	if(confirm('Are you sure to delete?'))
	{
		var loc = base_url+'account/deleteAddress';
		form_data = {id : id,add_id : add_id};
		jQuery.post(loc, form_data, function (data)
		{
			var arr =jQuery.parseJSON(data);
			if(arr['type']=='success')
			{
				jQuery('#row_'+add_id).remove();
			}
			jQuery('.contain').prepend(showPopUpNotification(arr['type'],arr['msg']));
			jQuery('html, body').animate({ scrollTop: 0 }, 'slow');
		});
	}
}

/**
 * @abstract handle mobile chat button click events
 */
function pf_mbChatClick()
{
	window.location = base_url+'home/mobileChat';	
}

/*
save request for ring sizer
*/
function saveOrderRingSizer(obj)
{
	btnVal = jQuery(obj).attr('value');
	if(btnVal == 'Yes')
		form_data = jQuery(obj).serialize() + "&YesBtn=Yes";
	else
		form_data = jQuery(obj).serialize();
		
	jQuery('.popup_loader_div img').css('display', 'block');
	jQuery.post(base_url+'home/orderRingSizerPopup',form_data,function(response){ 
		var cts = jQuery.parseJSON(response);
		if(typeof(cts.success) == 'undefined')
			displayErrors(cts);
		else
		{
			if(btnVal == 'Yes')
				jQuery('.notification_area_if_customer_login').html(getNotificationHtml('success','Your request is successfully saved.'));
			else
			{
				jQuery('.input-notification',obj).hide();
				jQuery(obj).find('.notification_area_feedback').html(getNotificationHtml('success','Your request is successfully saved.'));
				jQuery(obj).find('.c-form').val('');
			}
		}
		jQuery('.popup_loader_div img').css('display', 'none');
		
	});
	return false;
}

/*
save feed back form 
*/
function saveFeedbackForm(obj)
{
	document.getElementById("btn_load").disabled = true;
	jQuery.post(base_url+'home/feedback',jQuery(obj).serialize(),function(response){ 
		var cts = jQuery.parseJSON(response);
		if(typeof(cts.success) == 'undefined')
			displayErrors(cts);
		else
		{
			jQuery('.input-notification',obj).hide();
			jQuery('#note').html('<div class="notification_ok">Your message has been sent. Thank you!</div>');
			jQuery("#fields input, #fields textarea").val('');
			//jQuery(obj).find('.notification_area_feedback').html(getNotificationHtml('success','Your message has been submitted.'));
			//jQuery(obj).find('#contact_page input,#contact_page textarea').val('');
		}
		document.getElementById("btn_load").disabled = false;
	});
	return false;
}

/**
 * updates language session  
 */
function updateLang(obj)
{
	if( jQuery(obj).val() != "" )
	{
		showLoader();
		var loc = (base_url+'home/setLangSession');
		jQuery.get(loc, { set : "lang",  lang : jQuery(obj).val() }, function (data)
		{
			hideLoader();
			var arr = jQuery.parseJSON(data);
			if(arr['type']=='success')
			{
				window.location.reload();
			}
			else
			{
				jQuery('#content').before(getNotificationHtml(arr['type'],arr['msg']));
			}
			
		});
	}
	
}

/*
save Review form write by Gautam
*/
function saveReview(obj)
{
	jQuery('#btn_review').addClass("hide");
	jQuery('#review_loading_img').removeClass("hide");
	jQuery.post(base_url+'home/review',jQuery(obj).serialize(),function(response){ 
		var cts = jQuery.parseJSON(response);
		if( cts["type"] == "error" )
			displayErrors(cts["error"]);
		else
		{
			jQuery('.input-notification',obj).hide();
			jQuery('#note').html('<div class="notification_ok"><i class="fa fa-thumbs-up"></i> '+cts["msg"]+'</div>');
			jQuery("textarea.frm").val('');
			//jQuery(obj).find('.notification_area_feedback').html(getNotificationHtml('success','Your message has been submitted.'));
			//jQuery(obj).find('#contact_page input,#contact_page textarea').val('');
		}
		jQuery('#review_loading_img').addClass("hide");
		jQuery('#btn_review').removeClass("hide");
	});
	return false;
}

/*
+---------------------------------------------+
	show preloader at listing table.
+---------------------------------------------+
*/
function showLoader()
{
	jQuery('#preloader').removeClass("hide");
}
/*
+---------------------------------------------+
	hide preloader at listing table.
+---------------------------------------------+
*/
function hideLoader()
{
	jQuery('#preloader').addClass("hide");
	
}

/**
 * invite friends invitation join to us.
 * @param obj
 * @returns {Boolean}
 */
function inviteFriends(obj)
{
	jQuery('#btn_invitefriends').addClass("hide");
	jQuery('#invite_loading_img').removeClass("hide");
	jQuery.post(base_url+'home/inviteFriend',jQuery(obj).serialize(),function(response){ 
		var cts = jQuery.parseJSON(response);
		if( cts["type"] == "error" )
			displayErrors(cts["error"]);
		else
		{
			jQuery(obj).find('.input-notification').html(showPopUpNotification('success','Your message has been sent Success..'));
			jQuery("input[name=customer_partner_id]").val('');
			jQuery("input[name=customer_note]").val('');
			//jQuery(obj).find('#contact_page input,#contact_page textarea').val('');
		}
		jQuery('#invite_loading_img').addClass("hide");
		jQuery('#btn_invitefriends').removeClass("hide");
	});
	return false;
}
/*
 * Function will open zopim llive chat popup
 */
function zopimOpenWin()
{
	var myWindow = window.open("https://v2.zopim.com/widget/popout.html?key=2yb3PuH0zevUPedlCb39Z5QUo3Jzi42p","","addressbar=no,width=350,height=400");	
}
	
