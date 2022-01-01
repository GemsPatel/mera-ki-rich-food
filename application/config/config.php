<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
|--------------------------------------------------------------------------
| Base Site URL
|--------------------------------------------------------------------------
|
| URL to your CodeIgniter root. Typically this will be your base URL,
| WITH a trailing slash:
|
|	http://example.com/
|
| If this is not set then CodeIgniter will guess the protocol, domain and
| path to your installation.
|
*/
$config['base_url']	= '';

/*
|--------------------------------------------------------------------------
| Index File
|--------------------------------------------------------------------------
|
| Typically this will be your index.php file, unless you've renamed it to
| something else. If you are using mod_rewrite to remove the page set this
| variable so that it is blank.
|
*/
$config['index_page'] = '';
/*
|--------------------------------------------------------------------------
| URI PROTOCOL
|--------------------------------------------------------------------------
|
| This item determines which server global should be used to retrieve the
| URI string.  The default setting of 'AUTO' works for most servers.
| If your links do not seem to work, try one of the other delicious flavors:
|
| 'AUTO'			Default - auto detects
| 'PATH_INFO'		Uses the PATH_INFO
| 'QUERY_STRING'	Uses the QUERY_STRING
| 'REQUEST_URI'		Uses the REQUEST_URI
| 'ORIG_PATH_INFO'	Uses the ORIG_PATH_INFO
|
*/
$config['uri_protocol']	= 'AUTO';

/*
|--------------------------------------------------------------------------
| URL suffix
|--------------------------------------------------------------------------
|
| This option allows you to add a suffix to all URLs generated by CodeIgniter.
| For more information please see the user guide:
|
| http://codeigniter.com/user_guide/general/urls.html
*/

$config['url_suffix'] = '';

/*
|--------------------------------------------------------------------------
| Default Language
|--------------------------------------------------------------------------
|
| This determines which set of language files should be used. Make sure
| there is an available translation if you intend to use something other
| than english.
|
*/
$config['language']	= 'english';

/*
|--------------------------------------------------------------------------
| Default Character Set
|--------------------------------------------------------------------------
|
| This determines which character set is used by default in various methods
| that require a character set to be provided.
|
*/
$config['charset'] = 'UTF-8';

/*
|--------------------------------------------------------------------------
| Enable/Disable System Hooks
|--------------------------------------------------------------------------
|
| If you would like to use the 'hooks' feature you must enable it by
| setting this variable to TRUE (boolean).  See the user guide for details.
|
*/
$config['enable_hooks'] = TRUE;


/*
|--------------------------------------------------------------------------
| Class Extension Prefix
|--------------------------------------------------------------------------
|
| This item allows you to set the filename/classname prefix when extending
| native libraries.  For more information please see the user guide:
|
| http://codeigniter.com/user_guide/general/core_classes.html
| http://codeigniter.com/user_guide/general/creating_libraries.html
|
*/
$config['subclass_prefix'] = 'Custom_';


/*
|--------------------------------------------------------------------------
| Allowed URL Characters
|--------------------------------------------------------------------------
|
| This lets you specify with a regular expression which characters are permitted
| within your URLs.  When someone tries to submit a URL with disallowed
| characters they will get a warning message.
|
| As a security measure you are STRONGLY encouraged to restrict URLs to
| as few characters as possible.  By default only these are allowed: a-z 0-9~%.:_-
|
| Leave blank to allow all characters -- but only if you are insane.
|
| DO NOT CHANGE THIS UNLESS YOU FULLY UNDERSTAND THE REPERCUSSIONS!!
|
*/
$config['permitted_uri_chars'] = 'a-z 0-9~%,.:_\-+$';


/*
|--------------------------------------------------------------------------
| Enable Query Strings
|--------------------------------------------------------------------------
|
| By default CodeIgniter uses search-engine friendly segment based URLs:
| example.com/who/what/where/
|
| By default CodeIgniter enables access to the $_GET array.  If for some
| reason you would like to disable it, set 'allow_get_array' to FALSE.
|
| You can optionally enable standard query string based URLs:
| example.com?who=me&what=something&where=here
|
| Options are: TRUE or FALSE (boolean)
|
| The other items let you set the query string 'words' that will
| invoke your controllers and its functions:
| example.com/index.php?c=controller&m=function
|
| Please note that some of the helpers won't work as expected when
| this feature is enabled, since CodeIgniter is designed primarily to
| use segment based URLs.
|
*/
$config['allow_get_array']		= TRUE;
$config['enable_query_strings'] = FALSE;
$config['controller_trigger']	= 'c';
$config['function_trigger']		= 'm';
$config['directory_trigger']	= 'd'; // experimental not currently in use

/*
|--------------------------------------------------------------------------
| Error Logging Threshold
|--------------------------------------------------------------------------
|
| If you have enabled error logging, you can set an error threshold to
| determine what gets logged. Threshold options are:
| You can enable error logging by setting a threshold over zero. The
| threshold determines what gets logged. Threshold options are:
|
|	0 = Disables logging, Error logging TURNED OFF
|	1 = Error Messages (including PHP errors)
|	2 = Debug Messages
|	3 = Informational Messages
|	4 = All Messages
|
| For a live site you'll usually only enable Errors (1) to be logged otherwise
| your log files will fill up very fast.
|
*/
$config['log_threshold'] = 0;

/*
|--------------------------------------------------------------------------
| Error Logging Directory Path
|--------------------------------------------------------------------------
|
| Leave this BLANK unless you would like to set something other than the default
| application/logs/ folder. Use a full server path with trailing slash.
|
*/
$config['log_path'] = '';

/*
|--------------------------------------------------------------------------
| Date Format for Logs
|--------------------------------------------------------------------------
|
| Each item that is logged has an associated date. You can use PHP date
| codes to set your own date formatting
|
*/
$config['log_date_format'] = 'Y-m-d H:i:s';

/*
|--------------------------------------------------------------------------
| Cache Directory Path
|--------------------------------------------------------------------------
|
| Leave this BLANK unless you would like to set something other than the default
| system/cache/ folder.  Use a full server path with trailing slash.
|
*/
$config['cache_path'] = '';

/*
|--------------------------------------------------------------------------
| Encryption Key
|--------------------------------------------------------------------------
|
| If you use the Encryption class or the Session class you
| MUST set an encryption key.  See the user guide for info.
|
*/
$config['encryption_key'] = 'UJQh4QN414';
//zencoder api key
// live api key
$config['zencoder_key'] = 'db67b9b08994170964c51ad078e54404';


/*
|--------------------------------------------------------------------------
| Session Variables
|--------------------------------------------------------------------------
|
| 'sess_cookie_name'		= the name you want for the cookie
| 'sess_expiration'			= the number of SECONDS you want the session to last.
|   by default sessions last 7200 seconds (two hours).  Set to zero for no expiration.
| 'sess_expire_on_close'	= Whether to cause the session to expire automatically
|   when the browser window is closed
| 'sess_encrypt_cookie'		= Whether to encrypt the cookie
| 'sess_use_database'		= Whether to save the session data to a database
| 'sess_table_name'			= The name of the session database table
| 'sess_match_ip'			= Whether to match the user's IP address when reading the session data
| 'sess_match_useragent'	= Whether to match the User Agent when reading the session data
| 'sess_time_to_update'		= how many seconds between CI refreshing Session Information
|
*/
$config['sess_cookie_name']		= 'cisession';
$config['sess_expiration']		= 7200;
$config['sess_expire_on_close']	= TRUE;
$config['sess_encrypt_cookie']	= FALSE;
$config['sess_use_database']	= FALSE;
$config['sess_table_name']		= 'ci_sessions';
$config['sess_match_ip']		= FALSE;
$config['sess_match_useragent']	= FALSE;
$config['sess_time_to_update']	= 300;

/*
|--------------------------------------------------------------------------
| Cookie Related Variables
|--------------------------------------------------------------------------
|
| 'cookie_prefix' = Set a prefix if you need to avoid collisions
| 'cookie_domain' = Set to .your-domain.com for site-wide cookies
| 'cookie_path'   =  Typically will be a forward slash
| 'cookie_secure' =  Cookies will only be set if a secure HTTPS connection exists.
|
*/
$config['cookie_prefix']	= "";
$config['cookie_domain']	= "";
$config['cookie_path']		= "/";
$config['cookie_secure']	= FALSE;

/*
|--------------------------------------------------------------------------
| Global XSS Filtering
|--------------------------------------------------------------------------
|
| Determines whether the XSS filter is always active when GET, POST or
| COOKIE data is encountered
|
*/
$config['global_xss_filtering'] = FALSE;

/*
|--------------------------------------------------------------------------
| Cross Site Request Forgery
|--------------------------------------------------------------------------
| Enables a CSRF cookie token to be set. When set to TRUE, token will be
| checked on a submitted form. If you are accepting user data, it is strongly
| recommended CSRF protection be enabled.
|
| 'csrf_token_name' = The token name
| 'csrf_cookie_name' = The cookie name
| 'csrf_expire' = The number in seconds the token should expire.
*/
$config['csrf_protection'] = FALSE;
$config['csrf_token_name'] = 'csrf_test_name';
$config['csrf_cookie_name'] = 'csrf_cookie_name';
$config['csrf_expire'] = 7200;

/*
|--------------------------------------------------------------------------
| Output Compression
|--------------------------------------------------------------------------
|
| Enables Gzip output compression for faster page loads.  When enabled,
| the output class will test whether your server supports Gzip.
| Even if it does, however, not all browsers support compression
| so enable only if you are reasonably sure your visitors can handle it.
|
| VERY IMPORTANT:  If you are getting a blank page when compression is enabled it
| means you are prematurely outputting something to your browser. It could
| even be a line of whitespace at the end of one of your scripts.  For
| compression to work, nothing can be sent before the output buffer is called
| by the output class.  Do not 'echo' any values with compression enabled.
|
*/
$config['compress_output'] = FALSE;

/*
|--------------------------------------------------------------------------
| Master Time Reference
|--------------------------------------------------------------------------
|
| Options are 'local' or 'gmt'.  This pref tells the system whether to use
| your server's local time as the master 'now' reference, or convert it to
| GMT.  See the 'date helper' page of the user guide for information
| regarding date handling.
|
*/
$config['time_reference'] = 'local';

/*
|--------------------------------------------------------------------------
| Rewrite PHP Short Tags
|--------------------------------------------------------------------------
|
| If your PHP installation does not have short tag support enabled CI
| can rewrite the tags on-the-fly, enabling you to utilize that syntax
| in your view files.  Options are TRUE or FALSE (boolean)
|
*/
$config['rewrite_short_tags'] = FALSE;


/*
|--------------------------------------------------------------------------
| Reverse Proxy IPs
|--------------------------------------------------------------------------
|
| If your server is behind a reverse proxy, you must whitelist the proxy IP
| addresses from which CodeIgniter should trust the HTTP_X_FORWARDED_FOR
| header in order to properly identify the visitor's IP address.
| Comma-delimited, e.g. '10.0.1.200,10.0.1.201'
|
*/
$config['proxy_ips'] = '';

/**
 * @abstract Important config keys
 */
function getSysConfig( $key )
{
	/**
	 * Name of the session (used as cookie name).
	 */
	$config["PHPSESSID"] = "APP_KEY";

	/**
	 * enable_web_log: page access log
	 */
	$config["enable_web_log"] = TRUE;

	/**
	 * rest_version_index: rest_v
	 */
	$config["rest_version_index"] = "rest_v";

	/**
	 * rest_status_field_name
	 */
	$config["rest_status_field_name"] = "type";

	/**
	 * rest_status_field_name
	 */
	$config["rest_message_field_name"] = "msg";

	/**
	 * REST response field name
	 */
	$config['rest_response_field_name'] = 'response';
	
	/**
	 * rest_allow_session_reinstantiate
	 */
	$config["rest_allow_session_reinstantiate"] = TRUE;
	
	/**
	 * REST APP API version running in this installation
	 */
	$config["APP_VER"] = 11;

	/**
	 * is installation hosted on shared server? 
	 */
	$config["IS_SHARED_SERVER"] = TRUE;
	
	/**
	 * is installation supports category pages?
	 */
	$config["IS_CAT_PAGES"] = FALSE;
	
	/**
	 * weather installation supports multiple languages
	 */
	$config["IS_ML"] = FALSE;
	
	/**
	 * is attribute Based Product Image Folder?
	 */
	$config["IS_AI"] = TRUE;

	/**
	 * is ENter site page?
	 */
	$config["IS_ES"] = FALSE;
	/**
	 * is cart helper choose other shipping
	 */
	$config["IS_CHAS"] = TRUE;
	
	/**
	 * only allow products display in RESTApps
	 */
	$config["rest_dis"] = 6;
	
	/**
	 * only allow mobile app launch
	 */
	$config["appLaunch"] = true;
	
	return $config[ $key];
}

/***************************************** Installation specific functions **********************************************/
/**
 * Installation specific functions: just was put here since it needs to be accessed at the session initialization time 
 * and since Installation spcefic config library loads after session, it is required to put that here in config. 
 */



/**
 * returns default inventory for solution
 */
function getDefaultInventory()
{
	/**
	 * change default from here
	 */
	return "TT";
}



/***************************************** Installation specific functions **********************************************/





/***************************************** Country config functions **********************************************/

/**
 * returns default country for solution
 */
function getDefaultCountryCode()
{
	/**
	 * change default from here for non Indian solution
	 * default "IN"
	 */
	return "IN";
}

/***************************************** Country config functions end **********************************************/



/***************************************** Language config functions **********************************************/

/**
 * Set default language
 */
define( "LANG", "EN_US");

/**
 * returns default language for solution
 */
function getDefaultLang()
{
	/**
	 * change default from here for non Indian solution
	 * default "EN_US"
	 */
	return "EN_US";
}

/**
 * needs to make dynamic yet
 */
function getLangCodeForCountryCode( $country_code )
{
	if( $country_code == "IN" )
	{
		return "EN_US";
	}

	return getDefaultLang();
}

/**
 * needs to make dynamic yet
 */
function getCountryCodeForLangCode( $lang )
{
	if( $country_code == "EN_US" || $country_code == "HI" || $country_code == "GU" )
	{
		return "EN_US";
	}

	return getDefaultCountryCode();
}


/***************************************** Language config functions end **********************************************/


/***************************************** Currency config functions **********************************************/

/**
 * returns default currency for solution
 */
//deprecated statement
// * default currency can be set to any for multy currency solution,
// * but in case of single currency solution it should match to CORE currency.
function getDefaultCurrency()
{
	/**
	 * change default from here for non Indian solution
	 * default "INR"
	 */
	return array( 'currency_id'=> 1, 'currency_code'=> 'INR', 'currency_symbol'=> 'INR ', 'currency_value'=> 1 );
}

/***************************************** Currency config functions end **********************************************/



/***************************************** Warehouse config functions **********************************************/


//>>>>>>>>>>>>>>>>>> MAIN INVENTORY STATIC CONFIG


/**
 * this function requires "COMMON CONFIGURATION TO DO WHILE ADD NEW INVENTORY" 
 * 
 * function returns ID against key
 */
function inventory_typeIdForKey($it_key)
{
	if( $it_key == "TT" )
	{
		return 1;
	}
	else if( $it_key == "JW" )
	{
		return 2;
	}
	else if( $it_key == "GC" )
	{
		return 3;
	}
	else if( $it_key == "EC" )
	{
		return 4;
	}
	else if( $it_key == "HD" )
	{
		return 6;
	}
	else if( $it_key == "AP" )
	{
		return 7;
	}
	else if( $it_key == "DI" )
	{
		return 8;
	}
	else if( $it_key == "SR" )
	{
		return 9;
	}
	else if( $it_key == "Lh" )
	{
		return 10;
	}
	else if( $it_key == "KT" )
	{
		return 11;
	}
	else if( $it_key == "SS" )
	{
		return 12;
	}
	else if( $it_key == "GN" )
	{
		return 13;
	}
	
	return 0;
}

/**
 * this function requires "COMMON CONFIGURATION TO DO WHILE ADD NEW INVENTORY" 
 * 
 * function returns key against ID
 */
function inventory_typeKeyForId($inventory_type_id)
{
	if( $inventory_type_id == 1 )
	{
		return "TT";
	}
	else if( $inventory_type_id == 2 )
	{
		return "JW";
	}
	else if( $inventory_type_id == 3 )
	{
		return "GC";
	}
	else if( $inventory_type_id == 4 )
	{
		return "EC";
	}
	else if( $inventory_type_id == 6 )
	{
		return "HD";
	}
	else if( $inventory_type_id == 7 )
	{
		return "AP";
	}
	else if( $inventory_type_id == 8 )
	{
		return "DI";
	}
	else if( $inventory_type_id == 9 )
	{
		return "SR";
	}
	else if( $inventory_type_id == 10 )
	{
		return "Lh";
	}
	else if( $inventory_type_id == 11 )
	{
		return "KT";
	}
	else if( $inventory_type_id == 12 )
	{
		return "SS";
	}
	else if( $inventory_type_id == 13 )
	{
		return "GN";
	}
}

/**
 * this function requires "COMMON CONFIGURATION TO DO WHILE ADD NEW INVENTORY FOR WHICH QTY IS MANAGED IN ATTRIBUTES"
 * 
 * checks weather for current inventory is grocery inventory, with ID passed of inventory instead of session
 */
function hewr_isQtyInAttributeInventoryCheckWithId( $inventory_type_id )
{
	$it_key = inventory_typeKeyForId( $inventory_type_id );
	if( $it_key == "GC" || $it_key == "DI" )
		return true;
	else
		return false;
}

/**
 * this function requires "COMMON CONFIGURATION TO DO WHILE ADD NEW INVENTORY FOR WHICH QTY IS MANAGED IN ATTRIBUTES"
 *  
 * returns IDs pf attibutes which are used as qty in particular inventory, 
 * that is in quantity managed as configurable option in inventory attribute
 */
function hewr_qtyAttributeIDs()
{
	return array( 20, 55 ); 
}


/**
 * checks weather for current inventory type price is dynamic or static
 *
 * For JW: it is dynamic due to component based inventory
 * For GC: it is dynamic due to warehouse managed inventory
 */
function hewr_isPriceDynamic()
{
	if( hewr_isWarehouseManaged() || hewr_isComponentBased() )
		return true;
	else
		return false;
}


/**
 * checks weather for current inventory type inventory type is gender oriented inventory.
 * like textile(garments), jewellery etx
 */
function hewr_isGenderOriented()
{
	$CI =& get_instance();
	if( $CI->session->userdata("IT_KEY") == "JW" )
		return true;
	else
		return false;
}


//>>>>>>>>>>>>>>>>>>>>>>>>MAIN INVENTORY STATIC CONFIG END  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


/**
 *
 */
function inventory_typeIdForSessionKey()
{
	$CI =& get_instance();
	return inventory_typeIdForKey( $CI->session->userdata("IT_KEY") ); 
}
	
/**
 * warehouse transation types
 */
function hewr_transactionTypes( $is_all=true )
{
	if( $is_all )
		return array( ''=>'Select Type', 1 => "Purchase", 2 => "Online Sale", 3 => "Offline Sale" );
	else
		return array( ''=>'Select Type', 1 => "Purchase" );
}

/**
 * warehouse transation types
 */
function hewr_transactionTypeName( $wt_type )
{
	if( $wt_type == 1 )
		return "Purchase";
	else if( $wt_type == 2 )
		return "Online Sale";
	else if( $wt_type == 3 )
		return "Offline Sale";
}

/**
 * checks weather for current inventory type quantity is dynamic or static
 *
 * For GC: it is dynamic due to warehouse managed inventory
 * 
 * @deprecated instead use function "hewr_isQtyInAttributeInventoryCheckWithId"
 */
function hewr_isQuantityDynamic()
{
	if( hewr_isWarehouseManaged() )
		return true;
	else
		return false;
}


/**
 * checks weather for current inventory is jewellery inventory
 */
function hewr_isJewelryInventory()
{
	$CI =& get_instance();
	if( $CI->session->userdata("IT_KEY") == "JW" )
		return true;
	else
		return false;
}

/**
 * checks weather for current inventory is jewellery inventory, with ID passed of inventory instead of session
 */
function hewr_isJewelryInventoryCheckWithId( $inventory_type_id )
{
	if( inventory_typeKeyForId( $inventory_type_id ) == "JW" )
		return true;
	else
		return false;
}

/**
 * checks weather for current inventory is grocery inventory, with ID passed of inventory instead of session
 */
function hewr_isGroceryInventoryCheckWithId( $inventory_type_id )
{
	if( inventory_typeKeyForId( $inventory_type_id ) == "GC" )
		return true;
	else
		return false;
}


/**
 * product type drop down
 */
function hewr_productTypes( $type="" )
{
	if( isSupportsJewelleryInventory() )
	{
		return '<option value="prod" '.( $type=="prod" ? 'selected="selected"' : '' ).'>Product</option>
	                 	<option value="sol" '.( $type=="sol" ? 'selected="selected"' : '' ).'>Solitaire</option>
	                 	<option value="dia" '.( $type=="dia" ? 'selected="selected"' : '' ).'>Diamond</option>
	                 	<option value="cz" '.( $type=="cz" ? 'selected="selected"' : '' ).'>CZ</option>';
	}
	else
	{
		return '<option value="prod" '.( $type=="prod" ? 'selected="selected"' : '' ).'>Product</option>';
	}
}

/**
 *
 */
function inventroyAttributeInputTypes()
{
	return "'TXT','SEL','CHK','RDO','JW_CS','JW_SS1','JW_SS2','JW_MTL'";
}

/**
 *
 */
function inventroyAttributeMasterInputTypes()
{
	return "'SEL','CHK','RDO'";
}


/***************************************** Warehouse config functions end  **********************************************/

/***************************************** Customer account BUCKs functions **********************************************/


/**
 * function will return type description for transaction type int identifier
 */
function hecam_transactionTypeDesc( $customer_account_manage_entry_type )
{
	if( $customer_account_manage_entry_type == 1 )
	{
		return "Friend invite Balance Credited";
	}
	else if( $customer_account_manage_entry_type == 2 )
	{
		return "Order purchse Balance Debited";
	}
	else if( $customer_account_manage_entry_type == 3 )
	{
		return "Order return Balance Credited";
	}

	return "";
}


/***************************************** Customer account BUCKs functions end ******************************************/



/***************************************** other config functions ***************************************************/



/**
 * function will return compatible module name for specified DB table
 */
function getModuleNameForDBTable($tableName)
{
	$res = array( "inventory_master_specifier", "product_attribute", "product_categories", "product",
			"product_price", "metal_price", "diamond_price" );

	if( $tableName == "inventory_master_specifier" )
	{
		return "Inventory Attributes";
	}
	else if( $tableName == "product_attribute" )
	{
		return "Product Attribute Master";
	}
	else if( $tableName == "product_categories" )
	{
		return "Products Categories";
	}
	else if( $tableName == "product" )
	{
		return "Product";
	}
	else if( $tableName == "product_price" )
	{
		return "Product Prices";
	}
	else if( $tableName == "metal_price" )
	{
		return "Metal Price";
	}
	else if( $tableName == "diamond_price" )
	{
		return "Diamond Prices";
	}
	else if( $tableName == "product_center_stone" )
	{
		return "Product Values";
	}
	else if( $tableName == "product_side_stone1" )
	{
		return "Product Values";
	}
	else if( $tableName == "product_side_stone2" )
	{
		return "Product Values";
	}
	else if( $tableName == "product_side_stones" )
	{
		return "Product Values";
	}
	else if( $tableName == "order_details" )
	{
		return "Order";
	}
	else if( $tableName == "product_review" )
	{
		return "Product Review";
	}
	else if( $tableName == "warehouse_transactions" )
	{
		return "Warehouse";
	}
}

/***************************************** other config functions end ***********************************************/

/* End of file config.php */
/* Location: ./application/config/config.php */