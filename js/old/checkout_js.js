/*
 * @author Cloudwebs
 * @abstract function will log out user and display login form
 */
function logOut()
{
	$('#login_loading_img_che').show();
	var loc = (base_url+'checkout/logOut');
	$.post(loc, '', function (data)
	{
		var arr =$.parseJSON(data);
		if(arr['type']=='success')
		{
			window.location.href = base_url + "checkout";	//On 12-05-2015 redirected to checkout instead of login :-)
			//$('#login_loading_img_che').hide();
			//$('#log_out_').hide();
			//$('#log_in_').show();
			
			//refreshWishCart();	//refresh cart and wish list field
		}
		$('#login_loading_img_che').hide();
	});
}

/*
 * @author Cloudwebs
 * @abstract function will log in user and display shipping form
 */
function logIn()
{
	$('#login_loading_img_che_login').show();
	if($('#checkout_pass_p').is(':checked'))
	{
		login_data = $('#login').serialize();
		var loc = (base_url+'login');		
		$.post(loc, login_data, function (json) {
			var resp = ($.parseJSON(json));

			if(resp['error'])
				displayErrors(resp['error']);

			if(resp['warning'])
			{
				showPopUpNotification('warning',resp['warning']);
				//$('.contain').prepend(getNotificationHtml('warning',resp['warning']));
				//$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
			
			if(resp['success'])
			{
				$('.input-notification').hide();
				location.reload();
			}		
		
			$('#login_loading_img_che_login').hide();
		});
	}
	else
	{
		login_data = $('#login').serialize();
		var loc = (base_url+'checkout/guestSignup');		
		$.post(loc, login_data, function (json)
		{
			var resp = ($.parseJSON(json));
			
			if(resp['error'])
				displayErrors(resp['error']);
			else if(resp['type']=='success')
			{
				$('.input-notification').hide();
				location.reload();
			}
			$('#login_loading_img_che_login').hide();
		});
	}	
}

/*
 * @author Cloudwebs
 * @abstract function will load address in shipp/bill address form
 */
function applyAddress(type, id, loader_img_id, div_id, read, obj, is_edit_mode)
{
	$('#'+loader_img_id).show();
	if(obj!=null && !$(obj).is(':checked') && !is_edit_mode)
	{
		id=0;
		read=0;
	}
	else if(obj!=null)
	{
		$('.'+type+'_che').prop('checked',false);	
		$(obj).prop('checked',true);	
	}
	
	if(type=='shipp' && obj!=null)
	{
		shipp_add_id = id;
	}
	else if(type=='bill')	
	{
		bill_add_id=id;
	}
	
	form_data = {type : type,id : id,read : read};
	var loc = (base_url+'checkout/applyAddress');
	$.post(loc, form_data, function (data)
	{
		$('#'+div_id).html(data);	
		
		if( is_mobile )
		{
			$('#'+div_id).trigger( "create" );	
		}
		
		$('#'+loader_img_id).hide();
	});

	checkUncheck();
	showHideDiv($('#same_as_billing_address'));
}

/*
 * @author Cloudwebs
 * @abstract function will load address in shipp/bill address form
 */
function applyShipInfo(loader_img_id)
{
	$('#'+loader_img_id).show();
	form_data = $('#add_form').serialize();
	var loc = (base_url+'checkout/applyShipInfo');
	$.post(loc, form_data, function (data)
	{
		var arr = $.parseJSON(data);
		if(arr['type']=='error')
		{
			displayErrors(arr['error']);
		}
		else if(arr['type']=='warning')
		{
			showPopUpNotification(arr['type'],arr['msg']);
			//$('.contain').prepend(getNotificationHtml(arr['type'],arr['msg']));
			//$('html, body').animate({ scrollTop: 0 }, 'slow');
		}
		else if(arr['type']=='success')
		{
			$('.input-notification').hide();
			location.href = base_url + "checkout";
		}

		$('#'+loader_img_id).hide();
	});
}

/*
 * @author Cloudwebs
 * @abstract function will load payment methods
 */
function payMethods()
{
	var loc = (base_url+'checkout/payMethods');
	$.post(loc, '', function (data)
	{
		if($('#pay_method_div').length>0)
		{
			$('#pay_method_div').remove();			
		}
		$('#shipp_info_div').after(data);
	});
}

/**
 * @author Cloudwebs
 * @abstract function will load address in shipp/bill address form
 */
function showHideDiv(obj)
{
	if($(obj).is(':checked'))
	{
		$('#bill_div').hide();
	}
	else
	{
		$('#bill_div').show();
	}
}

/*
 * @author Cloudwebs
 * @abstract function will check/uncheck checkbox of same as address
 */
function checkUncheck()
{
	if(shipp_add_id==bill_add_id && shipp_add_id!=0)
	{
		$('#same_as_billing_address').prop('checked',true);
		$('#same_as_billing_address').attr("disabled", true);
	}
	else if(shipp_add_id!=0 || bill_add_id!=0)
	{
		$('#same_as_billing_address').removeAttr("disabled");
		$('#same_as_billing_address').prop('checked',false);
	}
}

/*
 * @author Cloudwebs
 * @abstract function will edit/save Address of user 
 */
function editAddress(type,loader_img_id,obj)
{
	$('#'+loader_img_id).show();
	form_data = $('#add_form').serialize();
	var loc = (base_url+'checkout/editAddress');
	$.post(loc, form_data, function (data)
	{

		var arr = $.parseJSON(data);
		if(arr['type']=='error')
		{
			displayErrors(arr['error']);
		}
		else if(arr['type']=='success')
		{
			$('.input-notification').hide();
			$(obj).hide();
			showPopUpNotification( arr['type'], arr['msg']); 
			//$('.contain').prepend( );
			//$('html, body').animate({ scrollTop: 0 }, 'slow');
		}
		
		$('#'+loader_img_id).hide();
	});
}

function show_payment_option(opt, val){
		$('#payment_method_id').val( val ); 
		$('.tradus-payment-button ul li').removeClass('selectedbox');
        $('.tradus-payment-button ul li#option_selector_' + opt).addClass('selectedbox');
		$('.tradus-form-container div.tradus-select-user-address-page2').hide();
		$('.tradus-form-container div#option_'+opt).show();
}

$(document).ready(function()
{
	checkUncheck();
});
