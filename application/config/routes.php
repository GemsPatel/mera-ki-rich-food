<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	http://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There area two reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router what URI segments to use if those provided
| in the URL cannot be matched to a valid route.
|
*/
$route['default_controller'] = "home";
/**
 * from 16-06-2015 all 404 are first redirected to product urlDecode and will check if url is related 
 * product category or product detail or search page if it is then taken to particular page other redirected to 
 * default "my404" controller page. 
 */
$route['404_override'] = '';
$route['err'] = 'home/index';	//'my404';

$route['computer(:any)'] = "products/urlDecodeAndRedirect";
$route['ga-gk(:any)'] = "products/urlDecodeAndRedirect";
$route['education(:any)'] = "products/urlDecodeAndRedirect";
$route['internet(:any)'] = "products/urlDecodeAndRedirect";
$route['health(:any)'] = "products/urlDecodeAndRedirect";
$route['microsoft(:any)'] = "products/urlDecodeAndRedirect";
$route['make-money/(:any)'] = "products/urlDecodeAndRedirect";
$route['bloger/(:any)'] = "products/urlDecodeAndRedirect";
$route['computer'] = "products/urlDecodeAndRedirect";
$route['ga-gk'] = "products/urlDecodeAndRedirect";
$route['education'] = "products/urlDecodeAndRedirect";
$route['internet'] = "products/urlDecodeAndRedirect";
$route['health'] = "products/urlDecodeAndRedirect";
$route['microsoft'] = "products/urlDecodeAndRedirect";
$route['make-money'] = "products/urlDecodeAndRedirect";
$route['bloger'] = "products/urlDecodeAndRedirect";

$route['search/(:any)'] = "products/search";
$route['search'] = "products/search";

$route['unsubscribe'] = "home/unsubscribe";

$route['account/edit-account'] = "account/editAccount";
$route['account/address-books'] = "account/addressBooks";
$route['account/change-password'] = "account/changePassword";
$route['account/order-history'] = "account/orderHistory";
$route['account/order-returns'] = "account/orderReturns";
$route['account/address-books'] = "account/addressBook";
$route['account/edit-address'] = "account/displayAddress";
$route['account/add-address'] = "account/displayAddress";
$route['account/save-address'] = "account/saveAddress";
$route['account/order-tracking'] = "account/orderTracking";
$route['account/invite-friends'] = "account/inviteFriends";

$route['logout'] = "login/logout";
$route['register'] = "login";

$route['about-us'] = "home/aboutUs";
$route['draw'] = "home/dro";
$route['privacy-policy'] = "home/privacyPolicy";
$route['terms-conditions'] = "home/termsConditions";
$route['return-policy'] = "home/returnPolicy";
$route['faqs'] = "home/faqs";
$route['contact-us'] = "home/contactUs";

$route['products'] = "home/products";
$route['shop-now'] = "home/shopNow";
$route['recipe-blog'] = "home/recipeBlog";
$route['recipe-blog-details'] = "home/recipeBlogDetails";
$route['partner-withUs'] = "home/partnerWithUs";

/**
 * admin CMS
 */
$route['admin'] = 'admin/lgs';
$route['admin/logout'] = 'admin/lgs/logout';
/* End of file routes.php */
/* Location: ./application/config/routes.php */