<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * @author Cloudwebs
 * @abstract initilize constant and other stuff that we are unable to do in codeigniter initilization.
 */
class CloudwebsCustom 
{

    function CloudwebsCustom()
    {
		$CI =& get_instance();
		
		/**
		 * server configs
		 * not recommended to use, use only this configurations if client owns shared servers only
		 */
		//setMySqlTimezone();
		
		
		
		/**
		 * CMS client code
		 */
		define('CLIENT', 'Online Video Viewer');

		
		/**
		 * Caching config
		 */
		define( "IS_CACHE", FALSE );		//do caching or not
		/**
		 * @deprecated
		 */
		//define( "CACHE_TYPE", "apc" );	//type of caching to be used

		/**
		 * log config, applicable to application's important features which are logged for constatnt examination. <br> 
		 * like cmn_db::update_insertProductPrice function
		 */
		define( "IS_LOG", TRUE );		//do logging or not

		/**
		 * IS country( so is language ) wise store
		 * Remember that for stores that are managed country wise customely will not support multi language solution natively, 
		 * so for such country wise custom store language will be default as per country.
		 */
		define('IS_CS', FALSE);
		
		/**
		 * IS multiCURRENCY?
		 * applicable to multiple currency solution only
		 */
		define('IS_MC', FALSE);
		
		
		/*
		 |--------------------------------------------------------------------------
		| Price ratio of metal purity
		|--------------------------------------------------------------------------
		|
		| These constants are used when working with diamond_price module
		|
		*/
		define('G_10K', 0.43);
		define('G_14K', 0.60);
		define('G_18K', 0.77);
		
		/*
		 |--------------------------------------------------------------------------
		| Price calculation constants
		|--------------------------------------------------------------------------
		|
		| These constants are used when working with diamond_price module
		|
		*/
		define('SHIPP_CHARGE', 0);		//shipping charge in INR
		define('PACK_CHARGE', 0);		// packaging charge in INR
		define('LAB_STA_CHARGE',0);	//static labour charge in INR
		define('PAY_GATE_CHARGE', 0); //Payment gateway charge in %
		define('VAT_CHARGE', 0);	//vat charge in %
		
		//CZ category
		define('CZ_STONE_PR', 50);	//CZ sone price per 1 stone in INR
		define('CZ_GEM_SEM_PR', 500); //CZ semi precious gemstone price per 1 carat in INR
		
		//Solitaire category
		define('SOL_COMM', 0);	//solitaire commision in %
		define('SOL_DISC', 0);	//discount by cloudwebsfor solitaire in %
		define('SOL_PAY_GATE_CHARGE', 0); //solitaire Payment gateway charge in %
		define('SOL_VAT_CHARGE', 0);	//solitaire vat charge in %
		
		define('PAY_YOU_SER_TAX', 0);	//solitaire vat charge in %
		
		/*
		 |--------------------------------------------------------------------------
		// Constant added to overcome the overhead of queryimg database each time to fetch Primary ID of Cocktail jewellery by KEY
		// NOTE* (UML_DATABASE_CHANGE):
		|--------------------------------------------------------------------------
		*/
		define('COCKTAIL_PID', 259);
		define('SOL_RING_M_PCID', 262); ///solitaire mount category id
		define('SOL_EARR_M_PCID', 267); ///solitaire mount category id
		define('SOL_PEND_M_PCID', 266); ///solitaire mount category id
		
		define('SOL_RING_PCID', 34); ///solitaire category id
		define('SOL_EARR_PCID', 265); ///solitaire category id
		define('SOL_PEND_PCID', 264); ///solitaire category id
		
		define('RING_PCID', 2); ///solitaire mount category id
		define('EARRING_PCID', 7); ///solitaire mount category id
		define('PENDANT_PCID', 43); ///solitaire mount category id
		
		/*
		 |--------------------------------------------------------------------------
		// Clarity Constant
		|--------------------------------------------------------------------------
		*/
		define('SI1_ID', 7);
		
		/*
		 |--------------------------------------------------------------------------
		// Chat Constant
		|--------------------------------------------------------------------------
		*/
		define('CH_DEF_AGE', 'Cloudwebs');	//chat agent default
		define('CH_P_PASS', '123456');	//XMPP client namely cloudwebs' pass
		
		
		/**
		 * application specific constant moved here on 27-02-2015
		 */
		if( MANUFACTURER_ID == 7 )
		{
			/**
			 |--------------------------------------------------------------------------
			// TOLL FREE NO Constant
			|--------------------------------------------------------------------------
			*/
			define('TOLL_FREE_NO', '1800 3070 0207');
		
		}
		else if( MANUFACTURER_ID == 8 )
		{
			define('TOLL_FREE_NO', '+61 3 9021 2525');
		
			/*
			 |--------------------------------------------------------------------------
			// Australian GST tax
			|--------------------------------------------------------------------------
			*/
			define('AU_GST', 0.10);
		}
	
		
		/**
		 * currency constants
		 */
		$currency_value = $CI->session->userdata('currency_value');
		if( $currency_value === FALSE )
		{
			if( IS_MC )
			{
				setCurrencySession( getCurrencyForCountryCode( COUNTRY_CODE ) ); 
			}
			else 
			{
				setCurrencySession( getDefaultCurrency() );
			}
		}

		/**
		|--------------------------------------------------------------------------
		// CONSTANT: CURRENCY_CODE current currency used in session
		|--------------------------------------------------------------------------
		*/
		define('CURRENCY_ID', $CI->session->userdata('currency_id'));

		/**
		|--------------------------------------------------------------------------
		// CONSTANT: CURRENCY_CODE current currency used in session
		|--------------------------------------------------------------------------
		*/
		define('CURRENCY_CODE', $CI->session->userdata('currency_code'));

		/**
		|--------------------------------------------------------------------------
		// CONSTANT: CURRENCY_SYMBOL current currency used in session
		|--------------------------------------------------------------------------
		*/
		define('CURRENCY_SYMBOL', $CI->session->userdata('currency_symbol'));

		/**
		|--------------------------------------------------------------------------
		// CONSTANT: CURRENCY_VALUE current currency used in session
		|--------------------------------------------------------------------------
		*/
		define('CURRENCY_VALUE', $CI->session->userdata('currency_value'));
		
		/**
		 * admin specific Constants
		 */
// 		if( $CI->session->userdata('admin_id') !== FALSE )
// 		{
// 		}

		
		/**
		 * a constant that specifies if this solution is for any default inventory, <br>
		 * if it will support multiple inventory then it will be 0.
		 */
		define("INVENTORY_TYPE_ID", 1);
		
		/**
		 * CLIENT SPECIFIC CONSTANTS
		 * 
		 * @deprecated
		 */
		define("IMS_QTY_OPT", 20);
    }
}

/******************************** CONFIG CONSTANT functions **********************************************/
/**
 * let's see if it will benefit or not.
 * TO use constant function instead of CONSTANTs itself to minimize RAM usage.
 */

	/**
	 * is this installation supports market place? 
	 */
	function IS_MP()
	{
		return FALSE; 
	}

	/**
	 * returns CONSTANT value by NAME
	 */
	function he_CONSTANT( $NAME )
	{
		
	}
	
/******************************** CONFIG CONSTANT functions end ******************************************/


	
	
	
/******************************** FRONT END LAYOUT functions **********************************************/	
	
	
/**
 * per page products to display on front end
 */
	define('PER_PAGE_FRONT', 15); 

	
/******************************** FRONT END LAYOUT functions end ******************************************/
	
	
	

	
/******************************** SOCIAL API config **********************************************/

/**
 * return social api page URL
 */
function socialPageUrl( $api_key )
{
	if( $api_key == "FB" )
	{
		return "put url here";
	}
	else if( $api_key == "TWITTER" )
	{
		return "put url here";
	}
	else if( $api_key == "PINTEREST" )
	{
		return "put url here";
	}
	else if( $api_key == "GOOGLE" )
	{
		return "put url here";
	}
}


/******************************** SOCIAL API config end **********************************************/





/***************************************** Warehouse config functions **********************************************/

/**
 * checks weather for current inventory type inventory type is warehouse managed
 */
function hewr_isWarehouseManaged()
{
	$CI =& get_instance();
	if( $CI->session->userdata("IT_KEY") == "TT" )//1
		return true;
	else if( $CI->session->userdata("IT_KEY") == "JW" )//2
		return true;
	else if( $CI->session->userdata("IT_KEY") == "GC" )//3
		return true;
	else if( $CI->session->userdata("IT_KEY") == "EC" )//4
		return true;
	else if( $CI->session->userdata("IT_KEY") == "HD" )//6
		return true;
	else if( $CI->session->userdata("IT_KEY") == "AP" )//7
		return true;
	else if( $CI->session->userdata("IT_KEY") == "DI" )//8
		return true;
	else 
		return false;
}

/**
 * checks weather inventory type is warehouse managed inventory, with ID passed of inventory instead of session
 */
function hewr_isWarehouseManagedCheckWithId( $inventory_type_id )
{
	if( inventory_typeKeyForId( $inventory_type_id ) == "TT" )//1
		return true;
	else if( inventory_typeKeyForId( $inventory_type_id ) == "JW" )//2
		return true;
	else if( inventory_typeKeyForId( $inventory_type_id ) == "GC" )//3
		return true;
	else if( inventory_typeKeyForId( $inventory_type_id ) == "EC" )//4
		return true;
	else if( inventory_typeKeyForId( $inventory_type_id ) == "HD" )//6
		return true;
	else if( inventory_typeKeyForId( $inventory_type_id ) == "AP" )//7
		return true;
	else if( inventory_typeKeyForId( $inventory_type_id ) == "DI" )//8
		return true;
	else
		return false;
}

/**
 * returns IDs of inventory that are warehouse managed
 */
function hewr_warehouseManagedInventoryIDs()
{
	return array( 1, 2, 3, 4, 6, 7, 8 ); //5th Inventory type ID not available..
}

/**
 * checks weather for current inventory type inventory type is component based inventory
 */
function hewr_isComponentBased()
{
	$CI =& get_instance();
	if( $CI->session->userdata("IT_KEY") == "JW" )
		return true;
	else
		return false;
}

/**
 * checks weather for current inventory type inventory type is component based inventory, with ID passed of inventory instead of session
 */
function hewr_isComponentBasedCheckWithId( $inventory_type_id )
{
	if( inventory_typeKeyForId( $inventory_type_id ) == "JW" )
		return true;
	else
		return false;
}

/**
 * is supports jewellery inventory
 */
function isSupportsJewelleryInventory()
{
	return TRUE;
}

/***************************************** Warehouse config functions end ******************************************/






/***************************************** Checkout/Order/Sales/Affiliate/  config functions ******************************************/

/**
 * is affiliate credit in auto mode
 * 1. Auto mode: discount credited soon after order is placed
 * 2. After order completed: discount credited automatically after order is completed
 * 3. Admin: discount can be credited by admin for applicable order
 *
 * SEE BUG 509::Comment1 for more details
 */
function isSignupAffiliateCreditAuto()
{
	//client's preffered mode of affiliate BUNUS release
	return 3;
}

/**
 * used some time for developer reference
 */
function staticCategoryIDs( $cat_alias )
{
	if( $cat_alias == "recent-video" )
	{
		return 10;
	}
	else if( $cat_alias == "computer-video" )
	{
		return 7;
	}
	else if( $cat_alias == "education-video" )
	{
		return 6;
	}
	else if( $cat_alias == "ga-gk-video" )
	{
		return 8;
	}
	else if( $cat_alias == "internet-video" )
	{
		return 5;
	}
	else if( $cat_alias == "microsoft-video" )
	{
		return 1;
	}
	else if( $cat_alias == "health-video" )
	{
		return 9;
	}
}

/**
 * is client want to add/use to checkout payable amount additional import duty for abroad shippments
 */
function isImportDuty()
{
	return FALSE;
}



/***************************************** Checkout/Order/Sales/Affiliate/  config functions end ******************************************/




/******************************** Other config **********************************************/


/**
 * base domain
 */
function baseDomain()
{
	return "watch2earn.online";
}


/**
 * weather to send SMS after order placed, on order dispatch and so on for entire checkout and post order processing.
 */
function isSignupSMSOn()
{
	return FALSE;
}


/**
 * weather to send SMS after order placed, on order dispatch and so on for entire checkout and post order processing. 
 */
function isOrderSMSOn()
{	
	return FALSE; 
}


/**
 * With chain purchase
 * CHAIN_FIX_PRICE
 */
function CHAIN_FIX_PRICE()
{
	return 17250;	//INR
}

/**
 * With chain purchase
 * CHAIN_FIX_PRICE
 */
function CHAIN_WEIGHT()
{
	return 7;	//GM
}

/**
 * With chain purchase
 * CHAIN_FIX_PRICE
 */
function CHAIN_PURITY()
{
	return 18;	//Gold Purity
}


/**
 * With Country code FIX by Gautam
 */
function getDefaultCountryID()
{
	return 105;	//India Counry ID
}

/**
 * With State code FIX by Gautam
 */
function getDefaultStateID()
{
	return "";	//Gujarat State ID 3613
}

/**
 * Cloudwebs 
 */
function getDefaultCity()
{
	return "";//Surat	
}

/**
 * With PauU Test Marchant Key
 */

function getPayuMerchantKeyTest()
{
	return "";//JBZaLc
}

/**
 * With PauU Test Marchant Salt
 */
function getPayuMerchantSaltTest()
{
	return "";//GQs7yium
}

/**
 * With PauU Marchant Key Live
 */
function getPayuMerchantKeyLive()
{
	return "";//je01qM
}

/**
 * With PauU Marchant Salt Live
 */
function getPayuMerchantSaltLive()
{
	return "";//E9KvOXrh
}

/**
 * Facebook page url
 */
function getFbPageUrl()
{
	return "";//"https://www.facebook.com/pages/Online-Vegetables-and-Fruits/1587386638184424";
}
 
/**
 * Google plus page url
 */
function getGooglePageUrl()
{
	return "";//"https://plus.google.com/u/0/115590998799677834349/posts";
}

function facebookAppID()
{
	return "307011309645188";//"738573352925856";
}
/**
 * Android app url
 */
function getAndroidAppUrl()
{
	return "";//"https://play.google.com/store/apps/details?id=com.Online Video Viewer.gj_android_3_10";
}
/**
 * Apple app url
 */
function getAppleAppUrl()
{
	return "";//"https://itunes.apple.com/nz/app/Online Video Viewer/id1030671382";
}



/******************************** Other config end **********************************************/

/******************************** Server config *************************************************/
/**
 * not recommended to use, use only this configurations if client owns shared servers only
 */

/**
 * function will tell if explicit created date storing is required
 */
function isExplicitCreatedDate()
{
	return TRUE; 
}

/**
 * sets default DBs mysql timezone
 */
function setMySqlTimezone() 
{
	$CI =& get_instance(); 
	$CI->db->query( " SET SESSION time_zone='+8:00' " );
}
/******************************** Server config end **********************************************/