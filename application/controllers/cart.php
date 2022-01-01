<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class cart extends CI_Controller 
{

	var $is_ajax = false;
	var $customer_id =0;		//customer id if session set otherwise 0
	var $cartArr =array();     //cartArr array will be empty if not set 
	var $wishArr =array();     //wishArr array will be empty if not set 
	var $product_price_id =0;  //prod price id if session is set
	
	//parent constructor will load model inside it
	function cart()
	{
		parent::__construct();

		$this->is_ajax = $this->input->is_ajax_request();
		//check if customer session set then update database cart for customer
		if ($this->session->userdata('customer_id') !== FALSE)
		{
			$this->customer_id = (int)$this->session->userdata('customer_id');
		}
		
		//check if cart session set
		if ($this->session->userdata('cartArr') !== FALSE)
		{
			$this->cartArr = $this->session->userdata('cartArr');
		}

		//check if wish session set
		if ($this->session->userdata('wishArr') !== FALSE)
		{
			$this->wishArr = $this->session->userdata('wishArr');
		}

		//check if product_price_id session set
		if ($this->session->userdata('product_price_id') !== FALSE)
		{
			$this->product_price_id = (int)$this->session->userdata('product_price_id');		//partially used in combination with page token
		}
		
		//cache driver
// 		$this->load->driver( 'cache', array( 'adapter' => 'apc', 'backup' => 'file'));
	}
	
	function index()
	{
		$data = $this->getCartData();
		
		$data['pageName'] = 'shopping_cart';
		$this->load->view('site-layout',$data);
	}

/*
 *	@abstract display wishlist of user
 */
	function wishlist()
	{
		$data = $this->getWishData();
		//pr($data); die;
		
		$data['pageName'] = 'wish_list';
		//$data['custom_page_title'] = "Wishlist";
		$this->load->view('site-layout',$data);
	}

/*
 * @abstract add product in cart: change25/13/2013* 25/12/2013 now solitaire(mount+diamond ) category and diamond can also be added oin cart
*/
	function add()
	{
		cmn_vw_cartAdd( $this->product_price_id, $this->is_ajax, $this->cartArr, $this->customer_id ); 
		
// 		if($this->is_ajax)
// 		{
// 			$pid = $this->input->post('pid');
// 			$token = $this->input->post('token');	//page token : token will identify session and will usefull for getting product_price_id
// 			$ring_size = $this->input->post('ring_size');	//ring size applicable to only ring products
			
// 			//change25/13/2013*
// 			$type = $this->input->post('type');
			
// 			/**
// 			 * qty added on 31-03-2105
// 			 */
// 			$qty = 1;
// 			if( $this->input->post('qty') !== FALSE ) 
// 			{
// 				$qty = $this->input->post('qty'); 
// 			}
			
			
// 			if($pid!=0)						//apply product price id directly from listing page if not zero if function called form details page then it will be always zero
// 			{
// 				$this->product_price_id = $pid;
// 			}
// 			else if(!empty($token))
// 			{
// 				if( $type == 'sol')	//for solitaires category pageToken will contain solitaire event session prefix
// 				{
// 					$this->product_price_id = $this->session->userdata($token.'pick_design_id')."=".$this->session->userdata($token.'choose_diamond_id');				
// 				}
// 				else
// 				{
// 					$this->product_price_id = $this->session->userdata('product_price_id_'.$token);
// 					$type = $this->session->userdata('cz_suffix_'.$token); 
// 					if( strlen($type) > 0) { $type = substr($type, 1); }
// 				}
// 			}
				
// 			if($this->product_price_id!=0)
// 			{
// 				$res = array();
// 				$is_add = true; 
// 				if( empty( $type ) || $type == 'prod' )
// 				{
// 					$res = executeQuery( "SELECT product_name, p.product_id, p.inventory_type_id FROM product_price pp 
// 										  INNER JOIN product p ON p.product_id=pp.product_id
// 										  WHERE pp.product_price_id=".$this->product_price_id." LIMIT 1" ); 
// 					if( CLIENT == "GUJCART" )
// 					{
// 						if( hewr_isGroceryInventoryCheckWithId( $res[0]["inventory_type_id"] ) )
// 						{
// 							$is_add = false; 
// 						}
// 					}
// 				}
				
// 				updCartDatabase($this->product_price_id, $qty, $is_add, false, $this->cartArr, $this->customer_id, $ring_size, '', $type);

// 				if( empty( $type ) || $type == 'prod' )
// 				{
// 					/**
// 					 * On 15-04-2015 moed out of if and put above, so that code can read it before hand and apply another logic also  
// 					 */
// // 					$res = executeQuery( "SELECT product_name,p.product_id FROM product_price pp INNER JOIN product p ON p.product_id=pp.product_id 
// // 										WHERE pp.product_price_id=".$this->product_price_id." LIMIT 1" );
// 					if(!empty($res))
// 					{
// 						$link= getProductUrl($res[0]['product_id'],$this->product_price_id);
// 						echo json_encode(array('type'=>'success','msg'=>'Success: You have added <a data-ajax="false" href="'.$link.'">'.pgTitle($res[0]['product_name']).'</a> to your <a data-ajax="false" href="'.site_url('cart').'">shopping cart</a>!'));
// 					}
// 				}
// 				else if( $type == 'cz' )
// 				{
// 					$res = executeQuery( "SELECT product_name,p.product_id FROM product_price pp INNER JOIN product p ON p.product_id=pp.product_id 
// 										WHERE pp.product_price_id=".$this->product_price_id." LIMIT 1" );
// 					if(!empty($res))
// 					{
// 						$link= getProductUrl($res[0]['product_id'],$this->product_price_id);
// 						echo json_encode(array('type'=>'success','msg'=>'Success: You have added <a data-ajax="false" href="'.$link.'">'.pgTitle($res[0]['product_name']).'</a> to your <a data-ajax="false" href="'.site_url('cart').'">shopping cart</a>!'));
// 					}
// 				}
// 				else if( $type == 'sol' )
// 				{
// 					$tempArr = explode('=', $this->product_price_id);
// 					$this->product_price_id = (int)$tempArr[0];
// 					$res = executeQuery( "SELECT product_name,p.product_id FROM product_price pp INNER JOIN product p ON p.product_id=pp.product_id 
// 										WHERE pp.product_price_id=".$this->product_price_id." LIMIT 1" );
// 					if(!empty($res))
// 					{
// 						$link= getProductUrl($res[0]['product_id'],$this->product_price_id);
// 						echo json_encode(array('type'=>'success','msg'=>'Success: You have added <a data-ajax="false" href="'.$link.'">'.pgTitle($res[0]['product_name']).'</a> to your <a  data-ajax="false" href="'.site_url('cart').'">shopping cart</a>!'));
// 					}
// 				}
// 				else if( $type == 'dia' )
// 				{
// 					echo json_encode(array('type'=>'success','msg'=>'Success: You have added one <a data-ajax="false" href="'.diamondUrl( $this->product_price_id ).'">Diamond</a> to your <a  data-ajax="false" href="'.site_url('cart').'">shopping cart</a>!'));
// 				}
// 			}

// 		}
// 		else
// 		{
// 			redirect(site_url('cart'));	
// 		}
	}

/**
 * @abstract add product in cart
 */
	function add_wishlist()
	{
		cmn_vw_wishAdd($this->product_price_id, $this->is_ajax, $this->wishArr, $this->customer_id);
// 		if($this->is_ajax)
// 		{
// 			$pid = (int)$this->input->post('pid');
// 			$token = $this->input->post('token');	//page token : token will identify session and will usefull for getting product_price_id
// 			if($pid!=0)						//apply product price id directly from listing page if not zero if function called form details page then it will be always zero
// 			{
// 				$link = "";
// 				$this->product_price_id = $pid;
// 			}
// 			else if(!empty($token))
// 			{
// 				$this->product_price_id = $this->session->userdata('product_price_id_'.$token);
// 			}
				
// 			if($this->product_price_id!=0)
// 			{
// 				$res = executeQuery("SELECT product_name,p.product_id FROM product_price pp INNER JOIN product p ON p.product_id=pp.product_id WHERE pp.product_price_id=".$this->product_price_id." LIMIT 1");
// 				if(!empty($res))
// 				{
// 					$link= getProductUrl($res[0]['product_id'],$this->product_price_id);
// 				}
				
// 				if(updWishDatabase($this->product_price_id,false,$this->wishArr,$this->customer_id))
// 				{
// 					echo json_encode(array('type'=>'success','msg'=>'Success: You have added <a href="'.$link.'">'.pgTitle($res[0]['product_name']).'</a> to your <a href="'.site_url('cart').'">wish list</a>!'));
// 				}
// 				else
// 				{
// 					echo json_encode(array('type'=>'warning','msg'=>'Warning: Product <a href="'.$link.'">'.pgTitle($res[0]['product_name']).'</a> is already in <a href="'.site_url('cart').'">wish list</a>!'));
// 				}
// 			}			
// 		}
// 		else
// 		{
// 			redirect(site_url('wishlist'));	
// 		}
	}

/** 
 * @author Hiren Donda
 * @abstract get products from session cart and if it is not set then database cart
 */
	function getCartData()
	{
		/**
		 * From 09-04-2015 now it will always read from database if user is logged in 
		 */
		if( isLoggedIn() )
		{
			$data = getCartData( "", $this->customer_id, true, false, true, true);
			
		}
		else 
		{
			$data = getCartData( $this->cartArr, $this->customer_id, false, false, true, true);
		}
		return $data;		
	}

/**
 * @abstract get products from session wishArr and if it is not set then database wish
 */
	function getWishData()
	{
		/**
		 * From 09-04-2015 now it will always read from database if user is logged in
		 */
		if( isLoggedIn() )
		{
			return getWishData( "",$this->customer_id, true);
		}
		else
		{
			return getWishData($this->wishArr,$this->customer_id);
		}
		
				
	}

/**
 * @abstract update qty of product in cart
 */
	function updateQty()
	{
		cmn_vw_updateQty( $this ); 
// 		$qty = $this->input->post('qty');
// 		$this->product_price_id = $this->input->post('id');
// 		//$cid  = $this->input->post('cid');	deprecated : Only session cust_id is used if session for cust time out then entry goes to generel(0) session 
// 		$ring_size = $this->input->post('ring_size');

		 
// 		updCartDatabase($this->product_price_id, $qty, false, false, $this->cartArr, $this->customer_id, $ring_size);
// 		echo json_encode(array('type'=>'success'));
	}
	
/*
 * @abstract function will apply coupon dixount to grand total only if coupon available and valid
*/
	function applyCoupon()
	{
		cmn_vw_applyCoupon();
	}

 /*	
 * return data refresh wishlist cart at front side
 */
	 function refreshWishCart()
	 {
		 echo json_encode(getCartWishCount());
	 }

/*
 * @author Hiren Donda
 * @abstract remove product from cart
*/
	function removeProduct()
	{
		cmn_vw_removeProduct( $this ); 
// 		$this->product_price_id = $this->input->post('id');
// 		//$cid  = $this->input->post('cid');	deprecated : Only session cust_id is used if session for cust time out then entry goes to generel(0) session 

// 		unset($this->cartArr[$this->customer_id][$this->product_price_id]);
// 		if($this->customer_id!=0)
// 		{
// 			if( IS_CS )
// 			{
// 				$this->db->query("DELETE FROM customer_cartwish WHERE manufacturer_id=".MANUFACTURER_ID." AND
// 							  customer_id=".$this->customer_id." AND product_price_id=".$this->product_price_id." AND customer_cartwish_type='C'");
// 			}
// 			else 
// 			{
// 				$this->db->query("DELETE FROM customer_cartwish WHERE manufacturer_id=7 AND
// 							  customer_id=".$this->customer_id." AND product_price_id=".$this->product_price_id." AND customer_cartwish_type='C'");
// 			}
// 		}

// 		$this->session->set_userdata(array('cartArr'=>$this->cartArr));
// 		echo json_encode(array('type'=>'success'));
	}

/*
 * @abstract add product in cart
*/
	function removeWishlist()
	{
		cmn_vw_removeWishlist( $this ); 
// 		$this->product_price_id = $this->input->post('id');
// 		//$cid  = $this->input->post('cid');	deprecated : Only session cust_id is used if session fopr cust time out then entry goes to generel(0) session 

// 		unset($this->wishArr[$this->customer_id][$this->product_price_id]);
// 		if($this->customer_id!=0)
// 		{
// 			if( IS_CS )
// 			{
// 				$this->db->query("DELETE FROM customer_cartwish WHERE manufacturer_id=".MANUFACTURER_ID." AND
// 							  customer_id=".$this->customer_id." AND product_price_id=".$this->product_price_id." AND customer_cartwish_type='W'");
// 			}
// 			else
// 			{
// 				$this->db->query("DELETE FROM customer_cartwish WHERE 
// 								  customer_id=".$this->customer_id." AND product_price_id=".$this->product_price_id." AND customer_cartwish_type='W'");
// 			}
			
// 		}

// 		$this->session->set_userdata(array('wishArr'=>$this->wishArr));
// 		echo json_encode(array('type'=>'success','msg'=>'Success: Product removed from wish list.'));
	}

	function orderLatestStatusMsg()
	{
		$returnArr['success'] = cart_hlp_orderLatestStatusMsg( $_POST['order_details_id'] );
		
		echo json_encode($returnArr);
	}
	 
}