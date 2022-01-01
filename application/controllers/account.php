<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class account extends CI_Controller {

	var $cTable = 'customer';
	var $cAutoId = 'customer_id';
	var $customerId=0;
	var $wishArr = array();
	var $is_ajax = false;
	//parent constructor will load model inside it
	function account()
	{
		parent::__construct();
		$this->load->model('mdl_account','ma');
		$this->ma->cTable = $this->cTable;
		$this->ma->cAutoId = $this->cAutoId;
		
		//[temp]
		//$this->session->set_userdata(array('customer_id'=>6));
		
		$this->ma->customerId = $this->customerId = $this->session->userdata('customer_id');

		
		//check if wish session set
		if ($this->session->userdata('wishArr') !== FALSE)
		{
			$this->wishArr = $this->session->userdata('wishArr');
		}
		
		$this->ma->is_ajax = $this->is_ajax = $this->input->is_ajax_request();
	}

/*
+-----------------------------------------+
	This function will remap url for admin,
	and remove unnecesary name from url.
	For example : if we don't want index
	strgin in url while listin item, we can 
	remove it using this function
+-----------------------------------------+
*/	
	function _remap($method,$params)
	{
		if(method_exists($this,$method))
			return call_user_func_array(array($this, $method), $params);
		else
		{
			$para[0] = $method;
			
			if(count($params) > 0)
				$para = array_merge($para,$params);
			
			//here we are going to call out custom function for load specific menu.
			call_user_func_array(array($this,'index'),$para);
		}
	}

	
	function index()
	{
		$data['customer_account_manage_balance'] = $this->ma->currentBalance();
		$data['custom_page_title'] = 'My Account';
		$data['pageName'] = 'account/index';
		$data['todayWatch'] = $this->getTodayWatchVDO();
		$data['nextWatch'] = $data['todayWatch'];
		$this->load->view('site-layout',$data);
	}
	
	function getTodayWatchVDO()
	{
		$customer_id = $this->session->userdata('customer_id');
		return executeQuery( "SELECT p.product_id, p.category_id, p.product_sku, p.product_name, p.product_alias, p.product_image, p.product_video, p.product_internal_note, p.product_short_description, p.product_angle_in, 
								pp.product_generated_code_info, pp.product_generated_code, pp.product_price_id
							FROM customer_video_map c
							INNER JOIN product p ON c.product_id = p.product_id 
							INNER JOIN product_price pp ON pp.product_id = p.product_id 
							WHERE c.customer_id = ".(int)$customer_id." 
							AND p.product_status = 0
							AND cvm_status = 0
							LIMIT 0, 10" );
	}
	
/*
+-----------------------------------------+
	Edit profile data for customer
+-----------------------------------------+
*/	
	function editAccount()
	{
		
		cmn_vw_editAccount();
// 		$this->form_validation->set_rules('customer_firstname','First Name','trim|required');
// 		$this->form_validation->set_rules('customer_lastname','Last Name','trim|required');
// 		$this->form_validation->set_rules('customer_gender','Gender','trim|required');
// 		$this->form_validation->set_rules('customer_phoneno','Phone No.','trim|required|numeric');
// 		//$this->form_validation->set_rules('customer_emailid','Email Id','trim|valid_email');
		
// 		$data = $this->ma->getAccountInfo();
// 		if($this->form_validation->run() == false)
// 		{
// 			if($_POST){
// 				$error_msg=$this->form_validation->get_errors();
// 				foreach($error_msg as $key=>$val){
// 					setFlashMessage('error',$val);
// 					break;
// 				}
// 			}			
// 			$data['custom_page_title'] = 'Edit Account';
// 			$data['pageName'] = 'account/edit-account';
// 			$this->load->view('site-layout',$data);
// 		}
// 		else
// 		{
// 			$this->ma->saveEditedAccountInfo();
// 			setFlashMessage('success','Your account information has been changed successfully.');
// 			redirect('account');
// 		}		
	}
	
/*
+-----------------------------------------+
	Callback function for check old password
	for current customer in database.
+-----------------------------------------+
*/			
	function checkForOldPassword($str)
	{
		$ps = md5($str.$this->config->item('encryption_key'));
		$d = $this->db->where('customer_password',$ps)->where($this->cAutoId,$this->customerId)->get($this->cTable)->row_array();
		
		if(count($d) == 0)
		{	
			$this->form_validation->set_message('checkForOldPassword','Please enter correct old password.');
			return false;
		}		
		else
			return true;
	}
	
/*
+-----------------------------------------+
	Change password functionality for customer
+-----------------------------------------+
*/	
	function changePassword()
	{
		
		cmn_vw_changePassword();
		
// 		$this->form_validation->set_rules('current_password','Current password','trim|required|callback_checkForOldPassword');
// 		$this->form_validation->set_rules('new_password','New password','trim|required|min_length[6]');
// 		$this->form_validation->set_rules('confirm_password','Confirm password','trim|required|matches[new_password]|min_length[6]');
		
// 		if($this->form_validation->run() == FALSE)
// 		{
// 			if($_POST){
// 				$error_msg=$this->form_validation->get_errors();
// 				foreach($error_msg as $key=>$val){
// 					setFlashMessage('error',$val);
// 					break;
// 				}
// 			}
// 			$data['custom_page_title'] = 'Change Password';
// 			$data['pageName'] = 'account/change-password';
// 			$this->load->view('site-layout',$data);
// 		}
// 		else
// 		{
// 			$this->ma->saveChangedPassword();
// 			setFlashMessage('success','Your password has been changed successfully.');
// 			redirect('account');
// 		}
	}
	
/**
 * @author Cloudwebs
 * @abstract function will fetch and display order detils
 *	
 */
	function disOrderDetails($id)
	{
		return $this->ma->disOrderDetails($id);
		//echo $this->load->view('account/order_details',$data);
	}
	
/*
+-----------------------------------------+
	Customer wishlist.
+-----------------------------------------+
*/
	function wishlist($start = 0)
	{
		$data = getWishData($this->wishArr,$this->customerId);
		$data['custom_page_title'] = 'My Wish List';
		$data['pageName'] = 'account/wishlist';
		$this->load->view('site-layout',$data);
	}
	
/*
+-----------------------------------------+
	Customer Order history.
+-----------------------------------------+
*/
	function orderHistory($start = 0)
	{
		//cmn_vw_order_history($start = 0); // to Change restAPI on 19-05-2015....
		$num = $this->ma->getOrderDetails();
		$data = pagiationData($this->router->class."/orderHistory",$num->num_rows(),$start,4);
		foreach($data['listArr'] as $k=>$ar)
		{
			$data['order_details_'.$ar['order_id']] = $this->disOrderDetails($ar['order_id']);
		}
		$data['custom_page_title'] = 'My Order History';
		$data['pageName'] = 'account/order-history';
		
		$this->load->view('site-layout',$data);
	}
	
/*
+-----------------------------------------+
	Customer Transactions.
+-----------------------------------------+
*/
	function transactions($start = 0)
	{
		$num = $this->ma->getTransactions();
		$data = pagiationData($this->router->class."/transactions",$num->num_rows(),$start,4);

		$data['customer_account_manage_balance'] = $this->ma->currentBalance();
		$data['custom_page_title'] = 'My Transactions';
		$data['pageName'] = 'account/transactions';
		$this->load->view('site-layout',$data);
	}
	
/*
+-----------------------------------------+
	Subscribe newsletter for customer
+-----------------------------------------+
*/	
	function newsletter()
	{
		cmn_vw_newsletter();
// 		if(!$_POST)
// 		{
// 			$data = $this->ma->getAccountInfo();
// 			$data['custom_page_title'] = 'Newsletter Subscription';
// 			$data['pageName'] = 'account/newsletter';
// 			$this->load->view('site-layout',$data);
// 		}
// 		else
// 		{
// 			$this->ma->saveNewsletter();
// 			setFlashMessage('success','Your newsletter subscription has been changed successfully.');
// 			redirect('account');
// 		}
	}
/*
+-----------------------------------------+
	Displays addresses of user
+-----------------------------------------+
*/	
	function addressBook($start = 0)
	{
		$num = $this->ma->addressBook();
		$data = pagiationData($this->router->class."/addressBook",$num->num_rows(),$start,4);
		$data['custom_page_title'] = 'My Address Book';
		$data['pageName'] = 'account/address-book';
		$this->load->view('site-layout',$data);
	}
/*
+-----------------------------------------+
	Deletes addresses of user
+-----------------------------------------+
*/	
	function deleteAddress()
	{
		echo json_encode($this->ma->deleteAddress());
	}
/*
+-----------------------------------------+
	Display addresses of user
+-----------------------------------------+
*/	
	function displayAddress()
	{
		$data = $this->ma->displayAddress();
		if(!$data)
		{
			redirect('account');	
		}
		else
		{
			$data['customer_id'] = $this->customerId;
			$data['custom_page_title'] = ($data['mode']=='add') ? 'Add Address' : 'Edit Address';
			$data['pageName'] = 'account/edit-address';
			$this->load->view('site-layout',$data);
		}
	}
/*
+-----------------------------------------+
	Save addresses of user
+-----------------------------------------+
*/	
	function saveAddress()
	{
		cmn_vw_saveAddress($this);
// 		$this->form_validation->set_rules('customer_address_firstname','First Name','trim|required');
// 		$this->form_validation->set_rules('customer_address_address','Address','trim|required|min_length[10]');
// 		$this->form_validation->set_rules('country_id','Country','trim|required');
// 		$this->form_validation->set_rules('state_id','State','trim');
// 		$this->form_validation->set_rules('address_city','City','trim|required');
// 		$this->form_validation->set_rules('customer_address_landmark_area','Area','trim|required');
// 		$this->form_validation->set_rules('pincode','Pincode','trim|required|numeric');
// 		$this->form_validation->set_rules('customer_address_phone_no','Mobile No','trim|required');

// 		if($this->form_validation->run() == FALSE)
// 		{
// 			$data['error'] = $this->form_validation->get_errors();
// 			if($data['error'])
// 				setFlashMessage('error',getErrorMessageFromCode('01005'));
// 			$data['mode'] = 'validation';	
// 			$data['custom_page_title'] = 'Edit Address';
// 			$data['pageName'] = 'account/edit-address';
// 			$this->load->view('site-layout',$data);
// 		}
// 		else 
// 		{
// 			$res = $this->ma->saveAddress();
// 			redirect('account/address-books');			
// 		}
	}
/*
 * @author   Cloudwebs
 * @abstract function will load city as per state selected
 */
	function loadCityAjax()
	{
		$state_id = $this->input->post('state_id');
		if(!empty($state_id))
		{
			echo loadCity($state_id);
		}
		else
		{
			echo '<option value="">- Select State First -</option>';	
		}
	}
	
/*
 * @author   Cloudwebs
 * @abstract function will load area as per city selected
 */
	function loadAreaAjax()
	{
		$city_name = $this->input->post('city_name');
		$state_id = $this->input->post('sta_id');
		if($city_name!='' && $state_id)
		{
			echo loadArea($city_name,$state_id);
		}
		else
		{
			echo '<option value="">- Select City First -</option>';	
		}
	}

/*
 * @author   Cloudwebs
 * @abstract function will load pincode as per area selected
 */
	function loadPincodeAjax()
	{
		$area_name = $this->input->post('area_name');
		$city_name = $this->input->post('city_name');
		$state_id = $this->input->post('sta_id');
		if($area_name!='')
		{
			echo json_encode(loadPincode($area_name,$city_name,$state_id));
		}
		else
		{
			return json_encode(array('pincode_id'=>'','pincode'=>''));	
		}
	}
	
/*
+-----------------------------------------+
	Display addresses of user
+-----------------------------------------+
*/	
	function orderReturns($start=0)
	{
		$num = $this->ma->getReturnDetails();
		$data = pagiationData($this->router->class."/order-returns",$num->num_rows(),$start,4);

		foreach($data['listArr'] as $k=>$ar)
		{
			$image_folder = '';
			$data['product_images_'.$ar['product_price_id']] = getProdImageFolder($ar['product_generated_code'],$ar['product_price_id']);
		}

		$data['custom_page_title'] = 'Order Return Information';
		$data['pageName'] = 'account/order-returns';
		$this->load->view('site-layout',$data);
	}
	

/*
 * @author   Cloudwebs
 * @abstract function will load order tracking page
 */
	function orderTracking()
	{		
		$order_id = _de($this->input->get('oid'));
		if(!empty($order_id))
		{
			$num = $this->ma->getOrderTracking($order_id);
			if($num)
			{
				$data['listArr'] = $num->result_array();
			}
			
			if(!is_array($data['listArr']) || sizeof($data['listArr'])==0)
			{
				setFlashMessage('error','Order not found.');
				redirect('');	
			}
	
			foreach($data['listArr'] as $k=>$ar)
			{
				$data['order_details'] = $this->disOrderDetails($ar['order_id']);
			}
			
			foreach($data['order_details']['data']['data_order'] as $k=>$ar)
			{
				$data['order_details']['data']['order_tracking'][$ar['order_details_id']] = $this->db->query('SELECT o.shipping_method_id, shipping_method_url, shipping_method_name, 
																							order_tracking_number, order_tracking_comment, order_tracking_modified_date, order_tracking_created_date, 
																							order_status_name, order_status_key,os.order_status_icon 
																							FROM order_tracking ot 
																							LEFT JOIN orders o
																							ON o.order_id=ot.order_id
																							LEFT JOIN order_status os 
																							ON os.order_status_id=ot.order_status_id 
																							LEFT JOIN shipping_method sm
																							ON sm.shipping_method_id=o.shipping_method_id
																							WHERE ot.order_details_id='.(int)$ar['order_details_id'].' 
																							AND ot.order_tracking_status=0 
																							ORDER BY order_tracking_id ASC')
																							->result_array();	
			}
			
			$data['customer_shipping_address'] = $this->db->query(" SELECT c.customer_address_firstname, c.customer_address_lastname, c.customer_address_address, 
												c.customer_address_phone_no, c.customer_address_zipcode, 
												 p.pincode,s.state_name,p.cityname,p.areaname,co.country_name
												 FROM customer_address c 
												 INNER JOIN pincode p ON p.pincode_id=c.customer_address_zipcode 
												 INNER JOIN state s ON s.state_id=p.state_id  
												 INNER JOIN country co ON co.country_id=s.country_id
												 WHERE customer_address_id=".$data['listArr'][0]['customer_shipping_address_id']." ")->row_array();
			$data['custom_page_title'] = 'My Order Tracking';
			$data['pageName'] = 'account/order-tracking';

			//pr($data['order_details']['data']['data_order']); 
			//pr($data['order_details']['data']['order_tracking']); 
			//die; 
			$this->load->view('site-layout',$data);
			
			
		}
		else
		{
			setFlashMessage('error','Invalid input.');
			redirect();	
		}
	}

/*
* Function will invite friends and send email
*/
	function inviteFriends()
	{
		$data['custom_page_title'] = 'Invite Friends';
		$data['pageName'] = 'account/invite-friends';		
		$data['customer_id'] = $this->ma->customerId = $this->customerId = $this->session->userdata('customer_id');
		$this->load->view('site-layout',$data);
		
	}
	
	/*
	 * Function will add buks
	 */
	function addBalance()
	{
		$cmn_vw = array();
		
		$customer_id = $this->session->userdata('customer_id');
		$videoId = $this->input->post('videoId');
		$product_id = getField( "product_id", "product", "product_video", $videoId );
		$watchPrice = getField( "config_value" , "configuration", "config_key", "VIDEO_PRICE" );
		
		//check user watch video success or not
		$camStatus = exeQuery( "SELECT customer_video_map_id, cvm_status FROM customer_video_map
														WHERE customer_id = ".$customer_id." AND product_id = ".$product_id );
		
// 		echo $camStatus['cvm_status'];
		if( $camStatus['cvm_status'] == 0 )
		{
			//Manage customer or user account
			$customer_account_manage_balance = exeQuery( "SELECT customer_account_manage_balance FROM customer_account_manage
														WHERE customer_id = ".$customer_id."
														ORDER BY customer_account_manage_id DESC LIMIT 1" );
			
// 			echo "<pre>".print_r($customer_account_manage_balance)."</pre>";
			
			$cam = array();
			$cam['customer_id'] = $customer_id;
			$cam['product_id'] = $product_id;
			$cam['order_id'] = 0;
			$cam['order_details_id'] = 0;
			$cam['customer_account_manage_credit'] = $watchPrice;
			$cam['customer_account_manage_balance'] = $customer_account_manage_balance['customer_account_manage_balance'] + $watchPrice;
			$cam['customer_account_manage_entry_type'] = 1;
			$cam['cam_note'] = "User watch 'http://www.youtube.com/v/".$videoId."' and get rewarded ".lp( $watchPrice );
			
			$lastId = $this->db->insert( 'customer_account_manage', $cam );
			
// 			echo $lastId;
			
			//update final customer or user bucks
			exeQuery( "UPDATE customer SET customer_bucks = ".$cam['customer_account_manage_balance']." WHERE customer_id = ".$customer_id );
			
			if( $lastId )
			{
				//Manage customer or user completed watch video status change
				exeQuery( "UPDATE customer_video_map SET cvm_status = 1 WHERE customer_video_map_id = ".$camStatus['customer_video_map_id'] );
				
				$cmn_vw["type"] = "success";
				$cmn_vw["msg"] = "Success: You have added ".lp( $watchPrice )." to your Account!";
			}
			else
			{
				$cmn_vw["type"] = "warning";
				$cmn_vw["msg"] = "Warning: Something want wrong please try again!";
			}
			
// 			echo $cmn_vw["msg"];
			return json_encode( $cmn_vw ); 
		}
	}
}
