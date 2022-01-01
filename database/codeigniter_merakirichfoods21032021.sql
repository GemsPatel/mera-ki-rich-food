-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 21, 2021 at 09:04 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codeigniter_merakirichfoods`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_log`
--

DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE IF NOT EXISTS `admin_log` (
  `admin_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL COMMENT 'user for which add , modification or delete logs recorded',
  `admin_class_name` varchar(100) NOT NULL COMMENT 'controller name',
  `module_item_name` varchar(255) NOT NULL COMMENT 'name of db table',
  `module_table_name` varchar(100) NOT NULL COMMENT 'name of db table',
  `module_table_field` varchar(100) NOT NULL COMMENT 'name of table field',
  `module_primary_id` int(11) NOT NULL,
  `admin_log_type` varchar(1) NOT NULL COMMENT '''A'' for Add,''E'' for edit and ''D'' for delete ',
  `admin_log_ip` varchar(40) NOT NULL,
  `admin_log_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_log_id`),
  KEY `FK_al_admin_user_id` (`admin_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='generates log  for admin activities';

--
-- Truncate table before insert `admin_log`
--

TRUNCATE TABLE `admin_log`;
-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE IF NOT EXISTS `admin_menu` (
  `admin_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `am_class_name` varchar(100) NOT NULL COMMENT 'controller(class) name of module',
  `am_parent_id` int(11) DEFAULT NULL,
  `am_name` varchar(100) NOT NULL COMMENT 'name to be displayed in menu',
  `am_icon` mediumtext NOT NULL COMMENT 'menu icon to be used',
  `image_size_id` int(11) NOT NULL,
  `am_sort_order` tinyint(3) NOT NULL,
  `am_status` tinyint(1) NOT NULL,
  `am_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `am_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`admin_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='permissions for admin menu';

--
-- Truncate table before insert `admin_menu`
--

TRUNCATE TABLE `admin_menu`;
--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`admin_menu_id`, `am_class_name`, `am_parent_id`, `am_name`, `am_icon`, `image_size_id`, `am_sort_order`, `am_status`, `am_created_date`, `am_modified_date`) VALUES
(1, '', 0, 'Site', 'assets/admin_menu/application_home1699633008_s.png', 0, 1, 0, '2013-07-18 09:44:11', '2013-10-25 05:39:45'),
(2, 'dashboard', 1, 'Dashboard', 'assets/admin_menu/dashboard381505697_s.png', 0, 1, 0, '2013-07-18 10:06:04', '2021-03-19 17:18:17'),
(3, 'global_configuration', 1, 'Settings', 'assets/admin_menu/configuration1255882439_s.png', 0, 2, 0, '2013-07-18 10:08:29', '2021-03-19 17:20:33'),
(4, 'main_front_menu', 1, 'Menu Manager', 'assets/admin_menu/menu11114878812_s.png', 0, 3, 1, '2013-07-19 05:07:24', '2013-08-13 05:04:50'),
(5, '', 0, 'Products', 'assets/admin_menu/product1862489219_s.png', 3, 2, 0, '2013-07-19 05:08:10', '2021-03-19 16:11:45'),
(6, 'product_categories', 5, 'Product Categories', 'assets/admin_menu/category789142981_s.png', 4, 1, 0, '2013-07-19 05:08:43', '2021-03-19 16:12:41'),
(7, 'product', 5, 'Manage Product', 'assets/admin_menu/manage_product1944747914_s.png', 4, 3, 0, '2013-07-19 05:09:22', '2021-03-19 16:15:11'),
(8, 'product_offer', 5, 'Product Offers', 'assets/admin_menu/5450caa1fdcc6aeea114c065f5e231e4389776303_s.jpg', 1, 6, 1, '2013-07-19 05:10:22', '2014-05-07 22:51:19'),
(9, 'product_review', 5, 'Review and Ratings', 'assets/admin_menu/review1749789042_s.png', 4, 9, 0, '2013-07-19 05:11:16', '2021-03-21 08:53:56'),
(10, 'search_filters', 5, 'Search Filters', 'assets/admin_menu/3b61b670d5694b81231424f8c5cc2b771747114220_s.jpg', 1, 12, 1, '2013-07-19 05:11:45', '2014-05-07 22:51:47'),
(23, '', 0, 'Sales', 'assets/admin_menu/gender_mini_32112186173_s.jpg', 1, 3, 1, '2013-07-19 09:26:17', '2015-04-16 19:22:32'),
(24, 'sales_order', 23, 'Orders', 'assets/admin_menu/order289133751_s.png', 0, 1, 0, '2013-07-19 09:26:36', '2013-07-29 11:15:04'),
(27, '', 0, 'Customers', 'assets/admin_menu/images869608973_s.png', 4, 4, 0, '2013-07-20 11:44:18', '2021-03-19 16:16:29'),
(28, 'customer', 27, 'Customers', 'assets/admin_menu/customers319386145_s.png', 4, 1, 1, '2013-07-20 11:45:05', '2021-03-19 16:17:43'),
(29, 'sales_order_return', 23, 'Returns', 'assets/admin_menu/terminate1033170748_s.png', 0, 2, 0, '2013-07-27 05:40:35', '2013-07-30 07:13:34'),
(30, 'order_status', 23, 'Order Statuses', 'assets/admin_menu/chart1897239620_s.png', 0, 3, 0, '2013-07-27 05:41:19', '2013-07-29 11:16:24'),
(31, 'customer_group', 27, 'Customer Groups', 'assets/admin_menu/user-group419461350_s.png', 0, 2, 1, '2013-07-27 05:45:15', '2013-07-29 11:19:22'),
(32, 'customer_private_message', 27, 'Private Message', 'assets/admin_menu/customer-msg1244796400_s.png', 4, 3, 0, '2013-07-27 05:45:39', '2021-03-19 16:19:23'),
(33, '', 0, 'Article Manager', 'assets/admin_menu/view_detail942720333_s.png', 0, 5, 0, '2013-07-27 05:46:12', '2013-10-25 05:40:28'),
(34, 'article_category', 33, 'Article Categories', 'assets/admin_menu/view_detail2027098578_s.png', 1, 1, 1, '2013-07-27 05:46:41', '2013-07-29 11:23:02'),
(35, 'article', 33, 'Manage Articles', 'assets/admin_menu/artcle-manage1068454478_s.png', 1, 2, 0, '2013-07-27 05:47:31', '2013-07-29 11:26:39'),
(36, '', 0, 'Localisation', 'assets/admin_menu/localisation2126208169_s.png', 0, 6, 1, '2013-07-27 05:48:10', '2013-07-29 11:28:18'),
(37, 'coupon', 36, 'Coupons', 'assets/admin_menu/coupon1279173190_s.png', 0, 1, 1, '2013-07-27 05:48:35', '2013-07-29 11:32:28'),
(38, 'gift', 36, 'Gifts', 'assets/admin_menu/gift343728720_s.png', 1, 2, 1, '2013-07-27 06:03:05', '2013-07-29 11:33:02'),
(39, 'manufacturer', 36, 'Manufacturer', 'assets/admin_menu/manufacture300774354_s.png', 1, 3, 1, '2013-07-27 06:03:26', '2013-07-29 11:34:29'),
(40, 'currency', 36, 'Currencies', 'assets/admin_menu/Cash1989470397_s.png', 2, 4, 1, '2013-07-27 06:03:55', '2013-07-31 06:53:23'),
(41, 'stock_status', 36, 'Stock Statuses', 'assets/admin_menu/stock-status772382787_s.png', 1, 5, 1, '2013-07-27 06:05:29', '2013-07-29 11:39:53'),
(42, 'country', 106, 'Countries', 'assets/admin_menu/country502862838_s.png', 0, 1, 0, '2013-07-27 06:06:04', '2013-09-19 02:52:22'),
(43, 'state', 106, 'States', 'assets/admin_menu/statew1722051595_s.png', 1, 2, 0, '2013-07-27 06:06:33', '2013-09-19 02:52:34'),
(44, 'tax_rate', 36, 'Tax Rates', 'assets/admin_menu/tax1082369776_s.png', 1, 8, 1, '2013-07-27 06:07:03', '2013-07-29 11:41:13'),
(45, 'faq', 36, 'FAQs', 'assets/admin_menu/feed93906590_s.png', 1, 9, 0, '2013-07-27 06:07:27', '2013-07-29 11:41:26'),
(46, '', 36, 'Design', 'assets/admin_menu/media487452398_s.png', 1, 10, 1, '2013-07-27 06:07:53', '2013-07-29 11:46:09'),
(47, 'slider', 46, 'Slider', 'assets/admin_menu/slider1281993646_s.png', 1, 1, 0, '2013-07-27 06:08:16', '2013-07-29 11:42:03'),
(48, 'banner', 46, 'Banners', 'assets/admin_menu/banner445410931_s.png', 1, 2, 0, '2013-07-27 06:08:45', '2013-07-29 11:42:17'),
(49, 'banner_position', 46, 'Position', 'assets/admin_menu/position220606064_s.png', 1, 3, 1, '2013-07-27 06:09:06', '2013-07-29 11:44:06'),
(50, 'image_size', 36, 'Image Size', 'assets/admin_menu/paragraph_icon_-_Copy1069802907_s.png', 1, 11, 0, '2013-07-27 06:09:37', '2013-07-29 11:45:19'),
(51, '', 0, 'System', 'assets/admin_menu/hammer_screwdriver248453280_s.png', 0, 7, 0, '2013-07-27 06:10:11', '2013-07-29 11:48:08'),
(52, 'admin_permission', 51, 'Permissions', 'assets/admin_menu/artcle-manage1642685281_s.png', 1, 1, 0, '2013-07-27 06:10:37', '2013-07-29 11:48:23'),
(53, 'admin_menu', 51, 'Admin Menus', 'assets/admin_menu/menu2139508966_s.png', 0, 2, 0, '2013-07-27 06:11:02', '2021-03-19 17:19:24'),
(54, 'module_manager', 51, 'Module Manager', 'assets/admin_menu/module704485388_s.png', 0, 3, 1, '2013-07-27 06:11:28', '2013-07-29 11:48:38'),
(55, '', 51, 'Admin Users', 'assets/admin_menu/user_icon1816507526_s.png', 0, 4, 0, '2013-07-27 06:17:08', '2013-07-29 11:49:05'),
(56, 'admin_user', 55, 'Users', 'assets/admin_menu/user_icon483963425_s.png', 0, 1, 0, '2013-07-27 06:19:38', '2013-07-29 11:49:20'),
(57, 'admin_user_group', 55, 'Users Group', 'assets/admin_menu/user-group1769239697_s.png', 0, 2, 1, '2013-07-27 06:20:08', '2013-07-29 11:49:40'),
(58, '', 51, 'Shipping', 'assets/admin_menu/shipping1996668817_s.png', 0, 5, 1, '2013-07-27 06:20:36', '2013-09-27 23:14:25'),
(59, 'payment_method', 51, 'Payments', 'assets/admin_menu/payment1431346896_s.png', 0, 6, 1, '2013-07-27 06:21:09', '2013-07-29 11:50:11'),
(60, 'import_export', 51, 'Backup / Restore', 'assets/admin_menu/backup1522036461_s.png', 0, 7, 1, '2013-07-27 06:21:39', '2013-07-29 11:50:26'),
(61, 'error_code', 51, 'Error Codes', 'assets/admin_menu/error1555240937_s.png', 0, 8, 1, '2013-07-27 06:22:08', '2013-07-29 11:50:41'),
(62, 'configuration', 51, 'Configurations', 'assets/admin_menu/lockscreen846627088_s.png', 1, 9, 0, '2013-07-27 06:22:34', '2013-07-29 11:51:21'),
(63, 'media_manager', 51, 'Media Manager', 'assets/admin_menu/media1250322613_s.png', 0, 10, 1, '2013-07-27 06:23:08', '2013-08-06 03:07:34'),
(64, '', 0, 'Reports', 'assets/admin_menu/report653392728_s.png', 0, 8, 1, '2013-07-27 06:23:35', '2013-07-29 11:51:57'),
(65, 'report_order', 71, 'Orders', 'assets/admin_menu/report127572623_s.png', 0, 1, 0, '2013-07-27 06:23:57', '2013-07-29 11:53:42'),
(66, 'report_order_tracking', 71, 'Order Tracking', 'assets/admin_menu/report899557056_s.png', 0, 2, 1, '2013-07-27 06:24:26', '2013-07-29 11:53:31'),
(67, 'report_tax', 71, 'Tax', 'assets/admin_menu/report1707896058_s.png', 0, 8, 1, '2013-07-27 06:24:50', '2013-09-14 02:46:43'),
(68, 'report_shipping', 71, 'Shipping', 'assets/admin_menu/report1596275677_s.png', 0, 4, 1, '2013-07-27 06:25:11', '2013-07-29 11:55:18'),
(69, 'report_payment', 71, 'Payments', 'assets/admin_menu/report915045446_s.png', 0, 5, 0, '2013-07-27 06:25:45', '2013-07-29 11:55:30'),
(70, 'report_order_return', 71, 'Returns', 'assets/admin_menu/report1295796317_s.png', 0, 6, 0, '2013-07-27 06:26:08', '2013-07-29 11:55:43'),
(71, '', 64, 'Sales', 'assets/admin_menu/order987193613_s.png', 0, 1, 0, '2013-07-27 06:36:48', '2013-07-29 11:56:55'),
(72, 'report_coupon', 64, 'Coupons', 'assets/admin_menu/coupon882003135_s.png', 0, 2, 0, '2013-07-27 06:40:52', '2013-07-29 11:57:10'),
(73, 'report_gift', 64, 'Gifts', 'assets/admin_menu/gift1158065275_s.png', 0, 3, 1, '2013-07-27 06:41:24', '2013-07-29 11:57:19'),
(74, 'report_manufacturer', 64, 'Manufacturer', 'assets/admin_menu/manufacture628286677_s.png', 1, 4, 1, '2013-07-27 06:42:04', '2013-07-29 11:57:30'),
(75, '', 64, 'Products', 'assets/admin_menu/product200990278_s.png', 0, 5, 0, '2013-07-27 06:42:37', '2013-07-29 11:57:42'),
(76, 'report_product_view', 75, 'Viewed', 'assets/admin_menu/report404106432_s.png', 0, 1, 0, '2013-07-27 06:47:26', '2013-07-29 11:57:54'),
(77, 'report_product_purchased', 75, 'Purchased', 'assets/admin_menu/report1531774379_s.png', 0, 2, 0, '2013-07-27 06:48:02', '2013-07-29 11:58:06'),
(78, '', 64, 'Customers', 'assets/admin_menu/customer1478910579_s.png', 0, 6, 0, '2013-07-27 06:56:17', '2013-07-29 11:58:21'),
(79, 'report_customer_order', 78, 'Orders', 'assets/admin_menu/report687217581_s.png', 0, 1, 0, '2013-07-27 06:56:56', '2013-07-29 11:58:34'),
(80, 'report_customer_account', 78, 'Credit', 'assets/admin_menu/report225727709_s.png', 0, 2, 0, '2013-07-27 06:57:44', '2013-07-29 11:58:46'),
(81, '', 64, 'Reviews', 'assets/admin_menu/review838089458_s.png', 0, 7, 0, '2013-07-27 06:58:15', '2013-07-29 11:59:03'),
(82, 'report_product_review', 81, 'Products', 'assets/admin_menu/report288754493_s.png', 0, 1, 0, '2013-07-27 06:58:51', '2013-07-29 11:59:14'),
(83, 'report_customer_review', 81, 'Customers', 'assets/admin_menu/report1796186893_s.png', 0, 2, 1, '2013-07-27 06:59:22', '2013-07-29 11:59:25'),
(84, 'report_admin_log', 64, 'Admin Logs', 'assets/admin_menu/log1490266929_s.png', 0, 10, 0, '2013-07-27 06:59:53', '2013-12-10 02:49:40'),
(85, '', 0, 'Administration', 'assets/admin_menu/admin_1624815348_s.png', 1, 9, 1, '2013-07-27 07:00:14', '2013-07-29 12:01:17'),
(94, '', 0, 'Admin Tools', 'assets/admin_menu/setting1069380680_s.png', 1, 10, 1, '2013-07-27 07:11:45', '0000-00-00 00:00:00'),
(95, 'email_system', 136, 'E-Mail System', 'assets/admin_menu/mail692524744_s.png', 1, 1, 0, '2013-07-27 07:12:24', '2013-12-28 01:46:17'),
(96, 'geolocation', 94, 'Geolocation', 'assets/admin_menu/country1326645844_s.png', 1, 2, 1, '2013-07-27 07:12:50', '2013-08-06 06:06:05'),
(97, '', 94, 'Feed Generator', 'assets/admin_menu/banner1119676800_s.png', 1, 3, 1, '2013-07-27 07:13:09', '0000-00-00 00:00:00'),
(98, 'live_chat', 94, 'Live Chat', 'assets/admin_menu/user-group701850901_s.png', 0, 4, 1, '2013-07-27 07:13:41', '2013-08-02 04:15:39'),
(100, 'report_customer_wish', 75, 'Customer Wish List', 'assets/admin_menu/1378564579_shopping-cart-insert856515532_s.png', 2, 3, 0, '2013-08-24 00:38:34', '2013-09-07 04:08:47'),
(101, 'report_customer_cart', 75, 'Customer Cart', 'assets/admin_menu/1378564374_shopping_cart765671897_s.png', 2, 4, 0, '2013-08-24 03:26:38', '2013-09-07 04:04:19'),
(104, 'report_search_terms', 64, 'Search Terms', 'assets/admin_menu/1377943788_Search-Globe12148812_s.png', 2, 8, 0, '2013-08-30 23:40:54', '0000-00-00 00:00:00'),
(105, 'report_discount', 71, 'Discount', 'assets/admin_menu/1379155333_bag1207971245_s.png', 2, 7, 1, '2013-09-13 23:43:08', '2013-09-14 00:13:13'),
(106, '', 36, 'Pincodes', 'assets/admin_menu/1379596825_Map-Marker-Push-Pin--Right-Pink930058876_s.png', 2, 6, 1, '2013-09-19 02:51:00', '0000-00-00 00:00:00'),
(107, 'pincode', 106, 'Zipcodes', 'assets/admin_menu/1379596825_Map-Marker-Push-Pin--Right-Pink161766133_s.png', 2, 3, 0, '2013-09-19 03:34:05', '0000-00-00 00:00:00'),
(114, 'shipping_pincodes', 58, 'Shipping Pincode', 'assets/admin_menu/1380279143_shipping417240628_s.png', 3, 2, 0, '2013-09-27 00:33:06', '2013-12-05 01:14:55'),
(115, 'mail_templates', 51, 'Mail Templates', 'assets/admin_menu/1380383935_041267807289_s.png', 2, 8, 1, '2013-09-28 05:29:35', '0000-00-00 00:00:00'),
(116, 'report_ring_sizer_request', 120, 'Ring Size Request', 'assets/admin_menu/trilliant531769636_s.jpg', 2, 1, 0, '2013-11-29 05:48:15', '2013-12-10 02:48:52'),
(117, 'shipping_method', 58, 'Shipping', 'assets/admin_menu/1386246848_delivery814691969_s.png', 0, 1, 0, '2013-12-05 01:09:10', '2013-12-05 01:18:33'),
(118, 'lgs', 1, 'Login', 'assets/admin_menu/radiant-cut-diamond748877168_s.jpg', 0, 0, 1, '2013-12-09 04:37:01', '0000-00-00 00:00:00'),
(119, 'report_call_me_back', 120, 'Call Me back Request', 'assets/admin_menu/1386675951_Help380402204_s.png', 0, 2, 0, '2013-12-10 00:16:49', '2013-12-10 02:48:28'),
(120, '', 64, 'Customer Requests', 'assets/admin_menu/1386246848_delivery758298587_s.png', 0, 9, 1, '2013-12-10 02:47:55', '2013-12-10 02:49:53'),
(136, '', 94, 'E-mail', 'assets/admin_menu/category04135499448_s.jpg', 2, 1, 0, '2013-12-28 01:43:44', '0000-00-00 00:00:00'),
(137, 'email_list', 136, 'E-mail List', 'assets/admin_menu/diwali-bg-left-top1645091382_s.jpg', 2, 3, 0, '2013-12-28 01:45:50', '0000-00-00 00:00:00'),
(138, '', 94, 'Chat', 'assets/admin_menu/11221780288_s.png', 2, 6, 1, '2014-01-16 00:02:26', '0000-00-00 00:00:00'),
(139, 'ch_chat_room', 138, 'Chat Room', 'assets/admin_menu/4612231314_s.png', 2, 1, 0, '2014-01-16 00:02:59', '2014-01-25 01:56:54'),
(140, 'ch_canned_message', 138, 'Canned Message', 'assets/admin_menu/181419500216_s.png', 2, 9, 0, '2014-01-16 00:04:27', '0000-00-00 00:00:00'),
(141, 'ch_auto_responder', 138, 'Auto Responder', 'assets/admin_menu/rg1967089514_s.png', 2, 12, 0, '2014-01-16 00:05:45', '0000-00-00 00:00:00'),
(142, 'ch_email_template', 138, 'Email Template', 'assets/admin_menu/yg549923980_s.png', 2, 10, 0, '2014-01-16 00:07:08', '0000-00-00 00:00:00'),
(143, 'ch_chat_invitation', 138, 'Pro-Active Chat Invitation', 'assets/admin_menu/111012172144_s.png', 2, 11, 0, '2014-01-16 00:08:37', '2014-01-16 00:09:11'),
(144, 'ch_question', 138, 'Chat Question', 'assets/admin_menu/white1582276274_s.png', 2, 15, 0, '2014-01-16 00:10:29', '0000-00-00 00:00:00'),
(145, 'ch_question_option', 138, 'Chat Question Option', 'assets/admin_menu/15586518436_s.png', 2, 17, 0, '2014-01-16 00:11:18', '0000-00-00 00:00:00'),
(146, 'languages', 36, 'Languages', 'assets/admin_menu/81394351543_s.jpg', 2, 15, 1, '2014-01-17 02:49:34', '0000-00-00 00:00:00'),
(147, 'ch_position', 138, 'Chatbox Design', 'assets/admin_menu/Tulips1856335556_s.jpg', 0, 3, 0, '2014-01-25 01:56:32', '0000-00-00 00:00:00'),
(148, 'ch_configuration', 138, 'Chat Configuration', 'assets/admin_menu/Aishwarya-Rai-Bachchan-Kalyan-Diamond-Jewellers_0307078383_s.jpg', 2, 2, 0, '2014-01-27 01:08:27', '0000-00-00 00:00:00'),
(149, 'ch_email_campaign', 136, 'Email Campaign', 'assets/admin_menu/11348780893_s.jpg', 2, 8, 1, '2014-01-27 01:21:19', '0000-00-00 00:00:00'),
(151, 'ch_chat_history', 138, 'Chat history', 'assets/admin_menu/ring1671841988_s.png', 0, 4, 0, '2014-02-01 00:36:09', '0000-00-00 00:00:00'),
(154, 'product_comparison', 5, 'Product Comparison', 'assets/admin_menu/wg936944698_s.png', 2, 5, 1, '2014-05-07 22:50:16', '2014-05-07 22:53:06'),
(159, 'inventory_type', 51, 'Manage Inventory', 'assets/admin_menu/Penguins1995040745_s.jpg', 0, 1, 1, '2015-02-25 19:30:11', '2015-02-27 18:44:38'),
(160, 'product_attribute', 5, 'Manage Product Attributes', 'assets/admin_menu/Penguins786728001_s.jpg', 0, 2, 1, '2015-02-27 18:34:13', '2015-02-27 20:36:26'),
(161, 'warehouse_transactions', 5, 'Add Purchase[Warehouse Transactions]', 'assets/admin_menu/Penguins1856579063_s.jpg', 0, 4, 1, '2015-03-13 12:10:24', '0000-00-00 00:00:00'),
(162, 'warehouse_products', 5, 'RATE SET[Warehouse Products]', 'assets/admin_menu/Penguins326133175_s.jpg', 0, 4, 1, '2015-03-13 12:11:12', '0000-00-00 00:00:00'),
(164, 'sales_order_new', 24, 'New Orders', 'assets/admin_menu/New1789267920_s.png', 0, 0, 0, '2015-04-23 13:22:05', '2015-04-23 15:38:54'),
(165, 'sales_order_process', 24, 'In Process', 'assets/admin_menu/process884394169_s.jpg', 0, 0, 0, '2015-04-23 13:24:16', '0000-00-00 00:00:00'),
(166, 'sales_order_complate', 24, 'Completed', 'assets/admin_menu/complate805810623_s.png', 0, 0, 0, '2015-04-23 13:26:06', '2015-04-23 16:11:22'),
(167, 'sales_order_all_order', 24, 'All Orders', 'assets/admin_menu/all637907291_s.jpg', 0, 0, 0, '2015-04-23 13:28:03', '0000-00-00 00:00:00'),
(168, 'report_reffer_bonus', 71, 'Reffer Bonus', 'assets/admin_menu/Reffer_Bonus1777290863_s.jpg', 0, 0, 0, '2015-04-28 17:26:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE IF NOT EXISTS `admin_user` (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL DEFAULT '7',
  `admin_user_firstname` varchar(200) DEFAULT NULL,
  `admin_user_lastname` varchar(200) DEFAULT NULL,
  `admin_user_emailid` varchar(200) DEFAULT NULL,
  `admin_xmpp_id` varchar(300) DEFAULT NULL,
  `admin_can_chat` tinyint(1) DEFAULT NULL COMMENT '1 yes and 0 No',
  `admin_chat_priority` int(11) DEFAULT '1' COMMENT 'admin priority for accept new chats',
  `admin_profile_image` mediumtext,
  `admin_user_phone_no` varchar(20) DEFAULT NULL,
  `admin_user_password` varchar(200) DEFAULT NULL,
  `admin_user_salt` varchar(200) DEFAULT NULL COMMENT '[comfirm_code]  	when admin create user and send comfirmation code in email and link for submit code',
  `admin_user_group_id` int(11) DEFAULT NULL COMMENT 'set permisssion',
  `admin_user_newslatter` int(11) DEFAULT NULL COMMENT '0 yes or 1 no',
  `admin_user_status` int(11) DEFAULT NULL,
  `admin_user_order_noti_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'display order notification status 0 enable and 1 disable',
  `admin_user_customer_noti_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'display new customer notification status 0 enable and 1 disable',
  `admin_user_message_noti_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT 'display feedback message notification status 0 enable and 1 disable',
  `admin_user_order_last_id` int(11) DEFAULT NULL COMMENT 'indicates id till user notidfied for new orders',
  `admin_user_customer_last_id` int(11) DEFAULT NULL COMMENT 'indicates id till user notidfied for new customers',
  `admin_user_message_last_id` int(11) DEFAULT NULL COMMENT 'indicates id till user notidfied for new feedback messages',
  `admin_user_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_user_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_user_id`),
  KEY `InAdUsrGroupID` (`admin_user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `admin_user`
--

TRUNCATE TABLE `admin_user`;
--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`admin_user_id`, `manufacturer_id`, `admin_user_firstname`, `admin_user_lastname`, `admin_user_emailid`, `admin_xmpp_id`, `admin_can_chat`, `admin_chat_priority`, `admin_profile_image`, `admin_user_phone_no`, `admin_user_password`, `admin_user_salt`, `admin_user_group_id`, `admin_user_newslatter`, `admin_user_status`, `admin_user_order_noti_status`, `admin_user_customer_noti_status`, `admin_user_message_noti_status`, `admin_user_order_last_id`, `admin_user_customer_last_id`, `admin_user_message_last_id`, `admin_user_created_date`, `admin_user_modified_date`) VALUES
(1, 7, 'Gautam', 'Kakadiya', 'kakdiya.gautam288@gmail.com', '', 1, 1, 'assets/admin_profile/Lighthouse1879496279_m.jpg', '9428854599', '1741a97777761a76e2b81c24d48307f7', '', 4, 0, 0, 0, 0, 0, 0, 0, 5, '2013-07-17 04:41:25', '2014-04-12 04:54:07'),
(2, 7, 'Meraki', 'Rich Foods', 'merakirichfoods@gmail.com', '', 0, 0, 'assets/admin_profile/api-integration1134018498_m.png', '8866822469', '1741a97777761a76e2b81c24d48307f7', '', 4, 0, 0, 0, 0, 0, 0, 0, 0, '2014-11-24 13:27:57', '0000-00-00 00:00:00'),
(3, 7, 'Rutul', 'Lakum', 'ratubhailakum@gmail.com', '', 0, 0, 'assets/admin_profile/vlcsnap-2017-07-22-22h52m57s7021497686662_m.png', '9824802874', '9b556a0ae38eebb8d14e85509574fdf0', NULL, 5, 0, 1, 0, 0, 0, NULL, NULL, NULL, '2017-08-10 05:07:01', '2017-08-23 23:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_group`
--

DROP TABLE IF EXISTS `admin_user_group`;
CREATE TABLE IF NOT EXISTS `admin_user_group` (
  `admin_user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_group_name` varchar(200) NOT NULL,
  `admin_user_group_key` varchar(200) NOT NULL COMMENT 'Key can not be changed once saved',
  `admin_user_group_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin_user_group_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`admin_user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `admin_user_group`
--

TRUNCATE TABLE `admin_user_group`;
--
-- Dumping data for table `admin_user_group`
--

INSERT INTO `admin_user_group` (`admin_user_group_id`, `admin_user_group_name`, `admin_user_group_key`, `admin_user_group_created_date`, `admin_user_group_modified_date`) VALUES
(1, 'administrator', '', '2013-07-16 16:50:12', '2014-05-07 11:17:13'),
(2, 'user', '', '2013-07-17 17:20:53', '2013-10-29 06:18:09'),
(3, 'demo', '', '2013-07-18 13:57:14', '2013-08-23 08:01:51'),
(4, 'Super Admin', 'SUPER_ADMIN', '2013-07-19 16:54:29', '2021-03-18 18:30:00'),
(5, 'Power Admin', 'POWER_ADMIN', '2014-04-01 04:10:56', '2021-03-03 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_settings`
--

DROP TABLE IF EXISTS `admin_user_settings`;
CREATE TABLE IF NOT EXISTS `admin_user_settings` (
  `admin_user_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL,
  `aus_key` varchar(20) NOT NULL,
  `aus_id_field` int(11) NOT NULL,
  `aus_value_field` varchar(100) NOT NULL,
  `aus_status` tinyint(1) NOT NULL,
  `aus_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `aus_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`admin_user_settings_id`),
  KEY `FK_aus_admin_user_id` (`admin_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `admin_user_settings`
--

TRUNCATE TABLE `admin_user_settings`;
-- --------------------------------------------------------

--
-- Table structure for table `affiliate_campaign`
--

DROP TABLE IF EXISTS `affiliate_campaign`;
CREATE TABLE IF NOT EXISTS `affiliate_campaign` (
  `affiliate_campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'Reserved not used right now, manufacturer_id identify ccTLD',
  `customer_partner_id` int(11) NOT NULL COMMENT 'Customer or partner if to which campaign belongs',
  `c_name` varchar(255) DEFAULT NULL COMMENT 'campaign name',
  `c_code` varchar(255) DEFAULT NULL COMMENT 'campaign code',
  `c_url` varchar(512) DEFAULT NULL COMMENT 'campaign URL optional',
  `c_maximum_use` int(11) DEFAULT NULL,
  `c_above_amount` double DEFAULT NULL COMMENT 'coupon above amount condition',
  `c_is_above_amount_currencywise` bit(1) DEFAULT NULL,
  `c_type` varchar(255) NOT NULL DEFAULT 'F' COMMENT 'F=>Fixed or P=>Percentage, on 03-04-2015 Fixed is now manufacturer core currency wise fixed amount, and one type added currency wise fixed amount',
  `c_discount_amt` float NOT NULL DEFAULT '100',
  `c_expiry_date` date DEFAULT NULL,
  `c_desc` mediumtext COMMENT 'coupon description',
  `c_status` int(1) DEFAULT NULL,
  `c_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `c_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`affiliate_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `affiliate_campaign`
--

TRUNCATE TABLE `affiliate_campaign`;
-- --------------------------------------------------------

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_name` varchar(200) NOT NULL,
  `article_alias` varchar(200) NOT NULL,
  `article_key` varchar(100) NOT NULL COMMENT 'key once stored can not be changed after wards',
  `article_category_id` int(11) NOT NULL,
  `article_image` text NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `article_description` text NOT NULL,
  `article_sort_order` int(11) NOT NULL,
  `article_status` int(11) NOT NULL COMMENT '0 or1',
  `article_category_tags` text NOT NULL COMMENT 'links of tag',
  `article_related_keywords` text NOT NULL COMMENT 'links of category',
  `custom_page_title` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL,
  `robots` int(11) NOT NULL,
  `author` varchar(200) NOT NULL,
  `content_rights` varchar(200) NOT NULL,
  `article_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`article_id`),
  KEY `InArtCatID` (`article_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `article`
--

TRUNCATE TABLE `article`;
--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `article_name`, `article_alias`, `article_key`, `article_category_id`, `article_image`, `image_size_id`, `article_description`, `article_sort_order`, `article_status`, `article_category_tags`, `article_related_keywords`, `custom_page_title`, `meta_keyword`, `meta_description`, `robots`, `author`, `content_rights`, `article_created_date`, `article_modified_date`) VALUES
(1, 'INVITE_FRIEND_MAIL', 'invite_friend_mail', 'INVITE_FRIEND_MAIL', 0, 'assets/article/invite51489310_m.jpg', 0, 'I Invite you to learn education video from Watch to Earn<br />\nYou can even invite your friends, for every friend that register and learn video we will pay you Rs. 2 every video learn.<br />', 0, 0, '', '', '', '', '', 1, '', '', '2015-05-05 13:45:41', '2016-01-23 13:45:54'),
(3, 'THANK YOU', 'thank-you', 'THANK_YOU', 0, 'assets/article/thank1706629056_m.jpg', 0, '<span style=\"color: rgb(34, 34, 34); font-family: Georgia, \'Times New Roman\', Times, serif; font-size: 16px; font-style: italic; line-height: 25px; background-color: rgb(236, 236, 236);\">Thank you for subscribing with us. We will be more then happy to send you latest product offers and updates. Happy Shopping.</span>\n<p style=\"color: rgb(34, 34, 34); font-family: Georgia, \'Times New Roman\', Times, serif; font-size: 16px; font-style: italic; line-height: 25px; background-color: rgb(236, 236, 236);\">It\'s nice of you to take the time to get to know us better. Here are something about us that we thought you might like to know.</p>', 0, 0, '', '', '', '', '', 1, '', '', '2015-05-05 13:56:57', '2016-03-10 12:24:26'),
(5, 'RETURN POLICY', 'return-policy', 'RETURN_POLICY', 0, 'assets/article/Return-Icon340938644_m.png', 0, '<p class=\"static-content-header\" style=\"margin-top: 1em; margin-bottom: 1em; font-size: 16px; font-weight: bold; color: rgb(0, 0, 0); font-family: open_sansregular; text-align: justify;\">1. Cancellation policy</p>\n\n<p class=\"static-content\" style=\"margin-top: 1em; margin-bottom: 1em; font-size: 16px; color: rgb(0, 0, 0); font-family: open_sansregular; text-align: justify;\">Customer can call customer service number and cancel order prior to confirmation, once order is confirmed and processed it can\'t be cancelled. However, if there are changes in the delivery time you mentioned earlier in your order or need to add more products, you need to call us.</p>\n\n<p class=\"static-content-header\" style=\"margin-top: 1em; margin-bottom: 1em; font-size: 16px; font-weight: bold; color: rgb(0, 0, 0); font-family: open_sansregular; text-align: justify;\">2. Return policy</p>\n\n<p class=\"static-content\" style=\"margin-top: 1em; margin-bottom: 1em; font-size: 16px; color: rgb(0, 0, 0); font-family: open_sansregular; text-align: justify;\">We have a \"no questions asked return and refund policy\" which entitles all our customers to return the product at the time of delivery if due to some reason they are not satisfied with the quality or freshness of the product. We will take the returned product back with us and make the necessary adjustments to your order value.</p>', 0, 0, '', '', '', '', '', 1, '', '', '2015-05-05 13:59:06', '2016-03-10 12:23:33'),
(6, 'RETURN & EXCHANGES', 'return-exchanges', 'RETURN_EXCHANGES', 0, 'assets/article/EXCHANGES881106561_m.jpg', 0, 'RETURN &amp; EXCHANGES', 0, 0, '', '', '', '', '', 1, '', '', '2015-05-05 14:00:22', '2015-05-13 12:52:17'),
(7, 'TERMS & CONDITION', 'terms-condition', 'TERMS_CONDITION', 21, 'assets/article/terms-and-conditions109990595_m.jpg', 8, '<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>1. Introduction :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">These Website Standard Terms and Conditions written on this webpage shall manage your use of this website. These Terms will be applied fully and affect to your use of this Website. By using this Website, you agreed to accept all terms and conditions written in here. You must not use this Website if you disagree with any of these Website Standard Terms and Conditions.</span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">Minors or people below 18 years old are not allowed to use this Website.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>2. Intellectual Property Rights :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">Other than the content you own, under these Terms, Rise India Online and/or its licensors own all the intellectual property rights and materials contained in this Website.<br />\n<br />\nYou are granted limited license only for purposes of viewing the material contained on this Website.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>3. Restrictions :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">You are specifically restricted from all of the following<br />\n<br />\n- publishing any Website material in any other media;<br />\n- selling, sublicensing and/or otherwise commercializing any Website material;<br />\n- publicly performing and/or showing any Website material;<br />\n- using this Website in any way that is or may be damaging to this Website;<br />\n- using this Website in any way that impacts user access to this Website;<br />\n- using this Website contrary to applicable laws and regulations, or in any way may cause harm to the Website, or to any person or business entity;<br />\n- engaging in any data mining, data harvesting, data extracting or any other similar activity in relation to this Website;<br />\n- using this Website to engage in any advertising or marketing.<br />\n<br />\nCertain areas of this Website are restricted from being access by you and Rise India Online may further restrict access by you to any areas of this Website, at any time, in absolute discretion. Any user ID and password you may have for this Website are confidential and you must maintain confidentiality as well.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>4. Your Content :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">In these Website Standard Terms and Conditions, “Your Content” shall mean any audio, video text, images or other material you choose to display on this Website. By displaying Your Content, you grant Rise India Online a non-exclusive, worldwide irrevocable, sub licensable license to use, reproduce, adapt, publish, translate and distribute it in any and all media.<br />\n<br />\nYour Content must be your own and must not be invading any third-party’s rights. Rise India Online reserves the right to remove any of Your Content from this Website at any time without notice.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>5. No warranties :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">This Website is provided “as is,” with all faults, and Rise India Online express no representations or warranties, of any kind related to this Website or the materials contained on this Website. Also, nothing contained on this Website shall be interpreted as advising you.<br />\n<br />\nIncome figure shown here are just an assumption and for reference purpose only. We do not make any promise/claim for your earning and its income figures. We are not responsible for the income amount you can generate.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>6. Limitation of liability :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">In no event shall Rise India Online, nor any of its officers, directors and employees, shall be held liable for anything arising out of or in any way connected with your use of this Website whether such liability is under contract.&nbsp; Rise India Online, including its officers, directors and employees shall not be held liable for any indirect, consequential or special liability arising out of or in any way related to your use of this Website.</span></div>\n<br />\n<span style=\"font-size:14px;\"><strong>\" We do not provide any types of jobs or any work neither we sell anything. This website is for learning purpose only. \"</strong><br />\n<br />\n<span style=\"font-size:16px;\"><strong>7. Indemnification :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">You hereby indemnify to the fullest extent Rise India Online from and against any and/or all liabilities, costs, demands, causes of action, damages and expenses arising in any way related to your breach of any of the provisions of these Terms.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>8. Severability :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">If any provision of these Terms is found to be invalid under any applicable law, such provisions shall be deleted without affecting the remaining provisions herein.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>9. Variation of Terms :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">Rise India Online is permitted to revise these Terms at any time as it sees fit, and by using this Website you are expected to review these Terms on a regular basis.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>10. Assignment :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">The Rise India Online is allowed to assign, transfer, and subcontract its rights and/or obligations under these Terms without any notification. However, you are not allowed to assign, transfer, or subcontract any of your rights and/or obligations under these Terms.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>11. Entire Agreement :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">These Terms constitute the entire agreement between Rise India Online and you in relation to your use of this Website, and supersede all prior agreements and understandings.</span></div>\n<br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>12. Governing Law &amp; Jurisdiction :</strong></span></span><br />\n&nbsp;\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">These Terms will be governed by and interpreted in accordance with the laws of the State of India, and you submit to the non-exclusive jurisdiction of the state and federal courts located in India for the resolution of any disputes.</span></div>', 10, 0, '', '', '', '', '', 1, '', '', '2015-05-05 14:00:44', '2018-02-20 12:23:58'),
(8, 'PRIVACY POLICY', 'privacy-policy', 'PRIVACY_POLICY', 24, 'assets/article/Privacy1969175560_m.jpg', 8, '<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">Your privacy is very important to us. Accordingly, we have developed this policy in order for you to understand how we collect, use, communicate and make use of personal information. The following outlines our privacy policy.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>Use of Cookies :</strong></span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">A cookie is a very small text document, which often includes an anonymous unique identifier. When you visit a&nbsp;</span><span style=\"font-size: 14px;\">website, that site’s computer asks your computer for permission to store this file in a part of your hard drive&nbsp;</span><span style=\"font-size: 14px;\">specifically designated for cookies. Each website can send its own cookie to your browser if your browser’s&nbsp;</span><span style=\"font-size: 14px;\">preferences allow it, but (to protect your privacy) your browser only permits a website to access the cookies it has&nbsp;</span><span style=\"font-size: 14px;\">already sent to you, not the cookies sent to you by other sites.</span></div>\n\n<div>&nbsp;</div>\n\n<div><strong><span style=\"font-size:14px;\"><span style=\"font-size:16px;\">IP Addresses :</span></span></strong><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">IP addresses are used by your computer every time you are connected to the Internet. Your IP address is a number that&nbsp;</span><span style=\"font-size: 14px;\">is used by computers on the network to identify your computer. IP addresses are automatically collected by our web&nbsp;</span><span style=\"font-size: 14px;\">server as part of demographic and profile data known as “traffic data” so that data (such as the Web pages you&nbsp;</span><span style=\"font-size: 14px;\">request) can be sent to you.</span></div>\n\n<div>&nbsp;</div>\n\n<div><strong><span style=\"font-size:14px;\"><span style=\"font-size:16px;\">Email Information :</span></span></strong><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">If you choose to correspond with us through email, we may retain the content of your email messages together with&nbsp;</span><span style=\"font-size: 14px;\">your email address and our responses. We provide the same protections for these electronic communications that we&nbsp;</span><span style=\"font-size: 14px;\">employ in the maintenance of information received online, mail and telephone. This also applies when you register&nbsp;</span><span style=\"font-size: 14px;\">for our website, sign up through any of our forms using your email address or make a purchase on this site. For&nbsp;</span><span style=\"font-size: 14px;\">further information see the email policies below.</span></div>\n\n<div>&nbsp;</div>\n\n<div><strong><span style=\"font-size:14px;\"><span style=\"font-size:16px;\">How Do We Use the Information That You Provide to Us?</span></span></strong><br />\n&nbsp;</div>\n\n<div><span style=\"font-size:14px;\">Broadly speaking, we use personal information for purposes of administering our business activities, providing&nbsp;</span><span style=\"font-size: 14px;\">customer service and making available other items and services to our customers and prospective customers.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:14px;\">SureJob will not obtain personally-identifying information about you when you visit our&nbsp;</span><span style=\"font-size: 14px;\">site, unless you choose to provide such information to us, nor will such information be sold or otherwise&nbsp;</span><span style=\"font-size: 14px;\">transferred to unaffiliated third parties without the approval of the user at the time of&nbsp; ollection.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:14px;\">We may disclose information when legally compelled to do so, in other words, when we, in good faith, believe that the&nbsp;</span><span style=\"font-size: 14px;\">law requires it or for the protection of our legal rights.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>Email Policies :</strong></span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">We are committed to keeping your e-mail address confidential. We do not sell, rent, or lease our subscription lists&nbsp;</span><span style=\"font-size: 14px;\">to third parties, and we will not provide your personal information to any third party individual, government&nbsp;</span><span style=\"font-size: 14px;\">agency, or company at any time unless strictly compelled to do so by law.</span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">We will use your e-mail address solely to provide timely information about SureJob.</span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">We will maintain the information you send via e-mail in accordance with applicable federal law.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>CAN-SPAM Compliance :</strong></span></div>\n\n<div>&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">In compliance with the CAN-SPAM Act, all e-mail sent from our organization will clearly state who the e-mail is from&nbsp;</span><span style=\"font-size: 14px;\">and provide clear information on how to contact the sender. In addition, all e-mail messages will also contain&nbsp;</span><span style=\"font-size: 14px;\">concise information on how to remove yourself from our mailing list so that you receive no further e-mail&nbsp;</span><span style=\"font-size: 14px;\">communication from us.</span></div>\n\n<div>&nbsp;</div>\n\n<div><strong><span style=\"font-size:14px;\">Choice/Opt-Out :</span></strong></div>\n\n<div>&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">Our site provides users the opportunity to opt-out of receiving communications from us and our partners by reading&nbsp;</span><span style=\"font-size: 14px;\">the unsubscribe instructions located at the bottom of any e-mail they receive from us at anytime.</span></div>\n\n<div>&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">Users who no longer wish to receive our newsletter or promotional materials may opt-out of receiving these&nbsp;</span><span style=\"font-size: 14px;\">communications by clicking on the unsubscribe link in the e-mail.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>Intellectual Property Rights :</strong></span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size: 14px;\">All copyrights, trademarks, patents and other intellectual property rights in and on our website and all content and&nbsp;</span><span style=\"font-size: 14px;\">software located on the site shall remain the sole property of SureJob or its licensors.</span></div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">The use of our trademarks, content and intellectual property is forbidden without the express written consent&nbsp;</span><span style=\"font-size: 14px;\">from watch2earn.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>You must not:</strong></span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:14px;\">Republish material from our website without prior written consent.</span></div>\n\n<div><span style=\"font-size:14px;\">Sell or rent material from our website.</span></div>\n\n<div><span style=\"font-size:14px;\">Reproduce, duplicate, create derivative, copy or otherwise exploit material on our website for any purpose.</span></div>\n\n<div><span style=\"font-size:14px;\">Redistribute any content from our website, including onto another website.</span></div>\n\n<div><br />\n<span style=\"font-size:14px;\"><span style=\"font-size:16px;\"><strong>Acceptable Use :</strong></span></span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">You agree to use our website only for lawful purposes, and in a way that does not infringe the rights of, restrict or&nbsp;</span><span style=\"font-size: 14px;\">inhibit anyone else’s use and enjoyment of the website. Prohibited behavior includes harassing or causing distress&nbsp;</span><span style=\"font-size: 14px;\">or inconvenience to any other user, transmitting obscene or offensive content or disrupting the normal flow of&nbsp;</span><span style=\"font-size: 14px;\">dialogue within our website.</span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">You must not use our website to send unsolicited commercial communications. You must not use the content on our&nbsp;</span><span style=\"font-size: 14px;\">website for any marketing related purpose without our express written consent.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>Restricted Access :</strong></span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">We may in the future need to restrict access to parts (or all) of our website and reserve full rights to do so. If,&nbsp;</span><span style=\"font-size: 14px;\">at any point, we provide you with a username and password for you to access restricted areas of our website, you&nbsp;</span><span style=\"font-size: 14px;\">must ensure that both your username and password are kept confidential.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>Use of Testimonials :</strong></span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">In accordance to with the FTC guidelines concerning the use of endorsements and testimonials in advertising, please&nbsp;</span><span style=\"font-size: 14px;\">be aware of the following:</span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">Testimonials that appear on this site are actually received via text, audio or video submission. They are individual&nbsp;</span><span style=\"font-size: 14px;\">experiences, reflecting real life experiences of those who have used our products and/or services in some way. They&nbsp;</span><span style=\"font-size: 14px;\">are individual results and results do vary. We do not claim that they are typical results. The testimonials are not&nbsp;</span><span style=\"font-size: 14px;\">necessarily representative of all of those who will use our products and/or services.</span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">The testimonials displayed in any form on this site (text, audio, video or other) are reproduced verbatim, except for&nbsp;</span><span style=\"font-size: 14px;\">correction of grammatical or typing errors. Some may have been shortened. In other words, not the whole message&nbsp;</span><span style=\"font-size: 14px;\">received by the testimonial writer is displayed when it seems too lengthy or not the whole statement seems relevant&nbsp;</span><span style=\"font-size: 14px;\">for the general public.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>How Do We Protect Your Information and Secure Information Transmissions?</strong></span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">Email is not recognized as a secure medium of communication. For this reason, we request that you do not send private&nbsp;</span><span style=\"font-size: 14px;\">information to us by email. However, doing so is allowed, but at your own risk. Some of the information you may&nbsp;</span><span style=\"font-size: 14px;\">enter on our website may be transmitted securely via a secure medium known as Secure Sockets Layer, or SSL. Credit&nbsp;</span><span style=\"font-size: 14px;\">Card information and other sensitive information is never transmitted via email.</span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">watch2earn may use software programs to create summary statistics, which are used for such</span></div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">purposes as assessing the number of visitors to the different sections of our site, what information is of most and&nbsp;</span><span style=\"font-size: 14px;\">least interest, determining technical design specifications, and identifying system performance or problem&nbsp;</span><span style=\"font-size: 14px;\">areas.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>Disclaimer and Limitation of Liability :</strong></span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">watch2earn makes no representations, warranties, or assurances as to the accuracy, currency or</span></div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">completeness of the content contain on this website or any sites linked to this site.</span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">All the materials on this site are provided ‘as is’ without any express or implied warranty of any kind, including&nbsp;</span><span style=\"font-size: 14px;\">warranties of merchantability, noninfringement of intellectual property or fitness for any particular purpose. In no&nbsp;</span><span style=\"font-size: 14px;\">event shall SureJob or its agents or associates be liable for any damages whatsoever&nbsp;</span><span style=\"font-size: 14px;\">(including, without limitation, damages for loss of profits, business interruption, loss of information, injury or&nbsp;</span><span style=\"font-size: 14px;\">death) arising out of the use of or inability to use the materials, even if SureJob has&nbsp;</span><span style=\"font-size: 14px;\">been advised of the possibility of such loss or damages.</span></div>\n\n<div>&nbsp;</div>\n\n<div><span style=\"font-size:16px;\"><strong>Policy Changes :</strong></span><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">We reserve the right to amend this privacy policy at any time with or without notice. However, please be assured that&nbsp;</span><span style=\"font-size: 14px;\">if the privacy policy changes in the future, we will not use the personal information you have submitted to us under&nbsp;</span><span style=\"font-size: 14px;\">this privacy policy in a manner that is materially inconsistent with this privacy policy, without your prior&nbsp;</span><span style=\"font-size: 14px;\">consent.</span></div>\n\n<div style=\"text-align: justify;\">&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size:14px;\">We are committed to conducting our business in accordance with these principles in order to ensure that the&nbsp;</span><span style=\"font-size: 14px;\">confidentiality of personal information is protected and maintained.</span></div>', 5, 0, '', '', '', '', '', 1, '', '', '2015-05-05 14:01:01', '2018-02-20 12:15:13'),
(9, 'CONTACT US', 'contact-us', 'CONTACT_US', 0, 'assets/article/business_contact1139629532_m.png', 0, 'CONTACT US', 0, 0, '', '', '', '', '', 1, '', '', '2015-05-05 14:02:34', '2015-05-05 17:27:00'),
(10, 'About the author of Watch2Earn', 'about-the-author-of-watch2earn', 'ABOUT_US', 23, 'assets/article/aboutus1056590961_m.jpg', 0, '<iframe allow=\"autoplay; encrypted-media\" allowfullscreen=\"\" frameborder=\"0\" height=\"400\" src=\"https://www.youtube.com/embed/q9n5RkwL_Ys\" width=\"870\"></iframe>\n<br>\n<div><strong style=\"font-size: 16px;\">The Road I Started my Journey :</strong><br />\n&nbsp;</div>\n\n<div style=\"text-align: justify;\"><span style=\"font-size: 14px;\">I welcome you all to my watch2earn, Started on 2018 – keeping in mind to support all people to know about the different ways to Earn Money Online Without Investment.<br />\n<br />\nI started my first online business on 2018 (probably I was studying my pre-final year of my college) on Blogspot platform.<br />\n<br />\nThe blog was no more, but it had taught me how to start an own business? After I completed my college studies, I went for the job due to family circumstances.<br />\n<br />\nBetween them I stopped working online for two years 2016 – 2017 and later, during the early 2018’s February, I registered my first domain watch2earn.<br />\n<br />\nI do not aware about CMS such as WordPress, Blogger’s Blog because I discontinued working online between the two years.<br />\n<br />\nBut my passion was not discontinued and it pushed me to learn HTML based web-design. I referred nearly 100’s of books and online resources to learn web-design.</span></div>\n<br />\n<strong><span style=\"font-size: 16px;\">Why Online Home Income?</span></strong>\n\n<div style=\"text-align: justify;\"><span style=\"font-size: 14px;\">Most of the people in the world have a dream of living a life with complete financial satisfaction.<br />\n<br />\n\"If you don’t find a way to Make Money while you sleep, you will work until you die — By, Warren Buffet\"<br />\n<br />\nThis made me achieve this stage where I am now making my full-time living by blogging and other online businesses.<br />\n<br />\nIn Online Home Income, you can learn about the five successful ways of earning money online without investment.<br />\n<br />\nMaking people start from Zero investment to earn 1000’s of dollars was the core mission of our blog.</span></div>\n<br />\n<span style=\"font-size: 18px;\"><strong>Summing up :</strong></span>\n\n<div style=\"text-align: justify;\"><span style=\"font-size: 14px;\">watch2earn was mainly started to educate every people to get a genuine alternate source of Income and to live a freestyle.<br />\n<br />\nIn our Blog, I share my own experiences and share Do-It-Yourself (DIY) tutorial on a most five successful methods of earning money online.<br />\n<br />\nOur Community Blog serves as a dedicated source for finding legitimate online jobs from home.</span></div>', 1, 0, '', '', '', '', '', 1, '', '', '2015-05-05 14:02:49', '2018-04-04 17:24:59'),
(11, 'SHIPPING INFORMATION', 'shipping-information', 'SHIPPING_INFORMATION', 0, 'assets/article/New1595710600_m.png', 0, '<table class=\"list\">\n	<tbody class=\"ajaxdata\">\n		<tr id=\"18\">\n			<td style=\"text-align: center;\">&nbsp;</td>\n			<td class=\"left\">SHIPPING INFORMATION</td>\n		</tr>\n	</tbody>\n</table>', 0, 0, '', '', '', '', '', 1, '', '', '2015-05-05 14:04:05', '1970-01-01 11:11:11'),
(12, 'GUJCART COUPON', 'gujcart-coupon', 'DRO', 27, 'assets/article/Kedar_parrot558557185_m.jpg', 0, '<p><span style=\"font-size:20px;\"><span style=\"font-family: times new roman,times,serif;\"><span style=\"color: rgb(0, 0, 0);\"><strong><span style=\"font-size:22px;\">Now Gujcart offer<br />\n<br />\nGujcart give Flat give Rs.300 off on all sareese product.<br />\n<br />\nStill 31 December 16 use code \" GUJ300 \"</span></strong></span></span></span><br />\n&nbsp;</p>', 5, 0, '', '', 'Gujcart coupon', 'Gujcart promo code | Gujcart voucher | Gujcart Coupon code | Gujcart sarees coupon', 'Gujcart coupon | Gujcart Promo code', 1, 'gujcart.com', 'gujcart.com', '2016-02-24 22:10:33', '2016-12-17 18:38:43');

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
CREATE TABLE IF NOT EXISTS `article_category` (
  `article_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `article_category_name` varchar(200) NOT NULL,
  `article_category_alias` varchar(200) NOT NULL COMMENT 'for frendly url',
  `article_category_key` varchar(200) NOT NULL COMMENT 'unique key',
  `article_category_parent_id` int(11) NOT NULL,
  `article_category_image` text NOT NULL COMMENT 'icon',
  `image_size_id` int(11) NOT NULL,
  `article_category_description` text NOT NULL,
  `article_category_sort_order` int(11) NOT NULL,
  `article_category_status` int(11) NOT NULL COMMENT '0 or 1',
  `article_category_tags` text NOT NULL COMMENT 'links of tag',
  `article_category_related_keywords` text NOT NULL COMMENT 'links of category',
  `custom_page_title` varchar(200) NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL,
  `robots` int(11) NOT NULL,
  `author` varchar(200) NOT NULL,
  `content_rights` varchar(200) NOT NULL,
  `article_category_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article_category_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`article_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `article_category`
--

TRUNCATE TABLE `article_category`;
--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`article_category_id`, `article_category_name`, `article_category_alias`, `article_category_key`, `article_category_parent_id`, `article_category_image`, `image_size_id`, `article_category_description`, `article_category_sort_order`, `article_category_status`, `article_category_tags`, `article_category_related_keywords`, `custom_page_title`, `meta_keyword`, `meta_description`, `robots`, `author`, `content_rights`, `article_category_created_date`, `article_category_modified_date`) VALUES
(1, 'Right colomn', 'right-colomn', '', 0, 'assets/article_category/Chrysanthemum1393568643_s.jpg', 1, '<p>about us</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"/MyOwn/assets/media/files/my/royaldiamond.jpg\" style=\"height:1108px; width:1554px\" /></p>', 1, 0, '', '', 'ewf', 'ewfewf', 'wefewfewf', 2, 'weffew', 'ewfewf', '2013-07-11 05:24:58', '2013-08-23 02:37:12'),
(2, 'Left column', 'left-column', '', 5, 'assets/article_category/Tulips1657043995_s.jpg', 1, '<p>test</p>', 2, 0, '', '', 'test', 'test', 'test', 1, 'test', 'test', '2013-07-11 05:59:04', '2013-07-23 22:50:11'),
(3, 'Single Column', 'single-column', '', 1, 'assets/article_category/Desert1373526166_s.jpg', 2, '<p>faq</p>', 0, 0, '', '', 'test', 'my cate', 'my cate', 1, 'my cate', 'my cate', '2013-07-11 07:02:46', '2013-07-23 22:53:34'),
(4, 'My Account', 'my-account', '', 1, 'assets/article_category/Hydrangeas1373705430_s.jpg', 0, 'test1', 2, 1, '', '', 'aa', 'aaa', 'aa', 4, 'aa', 'aa', '2013-07-13 08:50:30', '2013-07-16 02:32:37'),
(5, 'Left-layout', 'left-layout', '', 0, 'assets/article_category/Lighthouse222180811_s.jpg', 1, 'education', 3, 1, '', '', 'ed', 'ed', 'ed', 2, 'ed', 'ed', '2013-07-16 07:04:02', '2013-07-23 22:50:28'),
(6, 'Footer Layout', 'footer-layout', '', 0, 'assets/article_category/Jellyfish587757895_s.jpg', 1, 'igi certi', 3, 0, '', '', 'igi', 'gi', 'igi', 3, 'gi', 'igi', '2013-07-16 07:05:06', '2013-07-23 22:52:58'),
(7, 'demo article', 'demo-article', '', 2, 'assets/article_category/Hydrangeas115718291_s.jpg', 1, '<p><img alt=\"\" src=\"/MyOwn/assets/media/files/Diamond.png\" style=\"height:1571px; width:2356px\" /><img alt=\"\" src=\"/MyOwn/assets/media/files/Desert.jpg\" style=\"height:768px; width:1024px\" />wefewf</p>', 2, 0, '', '', 'wefwe', 'ewffwefwef', 'wefwf', 3, 'ewfewf', 'ewfewfew', '2013-07-16 09:48:16', '2013-08-13 05:16:29'),
(20, 'Home', 'home', '', 0, 'assets/article_category/catagory-pro5964153218_s.jpg', 0, '<p>Home page middle content articles</p>', 0, 0, '', '', 'Test', 'Test', 'Test', 1, 'Test', 'Test', '2013-08-14 06:44:39', '2015-05-05 08:10:44'),
(21, 'Footer Articles', 'footer-articles', '', 0, 'assets/article_category/catagory-pro51258788815_s.jpg', 0, '<p>Perry fotter</p>', 0, 0, '', '', 'Test', 'Test', 'TEst', 1, 'Test', 'Tets', '2013-08-15 23:58:21', '2015-05-05 08:10:36'),
(22, 'common', 'common', '', 0, 'assets/article_category/cart_icon782201072_s.png', 0, '<p>Perry Fotter Menu</p>', 0, 0, '', '', 'Test', 'Tets', 'Test', 1, 'Test', 'Test', '2013-08-17 01:24:33', '2013-08-24 06:31:09'),
(23, 'ABOUT US', 'about-us', 'ABOUT_US', 22, 'assets/article_category/catagory-pro51733544857_s.jpg', 0, '<p>Test</p>', 1, 0, '', '', 'Test', 'Test', 'Test', 1, 'Test', 'Test', '2013-08-17 01:25:19', '2016-02-24 16:53:57'),
(24, 'POLICIES', 'policies', 'POLICIES', 22, 'assets/article_category/cart_icon964402165_s.png', 0, '<p>Test</p>', 2, 0, '', '', 'Test', 'Test', 'Test', 1, 'Test', 'Test', '2013-08-17 01:25:56', '2013-08-17 03:24:16'),
(25, 'EDUCATION', 'education', 'EDUCATION', 22, 'assets/article_category/cart_icon421835296_s.png', 0, '<p>Test</p>', 3, 0, '', '', 'Test', 'Test', 'TEst', 1, 'Test', 'Test', '2013-08-17 01:26:40', '2013-08-17 03:24:24'),
(26, 'CONNECT WITH US', 'connect-with-us', 'CONNECT_WITH_US', 22, 'assets/article_category/cart_icon34734162_s.png', 0, '<p>Test</p>', 4, 0, '', '', 'Test', 'Test', 'Test', 1, 'Test', 'Test', '2013-08-17 01:27:19', '2013-09-17 03:36:25'),
(27, 'GUJCART COUPON', 'gujcart-coupon', 'DRO', 22, 'assets/article_category/Gajar6IDProof129572969_s.jpg', 0, 'GUJCART COUPON', 5, 0, '', '', 'GUJCART COUPON', 'GUJCART COUPON', 'GUJCART COUPON', 1, 'gujcart.com', 'gujcart.com', '2016-02-24 16:36:39', '2016-12-17 12:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `article_cctld`
--

DROP TABLE IF EXISTS `article_cctld`;
CREATE TABLE IF NOT EXISTS `article_cctld` (
  `article_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `article_id` int(11) NOT NULL,
  `article_name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `article_alias` varchar(200) NOT NULL,
  `article_key` varchar(100) NOT NULL COMMENT 'key once stored can not be changed after wards',
  `article_category_id` int(11) NOT NULL,
  `article_image` text NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `article_description` text CHARACTER SET utf8 NOT NULL,
  `article_sort_order` int(11) NOT NULL,
  `article_status` int(11) NOT NULL COMMENT '0 or1',
  `article_category_tags` text NOT NULL COMMENT 'links of tag',
  `article_related_keywords` text NOT NULL COMMENT 'links of category',
  `custom_page_title` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `meta_description` text NOT NULL,
  `robots` int(11) NOT NULL,
  `author` varchar(200) NOT NULL,
  `content_rights` varchar(200) NOT NULL,
  `article_cctld_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `article_cctld_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`article_cctld_id`),
  UNIQUE KEY `UnArticleIDManufID` (`manufacturer_id`,`article_id`),
  KEY `InArtCatID` (`article_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `article_cctld`
--

TRUNCATE TABLE `article_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_name` varchar(200) NOT NULL,
  `banner_key` varchar(30) NOT NULL COMMENT 'unique key for developer reference',
  `banner_image` mediumtext NOT NULL,
  `banner_image_alt_text` varchar(100) NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `banner_description` mediumtext NOT NULL,
  `banner_link` mediumtext NOT NULL COMMENT 'image link which module or category call ',
  `banner_status` int(11) NOT NULL COMMENT '0 or  1',
  `banner_sort_order` int(11) NOT NULL,
  `banner_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `banner_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `banner`
--

TRUNCATE TABLE `banner`;
-- --------------------------------------------------------

--
-- Table structure for table `banner_category_map`
--

DROP TABLE IF EXISTS `banner_category_map`;
CREATE TABLE IF NOT EXISTS `banner_category_map` (
  `banner_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `InBanID` (`banner_id`),
  KEY `InCatID` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table will identify multiple category allocation for any particular banner';

--
-- Truncate table before insert `banner_category_map`
--

TRUNCATE TABLE `banner_category_map`;
-- --------------------------------------------------------

--
-- Table structure for table `banner_cctld`
--

DROP TABLE IF EXISTS `banner_cctld`;
CREATE TABLE IF NOT EXISTS `banner_cctld` (
  `banner_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `banner_id` int(11) NOT NULL,
  `banner_name` varchar(200) NOT NULL,
  `banner_key` varchar(50) NOT NULL COMMENT 'unique key for developer reference',
  `banner_image` mediumtext NOT NULL,
  `banner_image_alt_text` varchar(100) NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `banner_description` mediumtext NOT NULL,
  `banner_link` mediumtext NOT NULL COMMENT 'image link which module or category call ',
  `banner_status` int(11) NOT NULL COMMENT '0 or  1',
  `banner_sort_order` int(11) NOT NULL,
  `banner_cctld_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `banner_cctld_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`banner_cctld_id`),
  UNIQUE KEY `UnBannerIDManufID` (`manufacturer_id`,`banner_id`),
  KEY `FK_bc_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `banner_cctld`
--

TRUNCATE TABLE `banner_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `banner_position`
--

DROP TABLE IF EXISTS `banner_position`;
CREATE TABLE IF NOT EXISTS `banner_position` (
  `banner_position_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_position_name` varchar(200) NOT NULL,
  `banner_position_alias` text NOT NULL,
  `banner_position_status` int(11) NOT NULL,
  `banner_position_sort_order` int(11) NOT NULL,
  `banner_position_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `banner_position_modified_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`banner_position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `banner_position`
--

TRUNCATE TABLE `banner_position`;
--
-- Dumping data for table `banner_position`
--

INSERT INTO `banner_position` (`banner_position_id`, `banner_position_name`, `banner_position_alias`, `banner_position_status`, `banner_position_sort_order`, `banner_position_created_date`, `banner_position_modified_date`) VALUES
(3, 'top', 'top', 0, 3, '2013-07-08 10:05:12', '2013-08-14 23:30:59'),
(4, 'bottom', 'bottom', 0, 13, '2013-07-08 10:05:24', '2013-08-14 23:40:16'),
(6, 'bottom middle', 'bottom-middle', 0, 12, '2013-07-25 10:13:27', '2013-08-14 23:40:03'),
(7, 'top-menu', 'top-menu', 0, 1, '2013-07-25 10:13:56', '2013-08-23 02:49:00'),
(9, 'debug', 'debug', 0, 17, '2013-07-25 10:14:20', '2013-08-15 23:48:11'),
(12, 'middle top', 'middle-top', 0, 6, '2013-07-25 10:15:04', '2013-08-14 23:31:59'),
(15, 'breadcrumb', 'breadcrumb', 0, 2, '2013-07-25 10:16:05', '2013-07-25 05:03:06'),
(23, 'top-middle', 'top-middle', 0, 4, '2013-08-14 00:34:11', '2013-08-14 23:31:26'),
(24, 'top-bottom', 'top-bottom', 0, 5, '2013-08-14 01:23:21', '2013-08-14 23:31:42'),
(25, 'middle left', 'middle-left', 0, 7, '2013-08-14 04:47:04', '2013-08-14 23:39:24'),
(26, 'middle right', 'middle-right', 0, 9, '2013-08-14 04:47:19', '2013-08-14 23:39:35'),
(27, 'bottom top', 'bottom-top', 0, 11, '2013-08-14 04:50:53', '2013-08-14 23:39:54'),
(28, 'middle', 'middle', 0, 8, '2013-08-14 06:35:40', '2013-08-14 23:39:43'),
(29, 'middle bottom', 'middle-bottom', 0, 10, '2013-08-14 06:35:54', '0000-00-00 00:00:00'),
(30, 'footer-top', 'footer-top', 0, 14, '2013-08-15 23:48:02', '2013-08-16 00:19:50'),
(31, 'footer-middle', 'footer-middle', 0, 15, '2013-08-15 23:48:31', '2013-08-16 00:20:07'),
(32, 'footer-bottom', 'footer-bottom', 0, 16, '2013-08-15 23:48:48', '2013-08-16 00:20:18');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE IF NOT EXISTS `configuration` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL DEFAULT '5',
  `config_key` varchar(50) NOT NULL COMMENT 'Which will be unique for coding reference',
  `config_value` mediumtext NOT NULL COMMENT 'config value for develpment use',
  `config_display_name` varchar(150) NOT NULL COMMENT 'display name for admin reference',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'created date of configuration',
  `modified_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Last modification date',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='Whole site configuration & keywrod will be here';

--
-- Truncate table before insert `configuration`
--

TRUNCATE TABLE `configuration`;
--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`config_id`, `admin_user_id`, `config_key`, `config_value`, `config_display_name`, `created_date`, `modified_date`) VALUES
(1, 5, 'ADMIN_EMAIL', 'admin@watch2earn.online', 'Admin configuration email', '2013-07-29 12:23:31', '2015-04-29 13:20:38'),
(2, 5, 'LABOUR_CHARGE', '0', 'Labour Charge', '2013-07-31 05:30:26', '2013-07-02 13:20:00'),
(3, 5, 'COMPANY_PROFIT', '0', 'Company Profit', '2013-07-31 05:30:22', '2013-07-09 09:41:10'),
(4, 5, 'INFO_EMAIL', 'info@watch2earn.online\r\n', 'EMAIL_ACCOUNT', '2013-07-29 12:03:18', '2015-04-29 12:38:09'),
(5, 5, 'SUPPORT_EMAIL', 'support@watch2earn.online', 'EMAIL_ACCOUNT', '2013-07-18 08:43:52', '2015-04-29 12:38:19'),
(6, 5, 'FILTER_DIFF_PRICE', '5000', 'Filter Price Difference on front side', '2013-07-25 07:23:38', '2013-07-08 12:43:36'),
(7, 5, 'SEO_GENERATOR', 'info@watch2earn.online', 'SEO Generator', '2013-08-09 03:11:08', '2015-04-29 12:38:26'),
(8, 5, 'TAX_RATE', '0', 'Order Tax Rate Default(%)', '2013-08-10 01:25:31', '2013-09-29 20:54:02'),
(9, 5, 'FONT_1', 'Test', 'ENGRAVING_FONT', '2013-08-03 05:52:09', '2013-08-02 18:52:09'),
(10, 5, 'FONT_2', 'Test', 'ENGRAVING_FONT', '2013-08-03 05:52:23', '2013-08-02 18:52:23'),
(11, 5, 'FONT_3', 'Test', 'ENGRAVING_FONT', '2013-08-03 05:52:35', '2013-08-02 18:52:35'),
(12, 5, 'DEAD_ON_ARR', 'Dead On Arrival', 'ORDER_RETURN_REASON', '2013-08-09 05:12:57', '2013-08-08 23:42:57'),
(13, 5, 'FAULTY', 'Faulty, please supply details', 'ORDER_RETURN_REASON', '2013-08-09 05:13:23', '2013-08-08 23:43:23'),
(14, 5, 'ORDER_ERROR', 'Order Error', 'ORDER_RETURN_REASON', '2013-08-09 05:13:42', '2013-08-08 23:43:42'),
(15, 5, 'ORD_RET_OTHER_REASON', 'Other, please supply details', 'ORDER_RETURN_REASON', '2013-08-09 05:14:50', '2013-08-08 23:44:50'),
(16, 5, 'ORD_RET_REC_WRONG_ITEM', 'Received Wrong Item', 'ORDER_RETURN_REASON', '2013-08-09 05:15:43', '2013-08-08 23:45:43'),
(17, 5, 'ORDER_LAST_NOTIFIED_ID', '0', 'Order LAST NOTIFIED ID', '2013-09-26 22:57:11', '2013-09-26 17:27:11'),
(18, 5, 'CUSTOMER_LAST_NOTIFIED_ID', '0', 'CUSTOMER LAST NOTIFIED ID', '2013-09-26 22:58:49', '2013-09-26 17:28:49'),
(19, 5, 'PRIVATE_MSG_LAST_NOTIFIED_ID', '0', 'PRIVATE MESSAGE LAST NOTIFIED ID', '2013-09-26 22:59:25', '2013-09-26 17:29:25'),
(20, 5, 'SALES_EMAIL', 'sales@cloudwebs.net', 'Sales email', '2013-10-21 23:45:04', '2015-04-29 12:38:39'),
(21, 5, 'TOLL_FREE_NO', '+91 9375333232', 'Toll Free Number', '2013-10-28 02:30:31', '2016-03-04 11:30:07'),
(22, 5, 'CONTACT_EMAIL', 'info@watch2earn.online', 'Contact Email', '2014-01-22 09:56:30', '2015-04-28 13:10:58'),
(23, 5, 'PARTNER_EMAIL', 'partner@cloudwebs.net', 'EMAIL_ACCOUNT', '2014-04-23 04:30:08', '2015-04-29 12:39:14'),
(24, 5, 'EBAY_AUTO_LISTING', '1', 'EBAY_AUTO_LISTING', '2014-11-20 10:03:28', '0000-00-00 00:00:00'),
(25, 5, 'SLIDER_UPL_SIZE', '800', 'Slide Maximum allowed size', '2015-03-28 10:00:02', '2021-03-19 22:23:02'),
(26, 5, 'PRODUCT_CATEGORIES_IMG_UPLOAD_SIZE', '800', 'product_categories_img_upload', '2015-03-28 12:10:19', '2021-03-19 22:22:22'),
(27, 5, 'PRODUCT_CATEGORIES_BANNER_UPLOAD_SIZE', '1000', 'product_categories_banner_upload', '2015-03-28 12:11:02', '2021-03-19 22:22:38'),
(28, 5, 'ARTICAL_CATEGORIES_IMG_UPLOAD_SIZE', '800', 'ARTICAL_CATEGORIES_IMG_UPLOAD_SIZE', '2015-03-28 12:12:25', '2021-03-19 22:22:48'),
(29, 5, 'MANAGE_ARTICAL_IMG_UPLOAD_SIZE', '70', 'manage_artical_img_upload', '2015-03-28 12:13:16', '2015-05-22 13:29:59'),
(30, 5, 'BANNER_UPL_SIZE', '80', 'banner_upload_size', '2015-03-28 15:10:52', '2015-03-28 09:40:52'),
(31, 5, 'PRODUCT_IMG_SIZE', '800', 'product_img_size', '2015-03-28 18:17:11', '2021-03-19 22:23:13'),
(32, 5, 'PRODUCT_REC_BANNER', 'Recommended size is 1024 X 720,Supported formats: JPG, JPEG, PNG', 'product_rec_banner', '2015-03-30 10:17:20', '2015-03-30 07:19:36'),
(33, 5, 'PRODUCT_REC_IMAGE', 'Recommended size is 640 X 426, Supported formats: JPG, JPEG, PNG', 'product_rec_image', '2015-03-30 10:18:06', '2018-01-17 10:44:47'),
(34, 5, 'ARTICAL_CAT_REC_ICON', 'Recommended size is 10 X 10, Supported formats: JPG, JPEG, PNG', 'artical_cat_rec_icon', '2015-03-30 10:20:17', '2015-03-30 07:20:42'),
(36, 5, 'SLIDER_REC_IMG', 'Recommended size is 1600 X 700, Supported formats: JPG, JPEG, PNG', 'slider_rec_img', '2015-03-30 10:22:10', '2015-04-22 12:55:00'),
(37, 5, 'BANNER_REC_IMG', 'Recommended size is 1024x720, Supported formats: JPG, JPEG, PNG', 'banner_rec_img', '2015-03-30 10:23:33', '2015-04-28 13:12:10'),
(38, 5, 'ARTICAL_REC_IMG', 'Recommendation Size is 900 X 900, Supported formats: JPG, JPEG, PNG', 'artical_rec_image', '2015-03-30 11:56:13', '2015-03-30 07:20:20'),
(39, 5, 'PRODUCT_CAT_REC_IMG', 'Recommended size is 900 X 900, Supported formats: JPG, JPEG, PNG', 'product_cat_rec_img', '2015-03-30 12:38:28', '2015-04-11 05:20:11'),
(60, 5, 'IS_SHIP_ALL', '0', 'Is shipping available in all locations.', '2015-04-03 11:02:51', '2015-04-28 12:49:25'),
(61, 5, 'SOLD_OUT', 'This Product Is Sold Out, product will be exclude from checkout', 'sold_out', '2015-04-28 18:20:16', '2015-04-28 12:50:16'),
(62, 5, 'COMPAIGN_AMT', '2', 'Compaign Amount', '2016-01-22 20:47:35', '2016-01-22 15:17:35'),
(63, 5, 'HOME_PRODUCT_CATEGORY', '325|318|319', 'HOME_PRODUCT_CATEGORY', '2016-03-01 15:04:56', '2016-03-01 11:25:39'),
(64, 5, 'DAILY_WATCH', '5', 'Daily User Watch Video', '2018-02-22 10:38:44', '2018-02-22 10:38:44'),
(65, 5, 'VIDEO_PRICE', '2', 'Watch video and get money', '2018-02-24 05:57:57', '2018-02-24 05:57:57'),
(66, 5, 'EATCH_TIME', '120', 'Watch Video Time', '2018-04-06 17:01:17', '2018-04-06 17:01:17');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(150) NOT NULL,
  `country_key` varchar(150) NOT NULL COMMENT 'unique key for dev reference',
  `country_code` varchar(10) NOT NULL,
  `female_default_ring_size` int(11) NOT NULL COMMENT 'since the parameters are country specific that''s why they are stored here',
  `male_default_ring_size` int(11) NOT NULL,
  `other_default_ring_size` int(11) NOT NULL,
  `country_import_duty_desc` varchar(300) NOT NULL,
  `country_import_duty` double NOT NULL COMMENT 'in percent(%) ',
  `country_status` tinyint(4) NOT NULL DEFAULT '0',
  `country_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `country_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `UnCountryKey` (`country_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `country`
--

TRUNCATE TABLE `country`;
-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `coupon_name` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_maximum_use` int(11) NOT NULL,
  `coupon_above_amount` double NOT NULL COMMENT 'coupon above amount condition',
  `coupon_is_above_amount_currencywise` bit(1) NOT NULL DEFAULT b'0' COMMENT 'is coupon above amount condition currency wise applicable or for core currency. Default to 0 since in case of switch from single currency to multiple currency will not result in conflict',
  `coupon_type` varchar(255) NOT NULL COMMENT 'Fixed or Percentage, on 03-04-2015 Fixed is now manufacturer core currency wise fixed amount, and one type added currency wise fixed amount',
  `coupon_discount_amt` float NOT NULL,
  `coupon_expiry_date` date NOT NULL,
  `coupon_desc` mediumtext NOT NULL COMMENT 'coupon description',
  `coupon_status` int(1) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `coupon`
--

TRUNCATE TABLE `coupon`;
-- --------------------------------------------------------

--
-- Table structure for table `coupon_category_map`
--

DROP TABLE IF EXISTS `coupon_category_map`;
CREATE TABLE IF NOT EXISTS `coupon_category_map` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `InCouponID` (`coupon_id`),
  KEY `InCatID` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `coupon_category_map`
--

TRUNCATE TABLE `coupon_category_map`;
-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL COMMENT 'to link country currency with country table',
  `currency_name` varchar(100) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `currency_symbol` varchar(200) NOT NULL COMMENT 'save html code for browser dislpay',
  `currency_value` float(15,8) NOT NULL,
  `price_filter_range` varchar(100) NOT NULL DEFAULT '199|200|999' COMMENT 'added from 23/4/2014: since price filters are now more relative to currencies',
  `currency_status` tinyint(1) NOT NULL,
  `currency_sort_order` smallint(3) NOT NULL,
  `currency_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `currency_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `currency`
--

TRUNCATE TABLE `currency`;
-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'separate according to department or store',
  `customer_bucks` double DEFAULT '0' COMMENT 'added on 23-04-2015 to manage affiliate credit and refund credit',
  `customer_firstname` varchar(200) DEFAULT NULL,
  `customer_lastname` varchar(200) DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'user.guest etc',
  `facebook_id` varchar(50) DEFAULT NULL COMMENT 'facebook profile id',
  `email_list_id` int(11) DEFAULT NULL COMMENT 'email_list_id from master of email system',
  `customer_emailid` varchar(200) DEFAULT NULL,
  `customer_gender` varchar(10) DEFAULT NULL,
  `customer_phoneno` varchar(20) DEFAULT NULL,
  `customer_dob` date DEFAULT NULL,
  `customer_anni_date` date DEFAULT NULL COMMENT 'anniversary date',
  `discount_offers` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-enabled,1-disabled',
  `promotional_offers` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-enabled,1-disabled',
  `festival_gifts` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-enabled,1-disabled',
  `customer_fax` varchar(20) DEFAULT NULL,
  `budget` varchar(255) DEFAULT NULL COMMENT 'budget used in ask expert',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'product type used in ask expert',
  `occassion` int(11) DEFAULT NULL COMMENT 'occassion used in ask expert',
  `buy_gift` varchar(10) DEFAULT NULL COMMENT 'buy/gift used in ask expert',
  `customer_password` varchar(200) DEFAULT NULL,
  `customer_salt` varchar(100) DEFAULT NULL COMMENT 'send comfirmation code in email and link for submit code',
  `customer_access_validation_token` varchar(100) DEFAULT NULL COMMENT 'customer_access_validation_token to access account directly withouit login from mails   ',
  `customer_ip_address` varchar(200) DEFAULT NULL,
  `customer_newsletter` int(3) NOT NULL DEFAULT '1' COMMENT '0 enabled and 1 disabled',
  `customer_status` tinyint(1) NOT NULL DEFAULT '0',
  `customer_approved` varchar(10) NOT NULL DEFAULT '0',
  `customer_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  KEY `IncusGroupID` (`customer_group_id`),
  KEY `FK_c_email_list_id` (`email_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `customer`
--

TRUNCATE TABLE `customer`;
-- --------------------------------------------------------

--
-- Table structure for table `customer_account_manage`
--

DROP TABLE IF EXISTS `customer_account_manage`;
CREATE TABLE IF NOT EXISTS `customer_account_manage` (
  `customer_account_manage_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL COMMENT 'till now field is not of any use, since order processing managed at level of order not order_details',
  `customer_account_manage_credit` double NOT NULL DEFAULT '0' COMMENT 'when account credited value stored in this field, changed to double on 24-04-2015',
  `customer_account_manage_debit` double NOT NULL DEFAULT '0' COMMENT 'when account debiteded value stored in this field, changed to double on 24-04-2015',
  `customer_account_manage_balance` varchar(20) NOT NULL DEFAULT '0' COMMENT 'Deprecated 23-04-2015: since customer_bucks field added in customer table to avoid data redundancy',
  `customer_account_manage_entry_type` tinyint(1) NOT NULL COMMENT 'Changed On 24-04-2015 =&gt; 1: Affiliate BUCKS credited, 2: Purchase using BUCKS debited, 3: return BUCKS credit',
  `cam_note` varchar(300) NOT NULL COMMENT 'remark of transaction field added on 05-05-2015',
  `customer_account_manage_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_account_manage_id`),
  KEY `InCusID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `customer_account_manage`
--

TRUNCATE TABLE `customer_account_manage`;
-- --------------------------------------------------------

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `customer_address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `customer_address_firstname` varchar(200) DEFAULT NULL,
  `customer_address_lastname` varchar(200) DEFAULT NULL,
  `customer_address_phone_no` varchar(20) DEFAULT NULL,
  `customer_address_address` mediumtext,
  `customer_address_landmark_area` varchar(100) DEFAULT NULL,
  `customer_address_company` varchar(200) DEFAULT NULL,
  `customer_address_city` varchar(200) DEFAULT NULL,
  `customer_address_zipcode` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `customer_address_state_id` int(11) DEFAULT NULL,
  `customer_address_is_default` tinyint(1) NOT NULL DEFAULT '1',
  `customer_address_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_address_modified_date` timestamp NOT NULL DEFAULT '1970-01-01 19:00:00',
  PRIMARY KEY (`customer_address_id`),
  UNIQUE KEY `address_id` (`customer_address_id`),
  KEY `InCusID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `customer_address`
--

TRUNCATE TABLE `customer_address`;
-- --------------------------------------------------------

--
-- Table structure for table `customer_cartwish`
--

DROP TABLE IF EXISTS `customer_cartwish`;
CREATE TABLE IF NOT EXISTS `customer_cartwish` (
  `customer_cartwish_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL DEFAULT '7' COMMENT 'separate according to department or store',
  `product_price_id` int(11) NOT NULL COMMENT 'for carttype of ''dia'' instead of product_price_id The diamond_price_id will be stored',
  `diamond_price_id` varchar(100) NOT NULL COMMENT 'diamond_price_id array which is mounted on selected design mount whose id is stored in product_price_id field: the ID string is separated by |',
  `product_qty` double NOT NULL COMMENT 'only used when entry type is Cart, changed to douible on 6-03-2015 to support warehouse features ',
  `ring_size` varchar(100) NOT NULL COMMENT 'ring_size_id specified by user for cart products',
  `customer_cartwish_type` varchar(3) NOT NULL COMMENT '''C'' for Cart and ''W'' for wishlist',
  `customer_cartwish_carttype` varchar(5) NOT NULL COMMENT 'type of cart like ''prod'' for product ''sol'' for solitaire and ''dia'' for only diamonds: this type if defferrent from that of _type field which separates wishlist and cart entry',
  `customer_cartwish_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_cartwish_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_cartwish_id`),
  UNIQUE KEY `UnCustIDProdPriceIDTYpe` (`customer_id`,`product_price_id`,`customer_cartwish_type`,`manufacturer_id`),
  KEY `InCusId` (`customer_id`),
  KEY `InProPriceID` (`product_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='saves data for customer cart and wishlist';

--
-- Truncate table before insert `customer_cartwish`
--

TRUNCATE TABLE `customer_cartwish`;
-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_name` varchar(200) NOT NULL,
  `customer_group_type` varchar(3) NOT NULL COMMENT '''U''--> User , ''G''==> Guest, ''P''==>Partners ',
  `customer_group_status` int(11) NOT NULL,
  `customer_group_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_group_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `customer_group`
--

TRUNCATE TABLE `customer_group`;
--
-- Dumping data for table `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `customer_group_name`, `customer_group_type`, `customer_group_status`, `customer_group_created_date`, `customer_group_modified_date`) VALUES
(1, 'Visitor', 'V', 1, '2013-07-09 09:20:08', '2013-07-18 07:04:10'),
(2, 'Guest', 'G', 1, '2013-07-09 09:20:26', '2013-07-13 05:32:40'),
(5, 'demo', 'P', 0, '2013-08-13 03:57:35', '2013-09-18 22:57:39'),
(6, 'User', 'U', 0, '2013-09-18 23:31:20', '2015-04-16 13:34:57'),
(7, 'Chat User', 'C', 0, '2014-01-27 03:34:07', '2014-01-27 03:34:07'),
(8, 'Subscriber', 'S', 0, '2014-03-31 00:59:41', '2014-01-27 03:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `customer_interaction`
--

DROP TABLE IF EXISTS `customer_interaction`;
CREATE TABLE IF NOT EXISTS `customer_interaction` (
  `customer_interaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL COMMENT 'if customer is logged in than customer id is stored',
  `sessions_id` int(11) NOT NULL COMMENT 'sessions_id FROM sessions table for customer: ci rules may map from customer_id OR sessions_id OR ci_ip whichever is applicable first',
  `ci_ip` varchar(50) NOT NULL COMMENT 'ci rules may map from customer_id OR ci_ip whichever is applicable first',
  `ci_interaction_type` varchar(50) NOT NULL COMMENT 'interactoin_type field contains key of type of interaction and can not be changed after wards e.g. CALL_ME_BACK for call me back phone number entry',
  `ci_customer_phone_number` varchar(13) NOT NULL,
  `ci_forward_link` varchar(1000) NOT NULL COMMENT 'link from where something requested to user',
  `ci_backward_link` varchar(1000) NOT NULL COMMENT 'link to which customer came from campaign',
  `ci_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ci_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_interaction_id`),
  KEY `FK_ci_customer_id` (`customer_id`),
  KEY `FK_ci_sessions_id` (`sessions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table is part of interaction, navigation, behaviour analysis';

--
-- Truncate table before insert `customer_interaction`
--

TRUNCATE TABLE `customer_interaction`;
-- --------------------------------------------------------

--
-- Table structure for table `customer_video_map`
--

DROP TABLE IF EXISTS `customer_video_map`;
CREATE TABLE IF NOT EXISTS `customer_video_map` (
  `customer_video_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `cvm_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_video_map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `customer_video_map`
--

TRUNCATE TABLE `customer_video_map`;
-- --------------------------------------------------------

--
-- Table structure for table `diamond_color`
--

DROP TABLE IF EXISTS `diamond_color`;
CREATE TABLE IF NOT EXISTS `diamond_color` (
  `diamond_color_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `diamond_color_name` varchar(50) NOT NULL,
  `diamond_color_key` varchar(30) NOT NULL,
  `diamond_color_sort_order` int(11) NOT NULL,
  `diamond_color_status` tinyint(3) NOT NULL COMMENT '0 enabled, 1 disabled',
  `diamond_color_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diamond_color_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diamond_color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `diamond_color`
--

TRUNCATE TABLE `diamond_color`;
-- --------------------------------------------------------

--
-- Table structure for table `diamond_price`
--

DROP TABLE IF EXISTS `diamond_price`;
CREATE TABLE IF NOT EXISTS `diamond_price` (
  `diamond_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `dp_manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `dp_rapnet_lot_no` int(11) NOT NULL COMMENT 'unique ID for diamond supplied by Rapnet',
  `diamond_type_id` int(11) NOT NULL COMMENT 'type_id comes from diamond type table',
  `diamond_color_id` int(11) NOT NULL COMMENT 'color : S,H,E,F,G etc',
  `diamond_purity_id` int(11) NOT NULL COMMENT 'purity : VVS,IF,SI etc.',
  `diamond_shape_id` int(11) NOT NULL COMMENT 'foreign key: until now shape is mapped from product_stone map table but after implementation of rapnet shape is identified directly in diamomd_price table',
  `seller_id` int(11) NOT NULL COMMENT 'ID of owner of diamond',
  `availability_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `certificate_lab_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `culet_size_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `cut_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `fancy_color_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `fancy_color_intensity_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `fancy_color_overtone_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `fluorescence_color_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `girdle_condition_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `girdle_thick_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `girdle_thin_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `polish_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `symmetry_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `diamond_price_name` varchar(100) NOT NULL COMMENT 'names of diamond like rubu,emerald, white diamond etc',
  `diamond_price_key` varchar(200) NOT NULL,
  `dp_black_inclusion` varchar(10) NOT NULL,
  `dp_brand` varchar(20) NOT NULL,
  `dp_center_inclusion` varchar(10) NOT NULL,
  `certificate_id` int(11) NOT NULL COMMENT 'foreign key from rap table',
  `pincode_id` int(11) NOT NULL,
  `dp_city_name` varchar(30) NOT NULL COMMENT 'city name is added so that join is not required each time top pincode table when there is only city name required',
  `dp_crown_angle` double NOT NULL,
  `dp_crown_height` double NOT NULL COMMENT 'in %',
  `dp_depth` double NOT NULL COMMENT 'in %',
  `dp_girdle` double NOT NULL COMMENT 'in %',
  `dp_is_matched_pair_separable` bit(1) NOT NULL,
  `dp_key_to_symbols` varchar(30) NOT NULL,
  `dp_laser_inscription` varchar(50) NOT NULL,
  `dp_measurements` varchar(30) NOT NULL,
  `dp_member_comments` varchar(255) NOT NULL,
  `dp_milky` varchar(10) NOT NULL,
  `dp_pair_stock` varchar(30) NOT NULL COMMENT ' Enter the stock number of the other diamond in the pair.',
  `dp_pavilion_angle` double NOT NULL,
  `dp_pavilion_depth` double NOT NULL,
  `dp_rapnet_discount` double NOT NULL COMMENT 'stored in %',
  `dp_rapnet_price` double NOT NULL COMMENT 'stored in US dollar',
  `dp_report_type` varchar(20) NOT NULL,
  `dp_report_issue_date` datetime NOT NULL,
  `dp_report_issue_location` varchar(100) NOT NULL,
  `dp_shade` varchar(10) NOT NULL,
  `dp_weight` double NOT NULL COMMENT 'diamond weight in carat',
  `dp_star_length` varchar(10) NOT NULL,
  `dp_stock_no` varchar(30) NOT NULL COMMENT 'diamond owner''s stock no',
  `dp_table` double NOT NULL COMMENT 'stored in %',
  `dp_time_to_delivery` tinyint(3) NOT NULL,
  `dp_treatment` varchar(10) NOT NULL,
  `diamond_price_labour_charge` varchar(20) NOT NULL COMMENT 'labour charge to be added on diamond price',
  `dp_price` double NOT NULL COMMENT 'price of diamond specified for unit of weight specified: always stored in INR',
  `dp_price_cz` double NOT NULL COMMENT 'the applicable price for cz diamonds if the actual diamond here is replcaed by cz diamonds: for diamond type cs price will be per 1 stone and for gemstone price will be per carat',
  `dp_calculated_cost` varchar(20) NOT NULL COMMENT 'diamond price cost calculated after multiplying by weight ration and adding labour charge ',
  `dp_discount` double NOT NULL COMMENT 'discount offered by perrian for diamonds',
  `dp_final_price` double NOT NULL COMMENT 'final price applicable after deducting discount from  diamonds mostly used for RapNet Diamonds',
  `dp_weight_diff` varchar(20) NOT NULL COMMENT 'not actual weight of diamond but weight unit in relation with price specified: not used',
  `dp_icon` mediumtext NOT NULL,
  `dp_desc` mediumtext COMMENT 'diamond price wise description',
  `dp_sort_order` int(11) NOT NULL,
  `dp_status` tinyint(1) NOT NULL DEFAULT '0',
  `dp_status_temp` tinyint(4) NOT NULL COMMENT 'Used to update diamond using DLS service at run time so that at front side no effect on dp_status at once: 0 enable and 1 disable',
  `dp_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dp_modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diamond_price_id`),
  KEY `InDiaTypeID` (`diamond_type_id`),
  KEY ` InDiaColorID` (`diamond_color_id`),
  KEY `InDiaPurityID` (`diamond_purity_id`),
  KEY `Indp_rapnet_lot_no` (`dp_rapnet_lot_no`),
  KEY `Indiamond_shape_id` (`diamond_shape_id`),
  KEY `Incut_id` (`cut_id`),
  KEY `Inpolish_id` (`polish_id`),
  KEY `Insymmetry_id` (`symmetry_id`),
  KEY `FK_dp_manufacturer_id` (`dp_manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `diamond_price`
--

TRUNCATE TABLE `diamond_price`;
-- --------------------------------------------------------

--
-- Table structure for table `diamond_price_cctld`
--

DROP TABLE IF EXISTS `diamond_price_cctld`;
CREATE TABLE IF NOT EXISTS `diamond_price_cctld` (
  `diamond_price_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `diamond_price_id` int(11) NOT NULL,
  `diamond_price_labour_charge` varchar(20) DEFAULT NULL,
  `dp_price` double DEFAULT NULL,
  `dp_price_cz` double DEFAULT NULL,
  `dp_calculated_cost` varchar(20) DEFAULT NULL,
  `dp_discount` double DEFAULT NULL,
  `dp_final_price` double DEFAULT NULL,
  `dp_status` tinyint(1) DEFAULT '1',
  `dp_status_temp` tinyint(1) NOT NULL DEFAULT '1',
  `dp_cctld_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dp_cctld_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diamond_price_cctld_id`),
  KEY `FK_dpc_manufacturer_id` (`manufacturer_id`),
  KEY `FK_dpc_diamond_price_id` (`diamond_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `diamond_price_cctld`
--

TRUNCATE TABLE `diamond_price_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `diamond_purity`
--

DROP TABLE IF EXISTS `diamond_purity`;
CREATE TABLE IF NOT EXISTS `diamond_purity` (
  `diamond_purity_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `diamond_purity_name` varchar(50) NOT NULL,
  `diamond_purity_key` varchar(30) NOT NULL,
  `diamond_purity_sort_order` tinyint(3) NOT NULL,
  `diamond_purity_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '0 enabled, 1 disabled',
  `diamond_purity_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diamond_purity_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diamond_purity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `diamond_purity`
--

TRUNCATE TABLE `diamond_purity`;
-- --------------------------------------------------------

--
-- Table structure for table `diamond_shape`
--

DROP TABLE IF EXISTS `diamond_shape`;
CREATE TABLE IF NOT EXISTS `diamond_shape` (
  `diamond_shape_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `diamond_shape_name` varchar(200) NOT NULL COMMENT 'si,vs,vvs,black diamond',
  `diamond_shape_key` varchar(30) NOT NULL,
  `diamond_shape_icon` mediumtext NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `diamond_shape_status` int(11) NOT NULL DEFAULT '1' COMMENT '0 enabled and 1 disabled',
  `diamond_shape_sort_order` int(11) NOT NULL,
  `diamond_shape_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diamond_shape_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diamond_shape_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `diamond_shape`
--

TRUNCATE TABLE `diamond_shape`;
-- --------------------------------------------------------

--
-- Table structure for table `diamond_type`
--

DROP TABLE IF EXISTS `diamond_type`;
CREATE TABLE IF NOT EXISTS `diamond_type` (
  `diamond_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `diamond_type_name` varchar(30) NOT NULL COMMENT 'Name of type like diamond, gemstone etc',
  `diamond_type_key` varchar(200) NOT NULL,
  `dimaond_type_sort_order` int(11) NOT NULL,
  `diamond_type_status` tinyint(4) DEFAULT '0',
  `diamond_type_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `diamond_type_modified_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diamond_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `diamond_type`
--

TRUNCATE TABLE `diamond_type`;
-- --------------------------------------------------------

--
-- Table structure for table `email_campaign`
--

DROP TABLE IF EXISTS `email_campaign`;
CREATE TABLE IF NOT EXISTS `email_campaign` (
  `email_campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `ec_subject` varchar(300) NOT NULL,
  `ec_key` varchar(20) NOT NULL,
  `ec_message_body` mediumtext NOT NULL,
  `ec_description` mediumtext NOT NULL,
  `ec_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ec_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `email_campaign`
--

TRUNCATE TABLE `email_campaign`;
-- --------------------------------------------------------

--
-- Table structure for table `email_list`
--

DROP TABLE IF EXISTS `email_list`;
CREATE TABLE IF NOT EXISTS `email_list` (
  `email_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(200) NOT NULL,
  `el_optout_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'opt ot Level as per web standard: 0 indicates no authority send mail, 1 indictaes email entered by user but still not confirmed by clicking on mail while 2 indicates registered and confirmed mail allows mailing to end user',
  `el_status` varchar(3) NOT NULL DEFAULT 'S' COMMENT 'N => New, S => subscribed , U => unsubscribed, B => Blocked',
  `el_reference_source` varchar(255) NOT NULL,
  `el_priority_level` int(11) NOT NULL COMMENT 'priority level',
  `el_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `el_modified_date` timestamp NOT NULL DEFAULT '1970-01-01 19:00:00',
  PRIMARY KEY (`email_list_id`),
  UNIQUE KEY `UnEmailid` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `email_list`
--

TRUNCATE TABLE `email_list`;
--
-- Triggers `email_list`
--
DROP TRIGGER IF EXISTS `email_list`;
DELIMITER $$
CREATE TRIGGER `email_list` BEFORE INSERT ON `email_list` FOR EACH ROW BEGIN
	IF NEW.el_reference_source = "REGISTER" THEN
        	SET NEW.el_priority_level = 1;
	ELSEIF NEW.el_reference_source = "SUBSCRIBED" THEN
        	SET NEW.el_priority_level = 5;
	ELSEIF NEW.el_reference_source = "GUEST_USER" THEN
        	SET NEW.el_priority_level = 10;
        ELSEIF NEW.el_reference_source = "EMAIL_TO_FRIEND" THEN
        	SET NEW.el_priority_level = 15;
	END IF;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `email_send_history`
--

DROP TABLE IF EXISTS `email_send_history`;
CREATE TABLE IF NOT EXISTS `email_send_history` (
  `email_send_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(11) NOT NULL COMMENT 'admin id who sends mails',
  `email_campaign_id` int(11) NOT NULL,
  `es_from_emails` varchar(255) NOT NULL,
  `es_to_emails` mediumtext NOT NULL COMMENT 'users',
  `es_module_primary_id` mediumtext NOT NULL COMMENT 'module primary id or (customer group id for which mail send) for which mail send',
  `es_module_name` varchar(100) NOT NULL COMMENT 'specifies for which module mail was sent',
  `es_product_id` mediumtext COMMENT 'Stored product if email sent contains product information',
  `es_subject` mediumtext NOT NULL,
  `es_message` mediumtext NOT NULL,
  `es_ip_address` varchar(100) NOT NULL,
  `es_status` int(11) NOT NULL COMMENT 'confirm,pending,cancelled,refunded',
  `es_sent_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email_send_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `email_send_history`
--

TRUNCATE TABLE `email_send_history`;
-- --------------------------------------------------------

--
-- Table structure for table `error_codes`
--

DROP TABLE IF EXISTS `error_codes`;
CREATE TABLE IF NOT EXISTS `error_codes` (
  `error_id` int(11) NOT NULL AUTO_INCREMENT,
  `error_code` varchar(5) NOT NULL COMMENT 'Error code in numeric values',
  `error_message` mediumtext NOT NULL COMMENT 'Error description in form of message',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `error_codes`
--

TRUNCATE TABLE `error_codes`;
--
-- Dumping data for table `error_codes`
--

INSERT INTO `error_codes` (`error_id`, `error_code`, `error_message`, `modified_date`) VALUES
(1, '1001', 'Email address is already exist, please try different email address.', '2013-07-29 23:53:29'),
(2, '1002', 'Your Account has been inactive. Please contact admin OR Please check your mailbox.', '2013-09-28 01:25:10'),
(3, '1003', 'You have entered wrong old password, please correct it.', '2013-07-15 13:00:00'),
(4, '1004', 'Invalid login credentials.', '2013-07-10 23:28:14'),
(5, '1005', 'Warning: Please check the form carefully for errors!', '2013-07-29 23:26:12'),
(6, '1006', 'Warning: Record is deleted', '2013-07-29 23:26:12'),
(7, '1007', 'Sorry! you don\'t have insert permission.', '2013-07-27 06:49:47'),
(8, '1008', 'Sorry! you don\'t have edit permission.', '2013-07-27 06:50:07'),
(9, '1009', 'Sorry! you don\'t have delete permission.', '2013-07-27 06:50:19'),
(10, '1010', 'Sorry! you don\'t have view permission.', '2013-07-27 06:50:37'),
(11, '1011', 'Your email address is subscribed.', '2013-08-16 23:41:02'),
(12, '1012', 'Your account has been created successfully, please check mail to verify your account.', '2013-09-06 23:24:36'),
(13, '1013', 'Invalid email or password combination.', '2013-10-29 01:20:29'),
(14, '1014', 'Password reset information is sent to your email address. Please check your mailbox.', '2013-09-15 14:09:08'),
(15, '1015', 'Sorry! You are not registered.', '2013-09-18 23:48:00'),
(16, '1016', 'You have successfully signed up with facebook. Your password details are sent to your email, please check your mailbox.', '2013-09-15 18:09:30'),
(17, '1017', 'We could not find information about this activation key. Please verify your activation email.', '2013-09-15 13:00:00'),
(18, '1018', 'Your activation link is already approved.', '2013-09-28 04:52:47'),
(19, '1019', 'Your account has been activated, please login to experience the features.', '2013-09-28 04:50:29'),
(20, '1020', 'You are logged in as guest user, please register first.', '2013-09-18 23:39:47'),
(21, '1021', 'Sorry you don\'t have permission on any page of admin, first seek permission from Super Admin', '2013-09-26 01:50:03'),
(22, '1022', 'Sorry you don\'t have any permission on this page.', '2013-09-26 03:37:30'),
(23, '1023', 'Sorry! you haven\'t permission to access this page.', '2013-09-26 05:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

DROP TABLE IF EXISTS `filters`;
CREATE TABLE IF NOT EXISTS `filters` (
  `filters_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `filters_name` varchar(255) NOT NULL COMMENT 'name of filter',
  `filters_table_name` varchar(50) NOT NULL COMMENT 'table name of  related item may contains dash char at last with diamond_type_id if table_name and field_name combination unique',
  `filters_table_field_name` varchar(255) NOT NULL COMMENT 'primary field name of  related item',
  `filters_table_id` mediumtext NOT NULL COMMENT 'multiple id ',
  `filters_sort_order` int(11) NOT NULL DEFAULT '0',
  `filters_status` tinyint(1) DEFAULT NULL,
  `filters_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `filters_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`filters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `filters`
--

TRUNCATE TABLE `filters`;
-- --------------------------------------------------------

--
-- Table structure for table `front_hook`
--

DROP TABLE IF EXISTS `front_hook`;
CREATE TABLE IF NOT EXISTS `front_hook` (
  `front_hook_id` int(11) NOT NULL AUTO_INCREMENT,
  `front_hook_name` varchar(255) NOT NULL COMMENT 'Display name',
  `front_hook_type` varchar(1) NOT NULL COMMENT '''C'' fro controller  and ''E'' for design elements',
  `front_hook_alias` varchar(255) NOT NULL COMMENT 'name of controller class',
  `front_hook_desc` mediumtext NOT NULL,
  `front_hook_status` tinyint(1) NOT NULL COMMENT '0 enable and 1 disable',
  `front_hook_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `front_hook_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`front_hook_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='front_hook used to store pages created for front side';

--
-- Truncate table before insert `front_hook`
--

TRUNCATE TABLE `front_hook`;
--
-- Dumping data for table `front_hook`
--

INSERT INTO `front_hook` (`front_hook_id`, `front_hook_name`, `front_hook_type`, `front_hook_alias`, `front_hook_desc`, `front_hook_status`, `front_hook_created_date`, `front_hook_modified_date`) VALUES
(1, 'Products', 'C', 'products', '0', 0, '2013-08-13 06:22:32', '0000-00-00 00:00:00'),
(2, 'Articles', 'C', 'p', '0', 0, '2013-08-13 06:22:32', '0000-00-00 00:00:00'),
(3, 'Gifts', 'C', 'gifts', '0', 0, '2013-08-13 11:41:34', '0000-00-00 00:00:00'),
(4, 'About Us', 'C', 'about-us', '0', 0, '2013-08-13 11:53:15', '0000-00-00 00:00:00'),
(5, 'Home', 'C', 'home', '0', 0, '2013-08-14 04:30:56', '0000-00-00 00:00:00'),
(6, 'Feature', 'E', 'feature', '0', 0, '2013-08-14 07:27:53', '0000-00-00 00:00:00'),
(7, 'Searchbox', 'E', 'searchbox', '', 0, '2013-08-14 08:34:51', '0000-00-00 00:00:00'),
(8, 'Bottom Content Customer Review', 'E', 'bottom_content', '', 0, '2013-08-14 08:35:13', '0000-00-00 00:00:00'),
(9, 'Slider', 'E', 'slider', '', 0, '2013-08-14 10:05:35', '0000-00-00 00:00:00'),
(10, 'Fotter Menu', 'E', 'footer-menu', '', 0, '2013-08-17 08:43:44', '0000-00-00 00:00:00'),
(11, 'Products Slider', 'E', 'products-slider', '', 0, '2013-08-21 06:34:24', '0000-00-00 00:00:00'),
(12, 'Home Middle Content', 'E', 'home-middle', '', 0, '2013-08-22 08:51:40', '0000-00-00 00:00:00'),
(13, 'Searchbox Test', 'E', 'searchbox_test', '', 0, '2013-08-26 08:58:34', '0000-00-00 00:00:00'),
(14, 'Search', 'C', 'search', '', 0, '2013-08-26 11:13:10', '0000-00-00 00:00:00'),
(15, 'Search Filter', 'E', 'leftbar-filter', '', 0, '2013-09-03 09:37:56', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `front_layout`
--

DROP TABLE IF EXISTS `front_layout`;
CREATE TABLE IF NOT EXISTS `front_layout` (
  `front_layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `front_layout_name` varchar(200) NOT NULL COMMENT 'Name of pags like Home, category, products, about us, contact us',
  `front_layout_route` varchar(200) NOT NULL,
  `front_layout_status` tinyint(1) NOT NULL COMMENT '0 enabled and 1 disabled',
  `front_layout_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`front_layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='front layout table to be used to customize front side pages of site';

--
-- Truncate table before insert `front_layout`
--

TRUNCATE TABLE `front_layout`;
-- --------------------------------------------------------

--
-- Table structure for table `front_menu`
--

DROP TABLE IF EXISTS `front_menu`;
CREATE TABLE IF NOT EXISTS `front_menu` (
  `front_menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `front_menu_name` varchar(255) DEFAULT NULL,
  `front_menu_item_type` varchar(100) DEFAULT NULL COMMENT 'type of page menu item contains like Product Category or Article',
  `front_hook_alias` varchar(200) DEFAULT NULL COMMENT 'name of controller class',
  `front_menu_type_id` int(11) DEFAULT NULL COMMENT 'id from menu_type table',
  `front_menu_table_name` varchar(100) DEFAULT NULL COMMENT 'table name of selected page',
  `front_menu_table_field_name` varchar(100) DEFAULT NULL COMMENT 'primary key field name of table specified',
  `front_menu_primary_id` int(11) DEFAULT NULL COMMENT 'primary id of table record selected',
  `fm_static_url_restapp` varchar(300) DEFAULT NULL,
  `fm_parent_id` int(11) DEFAULT NULL,
  `fm_icon` mediumtext,
  `image_size_id` int(11) DEFAULT '4',
  `custom_page_title` varchar(200) DEFAULT NULL,
  `meta_keyword` mediumtext,
  `meta_description` mediumtext,
  `robots` int(11) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `content_rights` varchar(200) DEFAULT NULL,
  `fm_sort_order` int(11) DEFAULT NULL,
  `is_display` tinyint(1) DEFAULT NULL COMMENT 'is display 0 = all, 1 = desktop, 2 = mobile',
  `fm_status` int(11) DEFAULT NULL,
  `fm_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fm_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`front_menu_id`),
  KEY `InFrontMenuTypeID` (`front_menu_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='create front side menu dynamically';

--
-- Truncate table before insert `front_menu`
--

TRUNCATE TABLE `front_menu`;
--
-- Dumping data for table `front_menu`
--

INSERT INTO `front_menu` (`front_menu_id`, `front_menu_name`, `front_menu_item_type`, `front_hook_alias`, `front_menu_type_id`, `front_menu_table_name`, `front_menu_table_field_name`, `front_menu_primary_id`, `fm_static_url_restapp`, `fm_parent_id`, `fm_icon`, `image_size_id`, `custom_page_title`, `meta_keyword`, `meta_description`, `robots`, `author`, `content_rights`, `fm_sort_order`, `is_display`, `fm_status`, `fm_created_date`, `fm_modified_date`) VALUES
(1, 'Microsoft', 'Product Category', 'products', 1, 'product_categories', 'category_id', 1, '', 0, 'assets/front_menu/microsoft_PNG142046524912_s.png', 3, '', '', '', 1, '', '', 1, 0, 0, '2018-01-17 10:49:04', '2018-01-17 10:49:04'),
(2, 'Microsoft Excel', 'Product Category', 'products', 1, 'product_categories', 'category_id', 2, '', 1, 'assets/front_menu/Excel-icon634469054_s.png', 3, '', '', '', 1, '', '', 1, 0, 0, '2018-01-17 10:49:36', '2018-01-17 10:49:36'),
(3, 'Microsoft Word', 'Product Category', 'products', 1, 'product_categories', 'category_id', 3, '', 1, 'assets/front_menu/Microsoft_Word_logo1957248020_s.png', 3, '', '', '', 1, '', '', 5, 0, 0, '2018-01-17 10:49:59', '2018-01-17 10:49:59'),
(4, 'Microsoft Power Point', 'Product Category', 'products', 1, 'product_categories', 'category_id', 4, '', 1, 'assets/front_menu/ms_powerpoint_logo16001402922677_s.png', 0, '', '', '', 1, '', '', 10, 0, 0, '2018-01-17 10:50:25', '2018-01-17 10:50:25'),
(5, 'Internet', 'Product Category', 'products', 1, 'product_categories', 'category_id', 5, '', 0, 'assets/front_menu/internet_connection770020937_s.jpg', 3, '', '', '', 1, '', '', 5, 0, 0, '2018-01-17 10:50:45', '2018-02-08 05:24:07'),
(6, 'Education', 'Product Category', 'products', 1, 'product_categories', 'category_id', 6, '', 0, 'assets/front_menu/education-transparent1129086842_s.jpg', 3, '', '', '', 1, '', '', 10, 0, 0, '2018-01-17 10:51:03', '2018-01-17 10:51:03'),
(7, 'Computer', 'Product Category', 'products', 1, 'product_categories', 'category_id', 7, '', 0, 'assets/front_menu/computer-pc-picture906513025_s.jpg', 3, '', '', '', 1, '', '', 15, 0, 0, '2018-01-17 10:51:35', '2018-01-17 10:51:35'),
(8, 'GA/GK', 'Product Category', 'products', 1, 'product_categories', 'category_id', 8, '', 0, 'assets/front_menu/Tsr_logo_GK182177369_s.png', 3, '', '', '', 1, '', '', 25, 0, 0, '2018-01-17 10:52:19', '2018-01-17 10:53:04'),
(9, 'Health', 'Product Category', 'products', 1, 'product_categories', 'category_id', 9, '', 0, 'assets/front_menu/Heart-Health156947846_s.jpg', 3, '', '', '', 1, '', '', 20, 0, 0, '2018-01-17 10:52:40', '2018-01-17 10:52:40'),
(10, 'All', 'Product Category', 'products', 1, 'product_categories', 'category_id', 1, '', 1, 'assets/front_menu/microsoft_PNG14973631200_s.png', 4, '', '', '', 1, '', '', 15, 0, 0, '2018-02-08 05:19:12', '2018-02-08 05:19:12'),
(11, 'All', 'Product Category', 'products', 1, 'product_categories', 'category_id', 5, '', 5, 'assets/front_menu/internet_connection1602715316_s.jpg', 4, '', '', '', 1, '', '', 1, 0, 0, '2018-02-08 05:19:40', '2018-02-08 05:19:40'),
(12, 'All', 'Product Category', 'products', 1, 'product_categories', 'category_id', 6, '', 6, 'assets/front_menu/education-transparent319121620_s.jpg', 4, '', '', '', 1, '', '', 100, 0, 0, '2018-02-08 05:20:03', '2018-03-28 16:47:39'),
(13, 'All', 'Product Category', 'products', 1, 'product_categories', 'category_id', 7, '', 7, 'assets/front_menu/computer-pc-picture864566379_s.jpg', 0, '', '', '', 1, '', '', 1, 0, 0, '2018-02-08 05:20:24', '2018-02-08 05:20:24'),
(14, 'All', 'Product Category', 'products', 1, 'product_categories', 'category_id', 8, '', 8, 'assets/front_menu/Tsr_logo_GK1985117340_s.png', 4, '', '', '', 1, '', '', 1, 0, 0, '2018-02-08 05:20:45', '2018-02-08 05:20:45'),
(15, 'All', 'Product Category', 'products', 1, 'product_categories', 'category_id', 9, '', 9, 'assets/front_menu/Heart-Health328192512_s.jpg', 4, '', '', '', 1, '', '', 1, 0, 0, '2018-02-08 05:21:05', '2018-02-08 05:21:05'),
(16, 'Blog', 'Product Category', 'products', 1, 'product_categories', 'category_id', 11, '', 0, 'assets/front_menu/blog-icon245526494_s.png', 4, '', '', '', 1, '', '', 30, 0, 0, '2018-03-20 17:16:21', '2018-03-20 17:16:39'),
(17, 'All', 'Product Category', 'products', 1, 'product_categories', 'category_id', 11, '', 16, 'assets/front_menu/blog-icon694874818_s.png', 3, '', '', '', 1, '', '', 1, 0, 0, '2018-03-20 17:17:10', '2018-03-28 16:29:00'),
(18, 'HTML', 'Product Category', 'products', 1, 'product_categories', 'category_id', 12, '', 6, 'assets/front_menu/html1459897924_s.jpg', 4, '', '', '', 1, '', '', 1, 0, 0, '2018-03-23 16:39:37', '2018-03-23 16:39:37'),
(19, 'Make Money', 'Product Category', 'products', 1, 'product_categories', 'category_id', 13, '', 0, 'assets/front_menu/download237928495_s.png', 4, '', 'Make Money', 'Make Money', 1, 'watch2earn', 'watch2earn', 35, 0, 0, '2018-03-30 16:32:34', '2018-03-30 16:45:56'),
(21, 'All', 'Product Category', 'products', 1, 'product_categories', 'category_id', 13, '', 19, 'assets/front_menu/download1951451186_s.png', 4, '', '', '', 1, '', '', 1, 0, 0, '2018-03-30 16:48:27', '2018-03-30 16:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `front_menu_cctld`
--

DROP TABLE IF EXISTS `front_menu_cctld`;
CREATE TABLE IF NOT EXISTS `front_menu_cctld` (
  `front_menu_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL,
  `front_menu_id` int(11) NOT NULL,
  `front_menu_name` varchar(255) NOT NULL,
  `fm_icon` mediumtext NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `custom_page_title` varchar(255) NOT NULL,
  `meta_keyword` mediumtext NOT NULL,
  `meta_description` mediumtext NOT NULL,
  `robots` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content_rights` varchar(255) NOT NULL,
  `fm_sort_order` int(11) NOT NULL,
  `fm_status` tinyint(4) NOT NULL,
  `fmc_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fmc_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`front_menu_cctld_id`),
  UNIQUE KEY `UnManufIDFrontMenID` (`manufacturer_id`,`front_menu_id`),
  KEY `FK_fmc_front_menu_id` (`front_menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `front_menu_cctld`
--

TRUNCATE TABLE `front_menu_cctld`;
--
-- Dumping data for table `front_menu_cctld`
--

INSERT INTO `front_menu_cctld` (`front_menu_cctld_id`, `manufacturer_id`, `front_menu_id`, `front_menu_name`, `fm_icon`, `image_size_id`, `custom_page_title`, `meta_keyword`, `meta_description`, `robots`, `author`, `content_rights`, `fm_sort_order`, `fm_status`, `fmc_created_date`, `fmc_modified_date`) VALUES
(1, 8, 1, 'Microsoft', 'assets/front_menu/microsoft_PNG142046524912_s.png', 3, '', '', '', 1, '', '', 1, 0, '2018-01-17 10:49:04', '2018-01-17 10:49:04'),
(2, 9, 1, 'Microsoft', 'assets/front_menu/microsoft_PNG142046524912_s.png', 3, '', '', '', 1, '', '', 1, 0, '2018-01-17 10:49:04', '2018-01-17 10:49:04'),
(3, 8, 2, 'Microsoft Excel', 'assets/front_menu/Excel-icon634469054_s.png', 3, '', '', '', 1, '', '', 1, 0, '2018-01-17 10:49:36', '2018-01-17 10:49:36'),
(4, 9, 2, 'Microsoft Excel', 'assets/front_menu/Excel-icon634469054_s.png', 3, '', '', '', 1, '', '', 1, 0, '2018-01-17 10:49:36', '2018-01-17 10:49:36'),
(5, 8, 3, 'Microsoft Word', 'assets/front_menu/Microsoft_Word_logo1957248020_s.png', 3, '', '', '', 1, '', '', 5, 0, '2018-01-17 10:49:59', '2018-01-17 10:49:59'),
(6, 9, 3, 'Microsoft Word', 'assets/front_menu/Microsoft_Word_logo1957248020_s.png', 3, '', '', '', 1, '', '', 5, 0, '2018-01-17 10:49:59', '2018-01-17 10:49:59'),
(7, 8, 4, 'Microsoft Power Point', 'assets/front_menu/ms_powerpoint_logo16001402922677_s.png', 0, '', '', '', 1, '', '', 10, 0, '2018-01-17 10:50:25', '2018-01-17 10:50:25'),
(8, 9, 4, 'Microsoft Power Point', 'assets/front_menu/ms_powerpoint_logo16001402922677_s.png', 0, '', '', '', 1, '', '', 10, 0, '2018-01-17 10:50:25', '2018-01-17 10:50:25'),
(9, 8, 5, 'Internet', 'assets/front_menu/internet_connection770020937_s.jpg', 3, '', '', '', 1, '', '', 5, 0, '2018-01-17 10:50:45', '2018-01-17 10:50:45'),
(10, 9, 5, 'Internet', 'assets/front_menu/internet_connection770020937_s.jpg', 3, '', '', '', 1, '', '', 5, 0, '2018-01-17 10:50:45', '2018-01-17 10:50:45'),
(11, 8, 6, 'Education', 'assets/front_menu/education-transparent1129086842_s.jpg', 3, '', '', '', 1, '', '', 10, 0, '2018-01-17 10:51:03', '2018-01-17 10:51:03'),
(12, 9, 6, 'Education', 'assets/front_menu/education-transparent1129086842_s.jpg', 3, '', '', '', 1, '', '', 10, 0, '2018-01-17 10:51:03', '2018-01-17 10:51:03'),
(13, 8, 7, 'Computer', 'assets/front_menu/computer-pc-picture906513025_s.jpg', 3, '', '', '', 1, '', '', 15, 0, '2018-01-17 10:51:35', '2018-01-17 10:51:35'),
(14, 9, 7, 'Computer', 'assets/front_menu/computer-pc-picture906513025_s.jpg', 3, '', '', '', 1, '', '', 15, 0, '2018-01-17 10:51:35', '2018-01-17 10:51:35'),
(15, 8, 8, 'GA/GK', 'assets/front_menu/Tsr_logo_GK182177369_s.png', 3, '', '', '', 1, '', '', 15, 0, '2018-01-17 10:52:20', '2018-01-17 10:52:20'),
(16, 9, 8, 'GA/GK', 'assets/front_menu/Tsr_logo_GK182177369_s.png', 3, '', '', '', 1, '', '', 15, 0, '2018-01-17 10:52:20', '2018-01-17 10:52:20'),
(17, 8, 9, 'Health', 'assets/front_menu/Heart-Health156947846_s.jpg', 3, '', '', '', 1, '', '', 20, 0, '2018-01-17 10:52:40', '2018-01-17 10:52:40'),
(18, 9, 9, 'Health', 'assets/front_menu/Heart-Health156947846_s.jpg', 3, '', '', '', 1, '', '', 20, 0, '2018-01-17 10:52:40', '2018-01-17 10:52:40'),
(19, 8, 10, 'All', 'assets/front_menu/microsoft_PNG14973631200_s.png', 4, '', '', '', 1, '', '', 15, 0, '2018-02-08 05:19:12', '2018-02-08 05:19:12'),
(20, 9, 10, 'All', 'assets/front_menu/microsoft_PNG14973631200_s.png', 4, '', '', '', 1, '', '', 15, 0, '2018-02-08 05:19:12', '2018-02-08 05:19:12'),
(21, 8, 11, 'All', 'assets/front_menu/internet_connection1602715316_s.jpg', 4, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:19:40', '2018-02-08 05:19:40'),
(22, 9, 11, 'All', 'assets/front_menu/internet_connection1602715316_s.jpg', 4, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:19:40', '2018-02-08 05:19:40'),
(23, 8, 12, 'All', 'assets/front_menu/education-transparent319121620_s.jpg', 4, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:20:03', '2018-02-08 05:20:03'),
(24, 9, 12, 'All', 'assets/front_menu/education-transparent319121620_s.jpg', 4, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:20:03', '2018-02-08 05:20:03'),
(25, 8, 13, 'All', 'assets/front_menu/computer-pc-picture864566379_s.jpg', 0, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:20:24', '2018-02-08 05:20:24'),
(26, 9, 13, 'All', 'assets/front_menu/computer-pc-picture864566379_s.jpg', 0, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:20:24', '2018-02-08 05:20:24'),
(27, 8, 14, 'All', 'assets/front_menu/Tsr_logo_GK1985117340_s.png', 4, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:20:45', '2018-02-08 05:20:45'),
(28, 9, 14, 'All', 'assets/front_menu/Tsr_logo_GK1985117340_s.png', 4, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:20:45', '2018-02-08 05:20:45'),
(29, 8, 15, 'All', 'assets/front_menu/Heart-Health328192512_s.jpg', 4, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:21:06', '2018-02-08 05:21:06'),
(30, 9, 15, 'All', 'assets/front_menu/Heart-Health328192512_s.jpg', 4, '', '', '', 1, '', '', 1, 0, '2018-02-08 05:21:06', '2018-02-08 05:21:06'),
(31, 8, 16, 'Blog', 'assets/front_menu/blog-icon245526494_s.png', 4, '', '', '', 1, '', '', 0, 0, '2018-03-20 17:16:21', '2018-03-20 17:16:21'),
(32, 9, 16, 'Blog', 'assets/front_menu/blog-icon245526494_s.png', 4, '', '', '', 1, '', '', 0, 0, '2018-03-20 17:16:21', '2018-03-20 17:16:21'),
(33, 8, 17, 'All', 'assets/front_menu/blog-icon694874818_s.png', 3, '', '', '', 1, '', '', 0, 0, '2018-03-20 17:17:10', '2018-03-20 17:17:10'),
(34, 9, 17, 'All', 'assets/front_menu/blog-icon694874818_s.png', 3, '', '', '', 1, '', '', 0, 0, '2018-03-20 17:17:10', '2018-03-20 17:17:10'),
(35, 8, 18, 'HTML', 'assets/front_menu/html1459897924_s.jpg', 4, '', '', '', 1, '', '', 1, 0, '2018-03-23 16:39:37', '2018-03-23 16:39:37'),
(36, 9, 18, 'HTML', 'assets/front_menu/html1459897924_s.jpg', 4, '', '', '', 1, '', '', 1, 0, '2018-03-23 16:39:37', '2018-03-23 16:39:37'),
(37, 8, 19, 'Make Money', 'assets/front_menu/download237928495_s.png', 4, 'Make Money', 'Make Money', 'Make Money', 1, 'watch2earn', 'watch2earn', 35, 0, '2018-03-30 16:32:34', '2018-03-30 16:32:34'),
(38, 9, 19, 'Make Money', 'assets/front_menu/download237928495_s.png', 4, 'Make Money', 'Make Money', 'Make Money', 1, 'watch2earn', 'watch2earn', 35, 0, '2018-03-30 16:32:34', '2018-03-30 16:32:34'),
(41, 8, 21, 'All', 'assets/front_menu/download1951451186_s.png', 4, '', '', '', 1, '', '', 1, 0, '2018-03-30 16:48:27', '2018-03-30 16:48:27'),
(42, 9, 21, 'All', 'assets/front_menu/download1951451186_s.png', 4, '', '', '', 1, '', '', 1, 0, '2018-03-30 16:48:27', '2018-03-30 16:48:27');

-- --------------------------------------------------------

--
-- Table structure for table `front_menu_type`
--

DROP TABLE IF EXISTS `front_menu_type`;
CREATE TABLE IF NOT EXISTS `front_menu_type` (
  `front_menu_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `front_menu_type_name` varchar(100) NOT NULL COMMENT 'Specify type of menu horizontal,side menu etc',
  `fmt_desc` mediumtext NOT NULL,
  `fm_icon_is_display` tinyint(1) NOT NULL COMMENT '0 for display and 1 to not display',
  `fmt_status` tinyint(1) NOT NULL,
  `front_menu_type_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `front_menu_type_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`front_menu_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='specifies different type of front menu';

--
-- Truncate table before insert `front_menu_type`
--

TRUNCATE TABLE `front_menu_type`;
--
-- Dumping data for table `front_menu_type`
--

INSERT INTO `front_menu_type` (`front_menu_type_id`, `front_menu_type_name`, `fmt_desc`, `fm_icon_is_display`, `fmt_status`, `front_menu_type_created_date`, `front_menu_type_modified_date`) VALUES
(1, 'Video Main Menu', 'Main menu', 1, 0, '2015-03-19 16:06:02', '2018-01-17 16:08:15');

-- --------------------------------------------------------

--
-- Table structure for table `gift`
--

DROP TABLE IF EXISTS `gift`;
CREATE TABLE IF NOT EXISTS `gift` (
  `gift_id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_name` varchar(200) NOT NULL,
  `category_id` mediumtext NOT NULL,
  `gift_image` mediumtext NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `gift_description` mediumtext NOT NULL,
  `gift_status` int(11) NOT NULL,
  `gift_sort_order` int(11) NOT NULL COMMENT 'sort order in slide show',
  `gift_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gift_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `gift`
--

TRUNCATE TABLE `gift`;
-- --------------------------------------------------------

--
-- Table structure for table `image_size`
--

DROP TABLE IF EXISTS `image_size`;
CREATE TABLE IF NOT EXISTS `image_size` (
  `image_size_id` int(11) NOT NULL AUTO_INCREMENT,
  `image_size_width` varchar(200) NOT NULL COMMENT 'image width in drop down parameter  1(10x10)',
  `image_size_height` varchar(200) NOT NULL COMMENT 'image width in drop down parameter 2(10x10)',
  `image_size_status` int(11) NOT NULL,
  `image_size_sort_order` int(11) NOT NULL,
  `image_size_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_size_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `image_size`
--

TRUNCATE TABLE `image_size`;
--
-- Dumping data for table `image_size`
--

INSERT INTO `image_size` (`image_size_id`, `image_size_width`, `image_size_height`, `image_size_status`, `image_size_sort_order`, `image_size_created_date`, `image_size_modified_date`) VALUES
(1, '16', '16', 0, 1, '2013-07-16 17:39:32', '2013-08-16 14:40:33'),
(2, '32', '32', 0, 2, '2013-07-16 17:46:52', '2013-07-18 14:49:54'),
(3, '64', '64', 0, 3, '2013-07-16 18:28:05', '2013-08-16 14:40:42'),
(4, '200', '200', 0, 4, '2013-07-16 19:24:18', '2013-08-16 14:40:46'),
(5, '1002', '250', 0, 15, '2013-08-16 14:40:26', '2013-08-23 14:10:55'),
(6, '900', '900', 0, 10, '2015-03-30 15:46:29', '2018-01-16 10:49:41'),
(7, '370', '400', 0, 5, '2015-04-14 17:11:47', '2018-01-16 10:49:41'),
(8, '640', '426', 0, 6, '2018-01-17 10:50:48', '2018-01-17 10:50:48');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_master_specifier`
--

DROP TABLE IF EXISTS `inventory_master_specifier`;
CREATE TABLE IF NOT EXISTS `inventory_master_specifier` (
  `inventory_master_specifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `ims_input_type` varchar(10) NOT NULL COMMENT 'input types like text, radio, checkbox, drop down',
  `ims_tab_label` varchar(50) NOT NULL COMMENT 'label to show in tab',
  `ims_fieldset_label` varchar(50) NOT NULL COMMENT 'label to show in field set head',
  `ims_input_label` varchar(50) NOT NULL COMMENT 'label to show near input',
  `ims_default_value` varchar(300) NOT NULL COMMENT 'default value of attribute',
  `ims_input_validation` varchar(10) NOT NULL COMMENT 'like Decimal Number, Integer Number, Email, URL, Letters, Letters (a-z, A-Z) or Numbers (0-9)',
  `ims_is_use_in_search_filter` bit(1) NOT NULL COMMENT '1: Yes, 0: NO',
  `ims_is_use_in_compare` bit(1) NOT NULL COMMENT '1: Yes, 0: NO',
  `ims_sort_order` int(11) NOT NULL,
  `ims_status` tinyint(1) NOT NULL COMMENT '0: Enable , 1: Disable',
  `ims_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ims_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_master_specifier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='identify what kind of components or attributes or mix to use inventory type ';

--
-- Truncate table before insert `inventory_master_specifier`
--

TRUNCATE TABLE `inventory_master_specifier`;
-- --------------------------------------------------------

--
-- Table structure for table `inventory_master_specifier_cctld`
--

DROP TABLE IF EXISTS `inventory_master_specifier_cctld`;
CREATE TABLE IF NOT EXISTS `inventory_master_specifier_cctld` (
  `inventory_master_specifier_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'From 16-02-2015 this field is used as lang/country content identifire',
  `inventory_master_specifier_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_master_specifier table',
  `ims_input_label` varchar(50) NOT NULL COMMENT 'label to show near input',
  `ims_default_value` varchar(300) NOT NULL COMMENT 'default value of attribute',
  `ims_sort_order` int(11) NOT NULL,
  `ims_status` tinyint(1) NOT NULL COMMENT '0: Enable , 1: Disable',
  `imsc_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imsc_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_master_specifier_cctld_id`),
  UNIQUE KEY `UNManIDimsID` (`manufacturer_id`,`inventory_master_specifier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cctld of ims: identify what kind of components or attributes or mix to use inventory type ';

--
-- Truncate table before insert `inventory_master_specifier_cctld`
--

TRUNCATE TABLE `inventory_master_specifier_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `inventory_type`
--

DROP TABLE IF EXISTS `inventory_type`;
CREATE TABLE IF NOT EXISTS `inventory_type` (
  `inventory_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `it_name` varchar(30) NOT NULL,
  `it_key` varchar(10) NOT NULL COMMENT 'unique key',
  `it_status` tinyint(1) NOT NULL COMMENT '0: Enable , 1: Disable',
  `it_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `it_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`inventory_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='added on 23-02-2015 to support dynamic inventory.';

--
-- Truncate table before insert `inventory_type`
--

TRUNCATE TABLE `inventory_type`;
--
-- Dumping data for table `inventory_type`
--

INSERT INTO `inventory_type` (`inventory_type_id`, `it_name`, `it_key`, `it_status`, `it_created_date`, `it_modified_date`) VALUES
(1, 'Video Money', 'TT', 0, '2015-02-23 23:47:16', '2018-01-16 16:56:18'),
(2, 'Jewelry', 'JW', 1, '2015-02-23 23:47:16', '2018-01-16 10:49:42'),
(3, 'Grocery', 'GC', 1, '2015-02-23 23:47:16', '2018-01-16 10:49:42'),
(4, 'Electronics', 'EC', 1, '2015-02-23 23:47:16', '2015-06-03 15:24:36'),
(6, 'Home Decor', 'HD', 1, '2015-02-27 20:12:38', '2015-06-02 01:38:03'),
(7, 'Appliances', 'AP', 1, '2015-06-03 16:05:29', '2018-01-16 10:49:42');

-- --------------------------------------------------------

--
-- Table structure for table `ip_locations`
--

DROP TABLE IF EXISTS `ip_locations`;
CREATE TABLE IF NOT EXISTS `ip_locations` (
  `ip_locations_id` int(11) NOT NULL AUTO_INCREMENT,
  `il_ip` varchar(50) NOT NULL,
  `il_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `il_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip_locations_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `ip_locations`
--

TRUNCATE TABLE `ip_locations`;
-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(100) NOT NULL,
  `l_key` varchar(10) NOT NULL,
  `l_sort_order` int(11) NOT NULL,
  `l_status` tinyint(1) NOT NULL,
  `l_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `l_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`languages_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `languages`
--

TRUNCATE TABLE `languages`;
--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`languages_id`, `l_name`, `l_key`, `l_sort_order`, `l_status`, `l_created_date`, `l_modified_date`) VALUES
(3, 'aaa', 'AA', 2, 0, '2014-01-17 14:53:14', '2018-01-16 10:49:43'),
(4, 'English', 'EN_US', 1, 0, '2014-01-22 17:53:10', '2018-01-16 10:49:43'),
(5, 'Hindi', 'HI', 4, 0, '2014-01-22 17:53:44', '2018-01-16 10:49:43'),
(6, 'Gujarati', 'GU', 7, 0, '2014-01-22 17:54:17', '2018-01-16 10:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_group_key` varchar(50) NOT NULL COMMENT 'key of log group',
  `l_description` varchar(1000) NOT NULL,
  `l_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `log`
--

TRUNCATE TABLE `log`;
-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
CREATE TABLE IF NOT EXISTS `logins` (
  `logins_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_admin_user_id` int(11) NOT NULL,
  `sessions_id` int(11) DEFAULT NULL COMMENT 'from perrian sessions table',
  `session_id` varchar(128) DEFAULT NULL COMMENT 'session_id is assumed to be unique as provided by PHP core: deprecated',
  `l_user_type` varchar(1) NOT NULL COMMENT 'U for Customer-User and A for Admin',
  `l_user_agent` varchar(1000) NOT NULL,
  `l_user_device` varchar(100) NOT NULL,
  `l_session_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 exist and 0 expired',
  `l_reason_key` tinyint(4) DEFAULT NULL COMMENT 'reason id of session status : If session expired then why it was expired ==&gt; 0 : No reason and session is on 7==&gt; user has changed pass and log out from other devices  1 ==&gt; Simple log out 8 ==&gt; auto expire from cron script',
  `l_created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `l_modified_time` timestamp NOT NULL DEFAULT '1970-01-01 19:00:00',
  PRIMARY KEY (`logins_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='stores active and previous logins of admin and users';

--
-- Truncate table before insert `logins`
--

TRUNCATE TABLE `logins`;
--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`logins_id`, `cust_admin_user_id`, `sessions_id`, `session_id`, `l_user_type`, `l_user_agent`, `l_user_device`, `l_session_status`, `l_reason_key`, `l_created_time`, `l_modified_time`) VALUES
(1, 5, 2, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 0, 1, '2021-03-19 15:56:11', '2021-03-19 15:58:12'),
(2, 5, 3, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 0, 1, '2021-03-19 15:58:29', '2021-03-19 17:37:50'),
(3, 2, 4, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-19 17:38:22', '1970-01-01 19:00:00'),
(4, 2, 5, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-19 17:39:17', '1970-01-01 19:00:00'),
(5, 1, 6, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-19 17:39:46', '1970-01-01 19:00:00'),
(6, 2, 7, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-20 16:48:25', '1970-01-01 19:00:00'),
(7, 2, 8, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-21 07:22:17', '1970-01-01 19:00:00'),
(8, 1, 9, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 0, 1, '2021-03-21 07:26:31', '2021-03-21 07:30:39'),
(9, 2, 10, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 0, 1, '2021-03-21 07:30:48', '2021-03-21 08:47:25'),
(10, 1, 11, NULL, 'A', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 0, 1, '2021-03-21 08:47:36', '2021-03-21 09:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `login_ip`
--

DROP TABLE IF EXISTS `login_ip`;
CREATE TABLE IF NOT EXISTS `login_ip` (
  `login_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_admin_user_id` int(11) NOT NULL,
  `sessions_id` int(11) NOT NULL COMMENT 'from perrian sessions table',
  `session_id` varchar(50) DEFAULT NULL COMMENT 'deprecated',
  `li_user_type` varchar(1) DEFAULT NULL COMMENT 'U for Customer-User and A for Admin',
  `li_ip` varchar(50) DEFAULT NULL,
  `li_user_agent` varchar(255) DEFAULT NULL,
  `li_user_device` varchar(100) DEFAULT NULL,
  `li_relevancy_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'relevancy in context of location : 1==&gt; Okay, 2==&gt;abnormal, 3==&gt; strange',
  `li_original_user_response` tinyint(1) DEFAULT NULL COMMENT 'user response if in case some one has accessed account or it was user : timny int contain key/id for response subject 0==&gt; No reason no response',
  `li_created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `li_modified_time` timestamp NOT NULL DEFAULT '1970-01-01 19:00:00',
  PRIMARY KEY (`login_ip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `login_ip`
--

TRUNCATE TABLE `login_ip`;
--
-- Dumping data for table `login_ip`
--

INSERT INTO `login_ip` (`login_ip_id`, `cust_admin_user_id`, `sessions_id`, `session_id`, `li_user_type`, `li_ip`, `li_user_agent`, `li_user_device`, `li_relevancy_level`, `li_original_user_response`, `li_created_time`, `li_modified_time`) VALUES
(1, 5, 2, '2', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-19 15:56:11', '1970-01-01 19:00:00'),
(2, 5, 3, '3', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-19 15:58:29', '1970-01-01 19:00:00'),
(3, 2, 4, '4', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-19 17:38:22', '1970-01-01 19:00:00'),
(4, 2, 5, '5', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-19 17:39:17', '1970-01-01 19:00:00'),
(5, 1, 6, '6', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-19 17:39:46', '1970-01-01 19:00:00'),
(6, 2, 7, '7', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-20 16:48:25', '1970-01-01 19:00:00'),
(7, 2, 8, '8', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-21 07:22:17', '1970-01-01 19:00:00'),
(8, 1, 9, '9', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-21 07:26:31', '1970-01-01 19:00:00'),
(9, 2, 10, '10', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-21 07:30:48', '1970-01-01 19:00:00'),
(10, 1, 11, '11', 'A', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '', 1, NULL, '2021-03-21 08:47:36', '1970-01-01 19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `mail_templates`
--

DROP TABLE IF EXISTS `mail_templates`;
CREATE TABLE IF NOT EXISTS `mail_templates` (
  `template_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `template_key` varchar(100) NOT NULL COMMENT 'Template key for developer user where we want to user this template',
  `template_name` varchar(150) NOT NULL COMMENT 'Template name should be editable by admin',
  `template_content` mediumtext NOT NULL COMMENT 'Template content with prasing texts in {keyword}',
  `template_subject` varchar(150) NOT NULL COMMENT 'subject you want to send in mail',
  `template_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1-deleted , o-use',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'created date.',
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Last modification date',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `mail_templates`
--

TRUNCATE TABLE `mail_templates`;
-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'From 16-02-2015 this field is used as lang/country content identifire',
  `manufacturer_name` varchar(100) NOT NULL COMMENT 'From 16-02-2015 this field is used as lang/country content identifire. Will hold language name, no other configuration is aplicable except language key and name',
  `manufacturer_key` varchar(100) NOT NULL COMMENT 'Will hold language key, no other configuration is aplicable except language key and name',
  `manufacturer_cctld` varchar(100) NOT NULL,
  `manufacturer_email_id` varchar(255) NOT NULL,
  `manufacturer_xmpp_id` varchar(255) NOT NULL,
  `manufacturer_image` mediumtext,
  `image_size_id` int(11) NOT NULL,
  `manufacturer_status` int(11) NOT NULL,
  `custom_page_title` varchar(200) NOT NULL,
  `meta_keyword` mediumtext,
  `meta_description` mediumtext,
  `author` varchar(200) DEFAULT NULL,
  `robots` int(11) DEFAULT NULL,
  `content_rights` varchar(200) DEFAULT NULL,
  `manufacturer_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `manufacturer_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='From 16-02-2015 used as language table(country content)';

--
-- Truncate table before insert `manufacturer`
--

TRUNCATE TABLE `manufacturer`;
--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `manufacturer_name`, `manufacturer_key`, `manufacturer_cctld`, `manufacturer_email_id`, `manufacturer_xmpp_id`, `manufacturer_image`, `image_size_id`, `manufacturer_status`, `custom_page_title`, `meta_keyword`, `meta_description`, `author`, `robots`, `content_rights`, `manufacturer_created_date`, `manufacturer_modified_date`) VALUES
(7, 'English', 'EN_US', '', '', '', 'assets/manufacturer/login_logo1965707144_m.png', 0, 0, 'HSquare', '', '', '', 2, '', '2013-09-30 05:15:17', '2014-11-24 18:54:37'),
(8, 'Hindi', 'HI', '', 'test@gmail.com', '', 'assets/manufacturer/login_logo1965707144_m.png', 0, 0, '', NULL, NULL, NULL, NULL, NULL, '2015-01-03 00:06:03', '2018-01-16 10:49:44'),
(9, 'Gujarati', 'GU', '', '', '', 'assets/manufacturer/login_logo1965707144_m.png', 0, 0, 'en-US', 'en-US', 'en-US', '', 2, '', '2013-09-30 05:15:17', '2015-03-26 19:42:29');

-- --------------------------------------------------------

--
-- Table structure for table `metal_color`
--

DROP TABLE IF EXISTS `metal_color`;
CREATE TABLE IF NOT EXISTS `metal_color` (
  `metal_color_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `metal_color_name` varchar(20) NOT NULL COMMENT 'name like yellow. rose, white etc',
  `metal_color_key` varchar(200) NOT NULL,
  `metal_color_icon` mediumtext NOT NULL,
  `image_size_id` int(5) NOT NULL,
  `metal_color_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 enabled, 1 disabled',
  `metal_color_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `metal_color_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`metal_color_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `metal_color`
--

TRUNCATE TABLE `metal_color`;
-- --------------------------------------------------------

--
-- Table structure for table `metal_price`
--

DROP TABLE IF EXISTS `metal_price`;
CREATE TABLE IF NOT EXISTS `metal_price` (
  `metal_price_id` int(11) NOT NULL,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `mp_manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `metal_purity_id` int(11) NOT NULL COMMENT 'metal purity id from metal purity table',
  `metal_color_id` int(11) NOT NULL COMMENT 'metal color id from metal color table',
  `metal_type_id` int(11) NOT NULL COMMENT 'metal type id from metal type table',
  `metal_price_labour_charge` varchar(20) NOT NULL COMMENT 'labour charge to be added on diamond price',
  `mp_difference` varchar(20) NOT NULL COMMENT 'metal price difference according to purity, always in (%)',
  `mp_price_difference` varchar(20) NOT NULL COMMENT 'calculate different as per (%) specified in mp_difference field and store here, no input taken directly from use for this field : Change Actual calulated price stored in this table',
  `mp_icon` mediumtext NOT NULL COMMENT 'link of icon',
  `mp_desc` mediumtext COMMENT 'metal description',
  `mp_sort_order` int(11) NOT NULL,
  `metal_price_status` tinyint(1) NOT NULL DEFAULT '0',
  `mp_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mp_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `metal_price`
--

TRUNCATE TABLE `metal_price`;
-- --------------------------------------------------------

--
-- Table structure for table `metal_purity`
--

DROP TABLE IF EXISTS `metal_purity`;
CREATE TABLE IF NOT EXISTS `metal_purity` (
  `metal_purity_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `metal_purity_name` varchar(20) NOT NULL COMMENT '10K, 14K, 18K',
  `metal_purity_key` varchar(30) NOT NULL,
  `metal_purity_sort_order` int(11) NOT NULL,
  `metal_purity_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 enabled, 1 disabled',
  `metal_purity_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `metal_purity_modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`metal_purity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `metal_purity`
--

TRUNCATE TABLE `metal_purity`;
-- --------------------------------------------------------

--
-- Table structure for table `metal_type`
--

DROP TABLE IF EXISTS `metal_type`;
CREATE TABLE IF NOT EXISTS `metal_type` (
  `metal_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `metal_type_name` varchar(30) NOT NULL COMMENT 'metal type name like gold, silver and platinum etc',
  `metal_type_key` varchar(30) NOT NULL,
  `metal_type_price` varchar(10) NOT NULL COMMENT 'metal price. eg.gold,silver price',
  `metal_type_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 enabled, 1 disabled',
  `mt_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mt_modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`metal_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='types of metal like gold, silver and platinum etc';

--
-- Truncate table before insert `metal_type`
--

TRUNCATE TABLE `metal_type`;
-- --------------------------------------------------------

--
-- Table structure for table `module_manager`
--

DROP TABLE IF EXISTS `module_manager`;
CREATE TABLE IF NOT EXISTS `module_manager` (
  `module_manager_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_manager_title` varchar(255) NOT NULL,
  `module_manager_table_name` varchar(100) NOT NULL COMMENT 'table name of related module banner,article,menu,filter etc',
  `module_manager_field_name` varchar(100) NOT NULL COMMENT 'field name of primary field',
  `module_manager_primary_id` varchar(100) NOT NULL,
  `position_id` int(11) NOT NULL,
  `module_manager_title_show_hide` int(11) NOT NULL,
  `module_manager_serialize_menu` mediumtext NOT NULL COMMENT 'stores array of menu selected',
  `module_manager_description` mediumtext NOT NULL,
  `module_manager_css` mediumtext NOT NULL COMMENT 'css to be applied to module div',
  `module_manager_sort_order` int(11) NOT NULL,
  `module_manager_status` tinyint(1) NOT NULL COMMENT '0 published and 1 unpublished',
  `module_manager_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `module_manager_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`module_manager_id`),
  KEY `InPosID` (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='module manager in front side design';

--
-- Truncate table before insert `module_manager`
--

TRUNCATE TABLE `module_manager`;
--
-- Dumping data for table `module_manager`
--

INSERT INTO `module_manager` (`module_manager_id`, `module_manager_title`, `module_manager_table_name`, `module_manager_field_name`, `module_manager_primary_id`, `position_id`, `module_manager_title_show_hide`, `module_manager_serialize_menu`, `module_manager_description`, `module_manager_css`, `module_manager_sort_order`, `module_manager_status`, `module_manager_created_date`, `module_manager_modified_date`) VALUES
(1, 'Video Main Menu', 'front_menu_type', 'front_menu_type_id', '1', 7, 1, 'a:0:{}', '', '', 1, 0, '2015-03-19 05:06:17', '2017-12-26 06:10:14');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL DEFAULT '7',
  `admin_user_id` int(11) NOT NULL DEFAULT '5',
  `customer_id` int(11) NOT NULL DEFAULT '1',
  `invoice_number` varchar(255) DEFAULT NULL,
  `order_total_qty` varchar(20) DEFAULT NULL,
  `order_subtotal_amt` varchar(20) DEFAULT NULL,
  `order_discount_amount` varchar(20) DEFAULT NULL,
  `order_tax_percent` varchar(20) DEFAULT NULL,
  `order_tax_amt` varchar(20) DEFAULT NULL,
  `order_total_amt` varchar(20) DEFAULT NULL,
  `customer_shipping_address_id` int(11) DEFAULT NULL,
  `customer_billing_address_id` int(11) DEFAULT NULL,
  `shipping_method_id` int(11) DEFAULT NULL,
  `card_account_number` int(11) DEFAULT NULL,
  `customer_note` varchar(1000) DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `del_in` tinyint(1) NOT NULL DEFAULT '0',
  `order_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_modified_date` timestamp NOT NULL DEFAULT '1970-01-01 19:00:00',
  PRIMARY KEY (`order_id`),
  KEY `InCusID` (`customer_id`),
  KEY `InCusShipAddrID` (`customer_shipping_address_id`),
  KEY `InCusBillAddrID` (`customer_billing_address_id`),
  KEY `InShipMethID` (`shipping_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `orders`
--

TRUNCATE TABLE `orders`;
-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_account_manage_id` int(11) DEFAULT NULL,
  `product_generate_code` varchar(100) DEFAULT NULL,
  `product_final_weight` double DEFAULT NULL,
  `product_price_id` int(11) DEFAULT NULL,
  `product_type` varchar(5) DEFAULT NULL,
  `order_details_product_qty` double DEFAULT NULL,
  `order_details_product_tax` varchar(20) DEFAULT NULL,
  `order_details_vat` double DEFAULT NULL,
  `order_details_product_price` varchar(20) DEFAULT NULL,
  `order_details_product_discount` varchar(20) DEFAULT NULL,
  `order_details_amt` double DEFAULT NULL,
  `order_details_is_returned` tinyint(1) NOT NULL DEFAULT '0',
  `order_details_return_quantity` varchar(20) DEFAULT NULL,
  `order_details_status` tinyint(1) DEFAULT NULL,
  `order_details_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_details_modified_date` timestamp NOT NULL DEFAULT '1970-01-01 19:00:00',
  PRIMARY KEY (`order_details_id`),
  KEY `InOrderID` (`order_id`),
  KEY `InProID` (`product_id`),
  KEY `InProPriceID` (`product_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `order_details`
--

TRUNCATE TABLE `order_details`;
-- --------------------------------------------------------

--
-- Table structure for table `order_return`
--

DROP TABLE IF EXISTS `order_return`;
CREATE TABLE IF NOT EXISTS `order_return` (
  `order_return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `order_return_quantity` double NOT NULL DEFAULT '0' COMMENT 'quantity returned, changed to douible on 6-03-2015 to support warehouse features',
  `order_return_reason_key` varchar(200) NOT NULL COMMENT 'key stored in configuration',
  `order_return_opened_unopened` varchar(1) NOT NULL COMMENT 'specify if product returned by customer is opened or unopenned',
  `order_return_comment` mediumtext NOT NULL,
  `order_return_action` varchar(1) NOT NULL COMMENT '''C'' --&gt; for credit issued, ''R'' --&gt; for refunded and ''S'' --&gt; for replacement sent',
  `order_status_id` int(11) NOT NULL,
  `order_return_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_return_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_return_id`),
  UNIQUE KEY `InOrderDtlID` (`order_details_id`),
  KEY `InOrderID` (`order_id`),
  KEY `FK_or_order_status_id` (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='used when user returns order';

--
-- Truncate table before insert `order_return`
--

TRUNCATE TABLE `order_return`;
-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_key` varchar(200) NOT NULL COMMENT 'for  fetch order status name',
  `order_status_name` mediumtext NOT NULL,
  `order_status_msg` varchar(300) NOT NULL COMMENT 'order status message for customer',
  `order_status_icon` mediumtext NOT NULL COMMENT 'image',
  `image_size_id` int(11) NOT NULL,
  `order_status_status` int(11) NOT NULL,
  `order_status_sort_order` int(11) NOT NULL,
  `order_status_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status_modified_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `order_status`
--

TRUNCATE TABLE `order_status`;
--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `order_status_key`, `order_status_name`, `order_status_msg`, `order_status_icon`, `image_size_id`, `order_status_status`, `order_status_sort_order`, `order_status_created_date`, `order_status_modified_date`) VALUES
(1, 'ORDER_SHIPPED', 'Shipped', '', 'assets/order_status/Shipping-Icon-bigger30305347_s.gif', 0, 1, 14, '2013-07-05 20:19:28', '2015-04-18 20:37:01'),
(2, 'ORDER_COMPLETE', 'Complete', '', 'assets/order_status/ORDER_COMPLETE154436935_s.png', 0, 1, 15, '2013-07-05 20:19:28', '2015-04-18 20:37:14'),
(3, 'ORDER_CANCELED', 'Canceled', 'Your order {O_ID} has been cancelled.', 'assets/order_status/ORDER_CANCELED1035559389_s.png', 0, 1, 1, '2013-07-05 20:19:28', '2015-04-23 00:20:27'),
(4, 'ORDER_EXPIRED', 'Expired', '', 'assets/order_status/ORDER_EXPIRED1851241484_s.png', 0, 1, 1, '2013-07-05 20:19:28', '2015-04-18 20:37:49'),
(5, 'ORDER_FAILED', 'Failed', '', 'assets/order_status/ORDER_FAILED1403874158_s.png', 0, 0, 1, '2013-07-05 20:19:28', '2015-04-24 15:28:52'),
(6, 'ORDER_PENDING', 'Pending', '', 'assets/order_status/order_pending724348762_s.jpg', 0, 0, 4, '2013-07-05 20:19:28', '2015-04-24 15:30:34'),
(8, 'ORDER_PROCESSING', 'Processing', '', 'assets/order_status/ORDER_PROCESSING220267414_s.png', 0, 1, 0, '2013-07-05 20:19:28', '2015-04-18 20:38:56'),
(9, 'ORDER_PEFUNDED', 'Refunded', 'Your order {O_ID} has been Refunded.', 'assets/order_status/refund_icon1198214276_s.jpg', 0, 0, 0, '2013-07-05 20:19:28', '2015-04-23 00:30:22'),
(10, 'ORDER_DENIED', 'Denied', '', 'assets/order_status/Lighthouse1373693052_s.jpg', 0, 1, 0, '2013-07-05 20:19:28', '2013-07-13 10:54:12'),
(11, 'ORDER_DELIVERED', 'Delivered', 'Your Order has been delivered.', 'assets/order_status/check-icon1279688613_s.png', 0, 0, 37, '2013-07-05 20:19:28', '2015-05-02 16:54:36'),
(12, 'ORDER_PAYMENT_ACCEPTED', 'Payment Accepted', '', 'assets/order_status/ORDER_PAYMENT_ACCEPTED1018427346_s.png', 0, 1, 0, '2013-07-05 20:19:28', '2015-04-18 20:42:20'),
(14, 'PAYMENT_APPROVED', 'Payment Approved', '', 'assets/order_status/PAYMENT_APPROVED1794092398_s.png', 1, 0, 13, '2013-10-03 15:13:32', '2015-04-24 15:30:54'),
(15, 'ORDER_MANUFACTURED', 'Product Manufacture', '', 'assets/order_status/Manufacture585353873_s.jpg', 1, 0, 16, '2013-10-03 15:13:58', '2015-04-24 15:31:58'),
(16, 'CERTIFICATION', 'Certification', '', 'assets/order_status/CERTIFICATION1262183679_s.png', 1, 0, 19, '2013-10-03 15:14:22', '2015-04-24 15:32:04'),
(17, 'PACKAGING', 'Packaging', '', 'assets/order_status/PACKAGING1502352501_s.png', 1, 0, 22, '2013-10-03 15:14:52', '2015-04-24 15:32:09'),
(18, 'YET_TO_SHIP', 'Shipping', 'Your order {O_ID} is shipped, will be delivered soon.', 'assets/order_status/shipping249670667_s.png', 1, 0, 25, '2013-10-03 15:15:42', '2015-04-24 15:33:45'),
(19, 'YET_TO_REACH_AT_HUB', 'Transport to hub', '', 'assets/order_status/transport1833953051_s.png', 0, 0, 28, '2013-10-03 15:24:43', '2015-04-24 15:39:46'),
(20, 'YET_TO_BE_DELIVERED', 'In Delivery', 'Your Order will be delivered soon.', 'assets/order_status/ORDER_DELIVERED447654155_s.png', 0, 0, 34, '2013-10-03 15:25:19', '2015-04-24 15:40:07'),
(21, 'COD_APPROVED', 'Payment recieved.', '', 'assets/order_status/01556560874_s.png', 0, 1, 31, '2013-10-07 12:07:21', '2013-10-18 13:18:04'),
(22, 'ORD_PLC', 'Order Placed', '', 'assets/order_status/placeholder1851643105_s.jpg', 0, 0, 7, '2013-10-12 10:32:31', '2015-04-24 15:40:14'),
(23, 'COD_MODE', 'COD', '', 'assets/order_status/cash_on_delivery1945460043_s.jpg', 0, 0, 10, '2013-10-18 13:12:26', '2015-06-02 15:35:00'),
(25, 'ORDER_REFUND_BUCKS', 'Refund Bucks', '', 'assets/order_status/REFUND_BUCKS1807201890_s.jpg', 0, 1, 0, '2015-04-25 17:41:07', '2015-04-25 17:42:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_transaction`
--

DROP TABLE IF EXISTS `order_transaction`;
CREATE TABLE IF NOT EXISTS `order_transaction` (
  `order_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL COMMENT 'transaction id specified by perrian does not apply to COD',
  `payment_method_id` int(11) NOT NULL COMMENT 'type of payment method used id of different gate ways Note:All COD transaction are handled by perrian and only COD mode and status is stored for COD transactions',
  `payment_mode` varchar(50) DEFAULT NULL COMMENT 'type of payment mode used by user when redirected to payment gateway i.e. Credit card, Debit card, Net banking etc Note: For COD transactions always key ''COD'' is stored as COD is handled by perrian not any gateway  payU: CC'' for credit-card / ''NB'' for net-banking / ''DC'' for debit card / ''COD'' for Cash on delivery/ ‘CASH’ for Cash Card',
  `currency_id` int(11) NOT NULL COMMENT 'currency in which payment was paid',
  `currency_value` double NOT NULL COMMENT 'currency_value used in all post order operations to compensate fractional changes in intternational currency values',
  `payment_status` varchar(50) DEFAULT NULL COMMENT '''S'' for success , ''E'' for failure and ''P'' for pending Note: for COD status changed when COD_APPROVE status specified by admin for particular order',
  `payment_gateway_transaction_id` varchar(255) DEFAULT NULL COMMENT 'at a time only one gateway payU is used so ID will be of payU only',
  `card_account_number` varchar(50) DEFAULT NULL COMMENT 'if applicable account number for net banking and card numbers when Credit card or debit card ued',
  `payment_response_msg` mediumtext COMMENT 'response msg success or failure whatever will be stored here',
  `pg_type` varchar(50) DEFAULT NULL COMMENT 'paymeny gateway type specified by payU actually it contains bank name',
  `bank_ref_num` varchar(255) DEFAULT NULL COMMENT 'stored if applicable bank ref number specified by payU',
  `error_code` varchar(255) DEFAULT NULL COMMENT 'stored if applicable on fail transactions as specified by payU ',
  `error_message` mediumtext COMMENT 'stored if applicable on fail transactions as specified by payU ',
  `order_transaction_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_transaction_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_transaction_id`),
  KEY `FK_ot_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all transactions begining from payment to refund etc. are stored in this table';

--
-- Truncate table before insert `order_transaction`
--

TRUNCATE TABLE `order_transaction`;
-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(200) NOT NULL COMMENT 'method name',
  `payment_method_key` varchar(200) NOT NULL,
  `payment_method_icon` mediumtext,
  `image_size_id` int(11) NOT NULL,
  `payment_method_description` mediumtext,
  `payment_method_sort_order` int(11) NOT NULL,
  `payment_method_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'o enable and 1 disable',
  `payment_method_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_method_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `payment_method`
--

TRUNCATE TABLE `payment_method`;
--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `payment_method_name`, `payment_method_key`, `payment_method_icon`, `image_size_id`, `payment_method_description`, `payment_method_sort_order`, `payment_method_status`, `payment_method_created_date`, `payment_method_modified_date`) VALUES
(1, 'PayPal', 'PAYPAL', 'assets/payment_method/Penguins2056205479_m.jpg', 2, 'ewfewfewf', 1, 0, '2013-07-17 17:37:18', '2013-10-29 12:18:30'),
(2, 'card', 'CARD', 'assets/payment_method/Penguins429067098_m.jpg', 1, 'few[few[,ffew', 2, 1, '2013-07-17 17:41:52', '2013-10-14 17:17:41'),
(4, 'Cash On Delivery', 'COD', 'assets/payment_method/Penguins323779624_m.jpg', 1, 'dwqdqdwqd', 3, 0, '2013-07-18 19:01:42', '2013-10-14 17:17:44'),
(5, 'payU', 'PAY_U', 'assets/payment_method/gift1895284602_m.png', 0, 'payyou.in gateway', 0, 0, '2013-10-18 16:24:29', '2018-01-16 10:49:47'),
(6, 'Credit Bucks', 'BUCKS', NULL, 0, NULL, 0, 0, '2014-05-19 15:28:15', '2018-01-16 10:49:47'),
(7, 'Paypal Pro', 'PAYPAL_PRO', 'assets/payment_method/Penguins2056205479_m.jpg', 2, 'Paypal Pro', 6, 0, '2014-08-28 10:57:20', '2018-01-16 10:49:47');

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_menu_id` int(11) NOT NULL,
  `admin_user_id` int(11) NOT NULL,
  `permission_add` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enabled and 1 disabled',
  `permission_edit` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enabled and 1 disabled',
  `permission_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enabled and 1 disabled',
  `permission_view` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 enabled and 1 disabled',
  `permission_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `permission_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `Un_user_menu_id` (`admin_menu_id`,`admin_user_id`),
  KEY `InAdMenuID` (`admin_menu_id`),
  KEY `InAdUserID` (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3502 DEFAULT CHARSET=utf8 COMMENT='permissions for admin menu';

--
-- Truncate table before insert `permission`
--

TRUNCATE TABLE `permission`;
--
-- Dumping data for table `permission`
--

INSERT INTO `permission` (`permission_id`, `admin_menu_id`, `admin_user_id`, `permission_add`, `permission_edit`, `permission_delete`, `permission_view`, `permission_created_date`, `permission_modified_date`) VALUES
(832, 2, 1, 0, 0, 0, 0, '2013-07-27 07:44:36', '2014-07-24 16:19:22'),
(837, 3, 1, 0, 0, 0, 0, '2013-07-27 09:47:39', '2014-07-24 16:19:22'),
(838, 4, 1, 0, 0, 0, 0, '2013-07-27 09:47:39', '2014-07-24 16:19:22'),
(839, 6, 1, 0, 0, 0, 0, '2013-07-27 09:47:39', '2014-05-22 07:25:01'),
(840, 7, 1, 0, 0, 0, 0, '2013-07-27 09:47:39', '2014-05-22 07:25:01'),
(844, 24, 1, 0, 0, 0, 0, '2013-07-27 09:47:39', '2015-04-23 15:58:04'),
(845, 29, 1, 0, 0, 0, 0, '2013-07-27 09:47:39', '2014-05-22 07:25:02'),
(847, 28, 1, 0, 0, 0, 0, '2013-07-27 09:47:39', '2014-05-22 07:25:02'),
(848, 31, 1, 0, 0, 0, 0, '2013-07-27 09:47:39', '2014-05-22 07:25:02'),
(854, 39, 1, 0, 0, 0, 0, '2013-07-27 09:47:40', '2014-05-22 07:25:02'),
(855, 40, 1, 1, 1, 1, 1, '2013-07-27 09:47:40', '2017-07-18 21:19:38'),
(856, 41, 1, 0, 0, 0, 0, '2013-07-27 09:47:40', '2014-05-22 07:25:02'),
(857, 42, 1, 0, 0, 0, 0, '2013-07-27 09:47:40', '2014-05-22 07:25:02'),
(858, 43, 1, 0, 0, 0, 0, '2013-07-27 09:47:40', '2014-05-22 07:25:02'),
(866, 52, 1, 0, 0, 0, 0, '2013-07-27 09:47:40', '2014-07-24 16:19:22'),
(867, 53, 1, 0, 0, 0, 0, '2013-07-27 09:47:40', '2014-07-24 16:19:22'),
(868, 54, 1, 0, 0, 0, 0, '2013-07-27 09:47:40', '2014-07-24 16:19:22'),
(869, 55, 1, 0, 0, 0, 0, '2013-07-27 09:47:41', '2014-07-24 16:19:22'),
(870, 56, 1, 0, 0, 0, 0, '2013-07-27 09:47:41', '2014-07-24 16:19:22'),
(871, 57, 1, 0, 0, 0, 0, '2013-07-27 09:47:41', '2014-07-24 16:19:22'),
(872, 58, 1, 0, 0, 0, 0, '2013-07-27 09:47:41', '2017-07-18 21:20:22'),
(873, 59, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:13'),
(874, 60, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:17'),
(875, 61, 1, 0, 0, 0, 0, '2013-07-27 09:47:41', '2014-07-24 16:19:22'),
(876, 62, 1, 0, 0, 0, 0, '2013-07-27 09:47:41', '2014-07-24 16:19:23'),
(877, 63, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:26'),
(878, 71, 1, 0, 0, 0, 0, '2013-07-27 09:47:41', '2014-07-24 16:19:23'),
(879, 65, 1, 0, 0, 0, 0, '2013-07-27 09:47:41', '2014-07-24 16:19:23'),
(880, 66, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:36'),
(881, 67, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:39'),
(882, 68, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:41'),
(883, 69, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:42'),
(884, 70, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:43'),
(885, 72, 1, 1, 1, 1, 1, '2013-07-27 09:47:41', '2017-07-18 21:20:46'),
(887, 74, 1, 1, 1, 1, 1, '2013-07-27 09:47:42', '2017-07-18 21:20:49'),
(894, 81, 1, 0, 0, 0, 0, '2013-07-27 09:47:42', '2017-07-18 21:21:18'),
(895, 82, 1, 1, 1, 1, 1, '2013-07-27 09:47:42', '2017-07-18 21:21:08'),
(896, 83, 1, 1, 1, 1, 1, '2013-07-27 09:47:42', '2017-07-18 21:21:09'),
(897, 84, 1, 0, 0, 0, 0, '2013-07-27 09:47:42', '2017-07-18 21:21:16'),
(908, 95, 1, 0, 0, 0, 0, '2013-07-27 09:47:43', '2014-05-22 07:25:04'),
(1443, 105, 1, 1, 1, 1, 1, '2013-09-13 23:43:18', '2017-07-18 21:20:44'),
(1444, 107, 1, 0, 0, 0, 0, '2013-09-19 03:34:13', '2014-05-22 07:25:02'),
(1445, 106, 1, 0, 0, 0, 0, '2013-09-19 03:34:21', '2014-05-22 07:25:02'),
(2168, 114, 1, 1, 1, 1, 1, '2013-09-27 00:34:22', '2017-07-18 21:20:11'),
(2169, 115, 1, 0, 0, 0, 0, '2013-09-28 05:30:00', '2014-07-24 16:19:23'),
(2228, 117, 1, 1, 1, 1, 1, '2013-12-05 01:09:25', '2017-07-18 21:20:12'),
(2233, 118, 1, 0, 0, 0, 0, '2013-12-10 00:18:37', '2014-07-24 16:19:22'),
(2254, 137, 1, 0, 0, 0, 0, '2013-12-28 01:48:21', '2014-05-22 07:25:04'),
(2270, 146, 1, 0, 0, 0, 0, '2014-01-17 02:50:05', '2014-05-22 07:25:02'),
(2298, 153, 1, 0, 0, 0, 0, '2014-05-02 01:39:35', '2014-05-22 07:25:05'),
(2406, 136, 1, 0, 0, 0, 0, '2014-05-22 07:24:29', '2017-07-18 21:22:06'),
(3424, 157, 1, 0, 0, 0, 0, '2014-08-02 17:57:16', '2018-01-16 10:49:47'),
(3453, 159, 1, 0, 0, 0, 0, '2015-02-25 19:31:08', '2018-01-16 10:49:47'),
(3454, 160, 1, 0, 0, 0, 0, '2015-02-27 18:44:53', '2018-01-16 10:49:47'),
(3465, 168, 1, 1, 1, 1, 1, '2015-04-28 17:27:11', '2017-07-18 21:20:45'),
(3466, 169, 1, 0, 0, 0, 0, '2015-05-05 23:52:55', '2018-01-16 10:49:47'),
(3467, 2, 33, 0, 0, 0, 0, '2017-08-10 05:09:47', '2018-01-16 10:49:47'),
(3468, 118, 33, 0, 0, 0, 0, '2017-08-10 05:09:51', '2018-01-16 10:49:47'),
(3469, 7, 33, 0, 0, 0, 0, '2017-08-10 05:09:57', '2018-01-16 10:49:47'),
(3470, 24, 33, 0, 0, 0, 0, '2017-08-10 05:09:59', '2018-01-16 10:49:47'),
(3471, 62, 33, 0, 0, 0, 0, '2017-08-10 05:10:17', '2018-01-16 10:49:47'),
(3472, 8, 1, 0, 0, 0, 0, '2018-01-16 16:48:23', '2018-01-16 16:48:23'),
(3473, 9, 1, 0, 0, 0, 0, '2018-01-16 16:48:26', '2018-01-16 16:48:26'),
(3474, 161, 1, 0, 0, 0, 0, '2018-01-16 16:48:29', '2018-01-16 16:48:29'),
(3475, 162, 1, 0, 0, 0, 0, '2018-01-16 16:48:31', '2018-01-16 16:48:31'),
(3476, 32, 1, 0, 0, 0, 0, '2018-01-16 16:48:34', '2018-01-16 16:48:34'),
(3477, 34, 1, 0, 0, 0, 0, '2018-01-16 16:48:35', '2018-01-16 16:48:35'),
(3478, 35, 1, 0, 0, 0, 0, '2018-01-16 16:48:35', '2018-01-16 16:48:35'),
(3479, 45, 1, 0, 0, 0, 0, '2018-01-17 10:49:09', '2018-01-17 10:49:09'),
(3480, 50, 1, 0, 0, 0, 0, '2018-01-17 10:49:12', '2018-01-17 10:49:12'),
(3481, 2, 32, 0, 0, 0, 0, '2018-03-20 15:59:47', '2018-03-20 15:59:47'),
(3482, 4, 32, 0, 0, 0, 0, '2018-03-20 15:59:50', '2018-03-20 15:59:50'),
(3483, 118, 32, 0, 0, 0, 0, '2018-03-20 15:59:52', '2018-03-20 15:59:52'),
(3484, 6, 32, 0, 0, 0, 0, '2018-03-20 15:59:55', '2018-03-20 15:59:55'),
(3485, 7, 32, 0, 0, 0, 0, '2018-03-20 15:59:56', '2018-03-20 15:59:56'),
(3486, 8, 32, 0, 0, 0, 0, '2018-03-20 15:59:58', '2018-03-20 15:59:58'),
(3487, 9, 32, 0, 0, 0, 0, '2018-03-20 16:00:00', '2018-03-20 16:00:00'),
(3488, 28, 32, 0, 0, 0, 0, '2018-03-20 16:00:09', '2018-03-20 16:00:09'),
(3489, 31, 32, 0, 0, 0, 0, '2018-03-20 16:00:10', '2018-03-20 16:00:10'),
(3490, 32, 32, 0, 0, 0, 0, '2018-03-20 16:00:11', '2018-03-20 16:00:11'),
(3491, 2, 2, 0, 0, 0, 0, '2021-03-21 07:28:41', '2021-03-21 07:28:41'),
(3492, 118, 2, 0, 0, 0, 0, '2021-03-21 07:28:44', '2021-03-21 07:28:44'),
(3493, 6, 2, 0, 0, 0, 0, '2021-03-21 07:28:46', '2021-03-21 07:28:46'),
(3494, 7, 2, 0, 0, 0, 0, '2021-03-21 07:28:48', '2021-03-21 07:28:48'),
(3495, 8, 2, 1, 1, 1, 1, '2021-03-21 07:28:49', '2021-03-21 07:28:52'),
(3497, 9, 2, 0, 0, 0, 0, '2021-03-21 07:28:57', '2021-03-21 07:28:57'),
(3498, 10, 2, 0, 0, 0, 0, '2021-03-21 07:28:58', '2021-03-21 07:28:58'),
(3499, 32, 2, 0, 0, 0, 0, '2021-03-21 07:29:04', '2021-03-21 07:29:04'),
(3500, 35, 2, 0, 0, 0, 0, '2021-03-21 07:29:09', '2021-03-21 07:29:09'),
(3501, 10, 1, 0, 0, 0, 0, '2021-03-21 08:48:09', '2021-03-21 08:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `pincode`
--

DROP TABLE IF EXISTS `pincode`;
CREATE TABLE IF NOT EXISTS `pincode` (
  `pincode_id` int(3) NOT NULL AUTO_INCREMENT,
  `pincode` varchar(20) NOT NULL,
  `areaname` varchar(30) NOT NULL,
  `cityname` varchar(50) NOT NULL,
  `std_code` varchar(6) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `pincode_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 enabled and 1 disabled',
  `pn_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pn_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pincode_id`),
  KEY `frPinCodeState` (`pincode_id`),
  KEY `InStateID` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `pincode`
--

TRUNCATE TABLE `pincode`;
--
-- Dumping data for table `pincode`
--

INSERT INTO `pincode` (`pincode_id`, `pincode`, `areaname`, `cityname`, `std_code`, `state_id`, `pincode_status`, `pn_created_date`, `pn_modified_date`) VALUES
(5, '123456', 'Surat', 'Surat', '', 1156, 0, '2015-04-04 16:00:02', '2018-01-16 10:49:48'),
(6, '395006', 'Hirbaug', 'Surat', '', 3613, 0, '2015-04-06 12:46:40', '2018-01-16 10:49:48'),
(7, '395006', 'Hirabaug', 'Surat', '', 3613, 0, '2015-04-08 13:31:07', '2018-01-16 10:49:48'),
(8, '395006', 'varachha', 'surat', '', 3613, 0, '2015-04-10 13:33:14', '2018-01-16 10:49:48'),
(9, '123456', 'Bhavnagar', 'Bhavnagar', '', 3613, 0, '2015-04-14 15:05:37', '2018-01-16 10:49:48'),
(16, '123456', 'surat', 'Surat', '', 3613, 0, '2015-04-22 10:51:40', '2018-01-16 10:49:48'),
(17, '395001', 'Athwalines', 'Surat', '', 3613, 0, '2015-04-28 17:39:10', '2018-01-16 10:49:48'),
(18, '395007', 'Ghoddod', 'Surat', '', 3613, 0, '2015-04-28 17:39:35', '2018-01-16 10:49:48'),
(19, '395001', 'Bhavnagar', 'Bhavnagar', '', 3613, 0, '2015-04-28 18:16:58', '2018-01-16 10:49:48'),
(20, '395006', 'Bhavnagar', 'Bhavnagar', '', 3613, 0, '2015-04-28 18:17:30', '2018-01-16 10:49:48'),
(21, '395001', 'surat', 'Surat', '', 3613, 0, '2015-04-28 18:17:48', '2018-01-16 10:49:48'),
(22, '123123', 'Bhavnagar', 'Bhavnagar', '', 3613, 0, '2015-04-28 18:18:32', '2018-01-16 10:49:48'),
(23, '364002', 'Surat', 'Surat', '', 3613, 0, '2015-04-29 14:58:33', '2018-01-16 10:49:48'),
(24, '395001', 'Surat', 'Ssurat', '', 3613, 0, '2015-04-29 15:04:56', '2018-01-16 10:49:48'),
(25, '395001', 'Hiraboug', 'Surat', '', 3613, 0, '2015-05-02 10:26:43', '2018-01-16 10:49:48'),
(26, '395001', 'Hirabaug', 'Surat', '', 3613, 0, '2015-05-04 17:32:02', '2018-01-16 10:49:48'),
(27, '395001', 'Calander', 'Surat', '', 3613, 0, '2015-05-13 10:30:17', '2018-01-16 10:49:48'),
(28, '395001', 'Calender', 'Surat', '', 3613, 0, '2015-05-13 10:49:56', '2018-01-16 10:49:48'),
(29, '395007', 'Hirabaug', 'Surat', '', 3613, 0, '2015-05-13 11:16:05', '2018-01-16 10:49:48'),
(30, '123123', 'Bhavnagar', 'Surat', '', 3613, 0, '2015-05-18 10:23:33', '2018-01-16 10:49:48'),
(31, '395001', '123456789', 'Surat', '', 3613, 0, '2015-05-18 16:12:13', '2018-01-16 10:49:48'),
(32, '395001', 'bortalav', 'Surat', '', 3613, 0, '2015-05-18 19:06:40', '2018-01-16 10:49:48'),
(33, '395001', 'Bhavnagar', 'Surat', '', 3613, 0, '2015-05-19 11:38:35', '2018-01-16 10:49:48'),
(38, '123234', 'sdfsdfsdf', 'sdfsdf', '', 3613, 0, '2015-05-23 17:36:03', '2018-01-16 10:49:48'),
(42, '395001', 'surat', 'Surat', '', 105, 0, '2015-05-25 11:20:42', '2018-01-16 10:49:48'),
(43, '395001', 'surat address', 'Surat', '', 105, 0, '2015-05-26 09:56:49', '2018-01-16 10:49:48'),
(44, '395001', 'suratu', 'Surat', '', 105, 0, '2015-05-26 10:06:52', '2018-01-16 10:49:48'),
(45, '395001', 'sdfsfdg', 'Surat', '', 105, 0, '2015-05-26 10:28:02', '2018-01-16 10:49:48'),
(46, '395001', 'qwexsd', 'Surat', '', 105, 0, '2015-05-26 10:30:11', '2018-01-16 10:49:48'),
(47, '395001', 'surdgzf', 'Surat', '', 105, 0, '2015-05-26 10:47:09', '2018-01-16 10:49:48'),
(48, '395001', 'dfsdf', 'Surat', '', 105, 0, '2015-05-27 09:54:38', '2018-01-16 10:49:48'),
(49, '395001', 'Bhavnagar', 'Surat', '', 105, 0, '2015-05-27 09:56:45', '2018-01-16 10:49:48'),
(50, '395001', 'android', 'Surat', '', 105, 0, '2015-05-27 11:32:01', '2018-01-16 10:49:48'),
(51, '3965001', 'surat', 'Surat', '', 105, 0, '2015-06-01 15:15:46', '2018-01-16 10:49:48'),
(52, '395001', 'surat, gujrat', 'Surat', '', 105, 0, '2015-06-02 12:44:56', '2018-01-16 10:49:48'),
(53, '395001', 'surat， gujrat', 'Surat', '', 105, 0, '2015-06-02 13:06:02', '2018-01-16 10:49:48'),
(54, '395001', 'surat,gujrat', 'Surat', '', 105, 0, '2015-06-02 13:07:11', '2018-01-16 10:49:48'),
(55, '395001', 'awesaawf', 'Surat', '', 105, 0, '2015-06-02 13:20:44', '2018-01-16 10:49:48'),
(56, '395001', 'surdgzdfter', 'Surat', '', 105, 0, '2015-06-02 13:21:27', '2018-01-16 10:49:48'),
(57, '395001', 'test', 'Surat', '', 105, 0, '2015-06-03 15:27:52', '2018-01-16 10:49:48'),
(58, '39500', 'surat', 'surat', '', 3613, 0, '2015-06-03 18:31:14', '2018-01-16 10:49:48'),
(59, '12346', '123456123456', 'Surat', '', 3613, 0, '2015-06-16 16:13:44', '2018-01-16 10:49:48'),
(60, '395001', 'sdfsdfsdf', 'sdf', '', 3613, 0, '2015-06-18 10:18:56', '2018-01-16 10:49:48'),
(61, '395001', 'Surat Testing Success', 'sURAT', '', 3613, 0, '2015-06-18 10:27:02', '2018-01-16 10:49:48'),
(62, '395001', 'Surat Hirabaug Circle', 'Surat', '', 3613, 0, '2015-06-18 12:19:59', '2018-01-16 10:49:48');

-- --------------------------------------------------------

--
-- Table structure for table `pp_pss_index_map`
--

DROP TABLE IF EXISTS `pp_pss_index_map`;
CREATE TABLE IF NOT EXISTS `pp_pss_index_map` (
  `pp_pss_index_map_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'Does not actually required but added to speed some operations such as deleting row for particular products and so on',
  `product_price_id` int(11) NOT NULL COMMENT 'product_price_id from product price table',
  `product_stone_number` int(11) NOT NULL COMMENT 'product_stone_number from product_stone_stones table',
  `diamond_price_id` int(11) NOT NULL,
  `diamond_shape_id` int(11) NOT NULL COMMENT 'From 12-03-2015: it will support dynamic invetntory, will hold primary id from attribute masters. table needs to add product_side_stones_size, to support deep text search, but in that case need cctld of this table',
  `diamond_type_id` int(11) NOT NULL,
  `diamond_color_id` int(11) NOT NULL,
  `diamond_purity_id` int(11) NOT NULL,
  PRIMARY KEY (`pp_pss_index_map_id`),
  KEY `InProdID` (`product_id`),
  KEY `InProdPricID` (`product_price_id`),
  KEY `InProdStoneNo` (`product_stone_number`),
  KEY `InDiaPriID` (`diamond_price_id`),
  KEY `InDiaShaID` (`diamond_shape_id`),
  KEY `InDiaTypeID` (`diamond_type_id`),
  KEY `InDiaColID` (`diamond_color_id`),
  KEY `InDiaPurID` (`diamond_purity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='map between product_side_stones and product_price';

--
-- Truncate table before insert `pp_pss_index_map`
--

TRUNCATE TABLE `pp_pss_index_map`;
-- --------------------------------------------------------

--
-- Table structure for table `pp_pss_index_map_cctld`
--

DROP TABLE IF EXISTS `pp_pss_index_map_cctld`;
CREATE TABLE IF NOT EXISTS `pp_pss_index_map_cctld` (
  `pp_pss_index_map_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `product_id` int(11) NOT NULL COMMENT 'from product table',
  `product_price_id` int(11) NOT NULL,
  `product_stone_number` int(11) NOT NULL,
  `diamond_price_id` int(11) NOT NULL,
  `diamond_shape_id` int(11) NOT NULL COMMENT 'From 12-03-2015: it will support dynamic invetntory, will hold primary id from attribute masters. table needs to add product_side_stones_size, to support deep text search',
  `diamond_type_id` int(11) NOT NULL,
  `diamond_color_id` int(11) NOT NULL,
  `diamond_purity_id` int(11) NOT NULL,
  PRIMARY KEY (`pp_pss_index_map_cctld_id`),
  KEY `FK_ppimc_manufacturer_id` (`manufacturer_id`),
  KEY `FK_ppimc_product_id` (`product_id`),
  KEY `FK_ppimc_product_price_id` (`product_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='DEPRECATED:map between product_side_stones and product_price';

--
-- Truncate table before insert `pp_pss_index_map_cctld`
--

TRUNCATE TABLE `pp_pss_index_map_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `private_message`
--

DROP TABLE IF EXISTS `private_message`;
CREATE TABLE IF NOT EXISTS `private_message` (
  `private_message_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `pm_parent_id` int(11) NOT NULL COMMENT 'parent id of particular customer thread',
  `customer_id` int(11) NOT NULL COMMENT 'stored when message come from customer if available',
  `admin_user_id` int(11) NOT NULL COMMENT 'admin user id who response to message',
  `pm_name` varchar(255) NOT NULL COMMENT 'stored name of cutomer whether message from customer or response from admin',
  `pm_email` varchar(255) NOT NULL COMMENT 'stored email of cutomer whether message from customer or response from admin',
  `pm_phone` varchar(20) NOT NULL COMMENT 'phone number of customer if available',
  `pm_question` mediumtext NOT NULL,
  `pm_message` mediumtext NOT NULL,
  `pm_ip_address` varchar(100) NOT NULL,
  `pm_status` varchar(10) NOT NULL DEFAULT 'C' COMMENT 'O-open, Close-C',
  `pm_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`private_message_id`),
  KEY `InAdUserID` (`admin_user_id`),
  KEY `InCusID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores feedback recieved from front side users';

--
-- Truncate table before insert `private_message`
--

TRUNCATE TABLE `private_message`;
-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `seller_id` int(11) NOT NULL DEFAULT '1' COMMENT 'seller_id to support/identify sellers in market place',
  `category_id` mediumtext COMMENT 'product in which category based',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'unique code',
  `product_name` varchar(500) DEFAULT NULL COMMENT 'unique name',
  `product_alias` mediumtext COMMENT 'when product is inserted alias name is generated',
  `product_offer_id` mediumtext,
  `product_manufacturer_id` int(11) DEFAULT NULL COMMENT 'Deprecated: since default manufaturer_id is 7 so it does not require in main table. only cctld will hold manufaturer_id. For dynamic inventory it may/can/will hold brand_id from brand mastser table',
  `product_image` mediumtext COMMENT 'image folder with 10000 images par product',
  `product_angle_in` tinyint(6) DEFAULT '0' COMMENT 'image to display angle index',
  `product_video` varchar(255) DEFAULT NULL COMMENT 'singlw video',
  `product_gender` varchar(1) DEFAULT NULL COMMENT 'Type of gender the product belongs to',
  `product_accessories` varchar(200) DEFAULT NULL,
  `product_metal_priority_id` int(11) DEFAULT NULL COMMENT 'stored metal price id',
  `product_cs_priority_id` int(11) DEFAULT NULL COMMENT 'stored diamond price id',
  `product_ss1_priority_id` int(11) DEFAULT NULL COMMENT 'stored diamond price id',
  `product_ss2_priority_id` int(11) DEFAULT NULL COMMENT 'stored diamond price id',
  `ring_size_region` varchar(3) DEFAULT NULL COMMENT 'Type of region India.US etc for ring size specification',
  `product_price` double DEFAULT NULL COMMENT 'price(diamond+metal+gemstone), changed to double to support dynamic inventory',
  `product_currency_id` int(11) DEFAULT NULL,
  `product_discount` varchar(20) DEFAULT NULL COMMENT 'discount on fixproduct ',
  `product_shipping_cost` varchar(20) DEFAULT NULL,
  `product_cod_cost` varchar(20) DEFAULT NULL,
  `product_tax_id` varchar(50) DEFAULT NULL COMMENT 'multiple tax rule id if multiple tax rule selected else one',
  `product_short_description` text,
  `product_description` mediumtext,
  `product_internal_note` mediumtext COMMENT 'internal(remarks) note on  product',
  `custom_page_title` varchar(200) DEFAULT NULL COMMENT 'title of a custom page if user forget to give title page , title will be fetch from here',
  `meta_keyword` mediumtext COMMENT 'seo',
  `meta_description` mediumtext COMMENT 'seo',
  `product_tags` mediumtext COMMENT 'links of produts',
  `product_related_keywords` mediumtext,
  `product_sort_order` int(11) DEFAULT NULL COMMENT 'for front end diaplay',
  `product_status` tinyint(1) DEFAULT NULL COMMENT '0 enable or 1 disable',
  `robots` int(11) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `content_rights` varchar(200) DEFAULT NULL,
  `product_related_category_id` mediumtext,
  `product_related_products_id` mediumtext,
  `product_view_buy` int(11) DEFAULT NULL,
  `product_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when product created',
  `product_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when product modifited',
  PRIMARY KEY (`product_id`),
  KEY `InProductID` (`product_id`),
  KEY `InProdTaxID` (`product_tax_id`),
  KEY `InCurrID` (`product_currency_id`),
  KEY `FK_p_seller_id` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product`
--

TRUNCATE TABLE `product`;
--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `inventory_type_id`, `seller_id`, `category_id`, `product_sku`, `product_name`, `product_alias`, `product_offer_id`, `product_manufacturer_id`, `product_image`, `product_angle_in`, `product_video`, `product_gender`, `product_accessories`, `product_metal_priority_id`, `product_cs_priority_id`, `product_ss1_priority_id`, `product_ss2_priority_id`, `ring_size_region`, `product_price`, `product_currency_id`, `product_discount`, `product_shipping_cost`, `product_cod_cost`, `product_tax_id`, `product_short_description`, `product_description`, `product_internal_note`, `custom_page_title`, `meta_keyword`, `meta_description`, `product_tags`, `product_related_keywords`, `product_sort_order`, `product_status`, `robots`, `author`, `content_rights`, `product_related_category_id`, `product_related_products_id`, `product_view_buy`, `product_created_date`, `product_modified_date`) VALUES
(1, 1, 1, '2', 'mrf-001', 'Natural Peanut Butter Crunch', 'natural-peanut-butter-crunch', '', 7, 'assets/product/mrf-001/Natural-Crunch-1KG_3-png_1400x17504.png', 0, '0', 'F', 'RIN', 0, 0, 0, 0, '0', 300, NULL, '0', '0', '', '', 'Unsweetened | Made with 100% Roasted Peanuts | No added Sugar | No added Salt | No Hydrogenated Oils | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry and hygienic place. Away from direct sun light.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', 'ALPINO OFFERS THE BEST SUPERFOODS WITH UNCOMPROMISING TASTE & GOOD HEALTH IN MIND.\r\nIt is the leading health foods brand who bring everything from fitness supplements to health essentials under one roof - Peanut Butter, Almond Butter, Apple Cider Vinegar, Super Muesli, Organic Green Tea and more.', '', '', '', '', '', 0, 0, 1, '', '', '', '', NULL, '2021-03-21 07:58:32', '2021-03-21 08:30:51'),
(2, 1, 1, '5', 'mrf-002', 'Chocolate Peanut Butter Smooth', 'chocolate-peanut-butter-smooth', '', 7, 'assets/product/mrf-002/Chocolate-1KG-_1_1400x1750.png', 0, '0', 'F', 'RIN', 0, 0, 0, 0, '0', NULL, NULL, '0', '0', '', '', 'Made with High-Quality Roasted Peanuts, Cocoa Powder & Choco Chips | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry, and hygienic place. Away from direct sunlight.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre &nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', 'ALPINO OFFERS THE BEST SUPERFOODS WITH UNCOMPROMISING TASTE & GOOD HEALTH IN MIND.\r\nIt is the leading health foods brand that brings everything from fitness supplements to health essentials under one roof - Peanut Butter, Almond Butter, Apple Cider Vinegar, Super Muesli, Organic Green Tea, and more.', '', '', '', '', '', 0, 0, 1, '', '', '', '', NULL, '2021-03-21 08:37:24', '2021-03-21 08:37:24'),
(3, 1, 1, '3', 'mrf-003', 'Classic Peanut Butter Crunch', 'classic-peanut-butter-crunch', '', 7, 'assets/product/mrf-003/classic-crun-1KG_3-png_1400x1750.png', 0, '0', 'F', 'RIN', 0, 0, 0, 0, '0', 600, NULL, '0', '0', '', '', 'Made with High-Quality Roasted Peanuts | 100% Non-GMO | Gluten-Free | Vegan', '', 'ALPINO OFFERS THE BEST SUPERFOODS WITH UNCOMPROMISING TASTE & GOOD HEALTH IN MIND.\r\nIt is the leading health foods brand who brings everything from fitness supplements to health essentials under one roof - Peanut Butter, Almond Butter, Apple Cider Vinegar, Super Muesli, Organic Green Tea, and more.', '', '', '', '', '', 0, 0, 1, '', '', '', '', NULL, '2021-03-21 08:40:25', '2021-03-21 08:40:55'),
(4, 1, 1, '4', 'mrf-004', 'Coconut Peanut Butter Smooth', 'coconut-peanut-butter-smooth', '', 7, 'assets/product/mrf-004/Coconut-smooth-1KG_3-png_600x.png', 0, '0', 'F', 'RIN', 0, 0, 0, 0, '0', NULL, NULL, '0', '0', '', '', 'India’s 1st Coconut Peanut Butter | Made with High-Quality Roasted Peanuts & Goodness of Coconut | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry, and hygienic place. Away from direct sunlight.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', '', '', '', '', '', '', 0, 0, 1, '', '', '', '', NULL, '2021-03-21 08:43:36', '2021-03-21 08:43:36');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

DROP TABLE IF EXISTS `product_attribute`;
CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_master_specifier_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_master_specifier table',
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `pa_real_value` double NOT NULL COMMENT 'real numeric value of attribute to apply in logic',
  `pa_value` varchar(200) NOT NULL COMMENT 'contain value either text or numeric',
  `pa_icon` mediumtext NOT NULL,
  `pa_sort_order` int(11) NOT NULL,
  `pa_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 enabled and 1 disabled ',
  `pa_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pa_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this table is only used when attribute requires master table';

--
-- Truncate table before insert `product_attribute`
--

TRUNCATE TABLE `product_attribute`;
-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_cctld`
--

DROP TABLE IF EXISTS `product_attribute_cctld`;
CREATE TABLE IF NOT EXISTS `product_attribute_cctld` (
  `product_attribute_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'From 16-02-2015 this field is used as lang/country content identifire',
  `product_attribute_id` int(11) NOT NULL COMMENT 'Foreign key from product_attribute table',
  `pa_value` varchar(200) NOT NULL COMMENT 'contain value either text or numeric',
  `pa_icon` mediumtext NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `pac_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pac_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_attribute_cctld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='cctld of product_attribute: this table is only used when attribute requires master table';

--
-- Truncate table before insert `product_attribute_cctld`
--

TRUNCATE TABLE `product_attribute_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE IF NOT EXISTS `product_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `ebay_category_id` varchar(100) DEFAULT NULL COMMENT 'reveals third party interface for integrate through eCommerce service API of eBay:eBay category ID',
  `ebay_store_category_id` int(11) DEFAULT NULL COMMENT 'reveals third party interface for integrate through eCommerce service API of eBay:store category ID',
  `category_name` varchar(500) DEFAULT NULL,
  `category_alias` mediumtext COMMENT 'when name inserted alias name is generatd',
  `category_meta_name` varchar(300) DEFAULT NULL COMMENT 'display name for meta',
  `category_brand_code` varchar(100) DEFAULT '0' COMMENT 'Unique brand code to be generated using code from all parent brand and code of this particular brand. For dynamic inventory it may/can/will hold brand_id from brand mastser table',
  `parent_id` int(11) DEFAULT NULL COMMENT 'for menu',
  `category_royalty` varchar(20) DEFAULT NULL COMMENT 'branswise royalty to be included in costing',
  `category_adv_cost` varchar(20) DEFAULT NULL COMMENT 'brand advertising cost to be added in costing',
  `category_image` mediumtext COMMENT 'for front view',
  `image_size_id` int(11) DEFAULT NULL,
  `category_banner` mediumtext,
  `banner_size_id` int(11) DEFAULT NULL,
  `m_category_image` mediumtext COMMENT 'mobile category image',
  `category_description` mediumtext COMMENT 'full description',
  `custom_page_title` mediumtext COMMENT 'Page title displayed in browser tab',
  `meta_keyword` mediumtext COMMENT 'seo',
  `meta_description` mediumtext COMMENT 'seo',
  `category_sort_order` int(11) DEFAULT NULL COMMENT 'for front end display',
  `category_status` tinyint(1) DEFAULT NULL COMMENT '0 enable or 1 disable',
  `robots` int(20) DEFAULT NULL COMMENT 'seo robots drop down value ',
  `author` varchar(200) DEFAULT NULL COMMENT 'seo author ',
  `content_rights` mediumtext COMMENT 'seo Content Rights',
  `category_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when added',
  `category_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when modified',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_categories`
--

TRUNCATE TABLE `product_categories`;
--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`category_id`, `inventory_type_id`, `ebay_category_id`, `ebay_store_category_id`, `category_name`, `category_alias`, `category_meta_name`, `category_brand_code`, `parent_id`, `category_royalty`, `category_adv_cost`, `category_image`, `image_size_id`, `category_banner`, `banner_size_id`, `m_category_image`, `category_description`, `custom_page_title`, `meta_keyword`, `meta_description`, `category_sort_order`, `category_status`, `robots`, `author`, `content_rights`, `category_created_date`, `category_modified_date`) VALUES
(1, 1, NULL, NULL, 'Meraki Natural Peanut Butter', 'meraki-natural-peanut-butter', 'Meraki Natural Peanut Butter', '1', 0, '', NULL, 'assets/category/Natural-Peanut-Butter1167308866_s.jpg', 8, 'assets/category/banner/Natural-Peanut-Butter427923795_s.jpg', 8, NULL, 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 1, 0, 1, 'Merakirichfood', 'Merakirichfood', '2021-03-19 16:53:35', '2021-03-19 16:53:35'),
(2, 1, NULL, NULL, 'Natural', 'natural', 'Natural', '1-2', 1, '', NULL, 'assets/category/Natural2031165110_s.jpg', 8, 'assets/category/banner/Natural-banner1943564833_s.jpeg', 8, NULL, 'Natural', 'Natural', 'Natural', 'Natural', 1, 0, 1, 'Merakirichfood', 'Merakirichfood', '2021-03-19 16:55:51', '2021-03-19 16:55:51'),
(3, 1, NULL, NULL, 'Crunchy', 'crunchy', 'Crunchy', '1-3', 1, '', NULL, 'assets/category/Crunchy528161678_s.jpg', 8, 'assets/category/banner/Crunchy-banner792835845_s.jpg', 8, NULL, 'Crunchy', 'Crunchy', 'Crunchy', 'Crunchy', 2, 0, 1, 'Merakirichfood', 'Merakirichfood', '2021-03-19 16:57:35', '2021-03-19 16:57:35'),
(4, 1, NULL, NULL, 'Creamy', 'creamy', 'Creamy', '1-4', 1, 'Creamy', NULL, 'assets/category/Creamy252437841_s.jpg', 8, 'assets/category/banner/Creamy-banner594116145_s.jpg', 8, NULL, 'Creamy', 'Creamy', 'Creamy', 'Creamy', 3, 0, 1, 'Merakirichfood', 'Merakirichfood', '2021-03-19 17:00:13', '2021-03-19 17:02:35'),
(5, 1, NULL, NULL, 'Chocolate', 'chocolate', 'Chocolate', '1-5', 1, 'Chocolate', NULL, 'assets/category/Chocolate2118905963_s.jpg', 8, 'assets/category/banner/Chocolate-banner685615313_s.png', 8, NULL, 'Chocolate', 'Chocolate', 'Chocolate', 'Chocolate', 4, 0, 1, 'Merakirichfood', 'Merakirichfood', '2021-03-19 17:02:24', '2021-03-19 17:02:24'),
(6, 1, NULL, NULL, 'Meraki Peanut Butter Powder', 'meraki-peanut-butter-powder', 'Meraki Peanut Butter Powder', '6', 0, '', NULL, '', 0, '', 0, NULL, 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 2, 1, 1, 'merakirichfoods', 'merakirichfoods', '2021-03-21 08:45:58', '2021-03-21 08:45:58'),
(7, 1, NULL, NULL, 'Meraki Premium Peanut', 'meraki-premium-peanut', 'Meraki Premium Peanut', '7', 0, '', NULL, '', 0, '', 0, NULL, 'Meraki Premium Peanut', 'Meraki Premium Peanut', 'Meraki Premium Peanut', 'Meraki Premium Peanut', 3, 1, 1, 'merakirichfoods', 'merakirichfoods', '2021-03-21 08:46:33', '2021-03-21 08:46:33'),
(8, 1, NULL, NULL, 'Meraki Coconut Water', 'meraki-coconut-water', 'Meraki Coconut Water', '8', 0, '', NULL, '', 0, '', 0, NULL, 'Meraki Coconut Water', 'Meraki Coconut Water', 'Meraki Coconut Water', 'Meraki Coconut Water', 4, 1, 1, 'merakirichfoods', 'merakirichfoods', '2021-03-21 08:47:01', '2021-03-21 08:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories_cctld`
--

DROP TABLE IF EXISTS `product_categories_cctld`;
CREATE TABLE IF NOT EXISTS `product_categories_cctld` (
  `category_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_alias` mediumtext NOT NULL COMMENT 'when name inserted alias name is generatd',
  `category_meta_name` varchar(300) DEFAULT NULL COMMENT 'display name for meta',
  `category_brand_code` varchar(100) DEFAULT NULL COMMENT 'Unique brand code to be generated using code from all parent brand and code of this particular brand. For dynamic inventory it may/can/will hold brand_id from brand mastser table',
  `parent_id` int(11) DEFAULT NULL COMMENT 'for menu',
  `category_royalty` varchar(20) DEFAULT NULL COMMENT 'branswise royalty to be included in costing',
  `category_adv_cost` varchar(20) DEFAULT NULL COMMENT 'brand advertising cost to be added in costing',
  `category_image` mediumtext COMMENT 'for front view',
  `image_size_id` int(11) DEFAULT NULL,
  `category_banner` mediumtext,
  `banner_size_id` int(11) DEFAULT NULL,
  `m_category_image` mediumtext COMMENT 'mobile category image',
  `category_description` mediumtext COMMENT 'full description',
  `custom_page_title` mediumtext COMMENT 'Page title displayed in browser tab',
  `meta_keyword` mediumtext COMMENT 'seo',
  `meta_description` mediumtext COMMENT 'seo',
  `category_sort_order` int(11) DEFAULT NULL COMMENT 'for front end display',
  `category_status` tinyint(1) DEFAULT NULL COMMENT '0 enable or 1 disable',
  `robots` int(20) DEFAULT NULL COMMENT 'seo robots drop down value ',
  `author` varchar(200) DEFAULT NULL COMMENT 'seo author ',
  `content_rights` mediumtext COMMENT 'seo Content Rights',
  `custom_page_title_pattern` mediumtext COMMENT 'product detail seo pattern',
  `meta_keyword_pattern` mediumtext COMMENT 'product detail seo pattern',
  `meta_description_pattern` mediumtext COMMENT 'product detail seo pattern',
  `robots_pattern` int(11) DEFAULT NULL COMMENT 'product detail seo pattern',
  `author_pattern` varchar(255) DEFAULT NULL COMMENT 'product detail seo pattern',
  `content_rights_pattern` mediumtext COMMENT 'product detail seo pattern',
  `category_cctld_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when added',
  `category_cctld_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'date when modified',
  PRIMARY KEY (`category_cctld_id`),
  UNIQUE KEY `UnCategoryIDManufID` (`manufacturer_id`,`category_id`),
  KEY `FK_pcc_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_categories_cctld`
--

TRUNCATE TABLE `product_categories_cctld`;
--
-- Dumping data for table `product_categories_cctld`
--

INSERT INTO `product_categories_cctld` (`category_cctld_id`, `manufacturer_id`, `category_id`, `category_name`, `category_alias`, `category_meta_name`, `category_brand_code`, `parent_id`, `category_royalty`, `category_adv_cost`, `category_image`, `image_size_id`, `category_banner`, `banner_size_id`, `m_category_image`, `category_description`, `custom_page_title`, `meta_keyword`, `meta_description`, `category_sort_order`, `category_status`, `robots`, `author`, `content_rights`, `custom_page_title_pattern`, `meta_keyword_pattern`, `meta_description_pattern`, `robots_pattern`, `author_pattern`, `content_rights_pattern`, `category_cctld_created_date`, `category_cctld_modified_date`) VALUES
(1, 8, 12, 'HTML', 'html', 'html', NULL, 6, NULL, NULL, 'assets/category/html1450899254_s.jpg', 4, '', 0, NULL, '<b style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">Hypertext Markup Language</b><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;(</span><b style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">HTML</b><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">) is the standard&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Markup_language\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Markup language\">markup language</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;for creating&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Web_page\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Web page\">web pages</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;and&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Web_application\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Web application\">web applications</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">. With&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Cascading_Style_Sheets\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Cascading Style Sheets\">Cascading Style Sheets</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;(CSS) and&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/JavaScript\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"JavaScript\">JavaScript</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">, it forms a triad of cornerstone technologies for the&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/World_Wide_Web\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"World Wide Web\">World Wide Web</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">.</span><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Web_browser\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Web browser\">Web browsers</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;receive HTML documents from a&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Web_server\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Web server\">web server</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;or from local storage and render them into multimedia web pages. HTML describes the structure of a web page&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Semantic_Web\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Semantic Web\">semantically</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;and originally included cues for the appearance of the document.</span>', '', '', '', 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-23 16:34:49', '2018-03-23 16:34:49'),
(2, 9, 12, 'HTML', 'html', 'html', NULL, 6, NULL, NULL, 'assets/category/html1450899254_s.jpg', 4, '', 0, NULL, '<b style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">Hypertext Markup Language</b><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;(</span><b style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">HTML</b><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">) is the standard&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Markup_language\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Markup language\">markup language</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;for creating&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Web_page\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Web page\">web pages</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;and&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Web_application\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Web application\">web applications</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">. With&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Cascading_Style_Sheets\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Cascading Style Sheets\">Cascading Style Sheets</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;(CSS) and&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/JavaScript\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"JavaScript\">JavaScript</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">, it forms a triad of cornerstone technologies for the&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/World_Wide_Web\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"World Wide Web\">World Wide Web</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">.</span><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Web_browser\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Web browser\">Web browsers</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;receive HTML documents from a&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Web_server\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Web server\">web server</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;or from local storage and render them into multimedia web pages. HTML describes the structure of a web page&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Semantic_Web\" style=\"text-decoration-line: none; color: rgb(11, 0, 128); background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: sans-serif; font-size: 14px;\" title=\"Semantic Web\">semantically</a><span style=\"color: rgb(34, 34, 34); font-family: sans-serif; font-size: 14px;\">&nbsp;and originally included cues for the appearance of the document.</span>', '', '', '', 0, 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-23 16:34:49', '2018-03-23 16:34:49'),
(3, 8, 13, 'Make Money', 'make-money', '', NULL, 0, NULL, NULL, 'assets/category/download1476285054_s.png', 3, '', 0, NULL, '<a class=\"yt-simple-endpoint style-scope yt-formatted-string\" href=\"https://www.youtube.com/playlist?list=PLYdSkd22JjO-bpoQT2g4e7s9TFkRqJQZA\" style=\"display: inline-block; cursor: pointer; text-decoration-line: none; color: var(--yt-endpoint-hover-color); font-size: 16px; line-height: var(--yt-formatted-string-endpoint_-_line-height); font-family: Roboto, Arial, sans-serif; background-color: rgb(238, 238, 238);\">M</a>ake Money', '', '', '', 40, 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-30 16:15:26', '2018-03-30 16:15:26'),
(4, 9, 13, 'Make Money', 'make-money', '', NULL, 0, NULL, NULL, 'assets/category/download1476285054_s.png', 3, '', 0, NULL, '<a class=\"yt-simple-endpoint style-scope yt-formatted-string\" href=\"https://www.youtube.com/playlist?list=PLYdSkd22JjO-bpoQT2g4e7s9TFkRqJQZA\" style=\"display: inline-block; cursor: pointer; text-decoration-line: none; color: var(--yt-endpoint-hover-color); font-size: 16px; line-height: var(--yt-formatted-string-endpoint_-_line-height); font-family: Roboto, Arial, sans-serif; background-color: rgb(238, 238, 238);\">M</a>ake Money', '', '', '', 40, 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2018-03-30 16:15:26', '2018-03-30 16:15:26'),
(7, 8, 15, 'Computer Fundamental', 'computer-fundamental', '', NULL, 7, NULL, NULL, 'assets/category/unnamed501946412_s.png', 4, '', 0, NULL, 'Computer Fundamental', '', '', '', 1, 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-03 15:49:16', '2018-04-03 15:49:16'),
(8, 9, 15, 'Computer Fundamental', 'computer-fundamental', '', NULL, 7, NULL, NULL, 'assets/category/unnamed501946412_s.png', 4, '', 0, NULL, 'Computer Fundamental', '', '', '', 1, 0, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2018-04-03 15:49:16', '2018-04-03 15:49:16'),
(9, 8, 1, 'Meraki Natural Peanut Butter', 'meraki-natural-peanut-butter', 'Meraki Natural Peanut Butter', NULL, 0, NULL, NULL, 'assets/category/Natural-Peanut-Butter1167308866_s.jpg', 8, 'assets/category/banner/Natural-Peanut-Butter427923795_s.jpg', 8, NULL, 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 1, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 16:53:35', '2021-03-19 16:53:35'),
(10, 9, 1, 'Meraki Natural Peanut Butter', 'meraki-natural-peanut-butter', 'Meraki Natural Peanut Butter', NULL, 0, NULL, NULL, 'assets/category/Natural-Peanut-Butter1167308866_s.jpg', 8, 'assets/category/banner/Natural-Peanut-Butter427923795_s.jpg', 8, NULL, 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 'Meraki Natural Peanut Butter', 1, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 16:53:35', '2021-03-19 16:53:35'),
(11, 8, 2, 'Natural', 'natural', 'Natural', NULL, 1, NULL, NULL, 'assets/category/Natural2031165110_s.jpg', 8, 'assets/category/banner/Natural-banner1943564833_s.jpeg', 8, NULL, 'Natural', 'Natural', 'Natural', 'Natural', 1, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 16:55:51', '2021-03-19 16:55:51'),
(12, 9, 2, 'Natural', 'natural', 'Natural', NULL, 1, NULL, NULL, 'assets/category/Natural2031165110_s.jpg', 8, 'assets/category/banner/Natural-banner1943564833_s.jpeg', 8, NULL, 'Natural', 'Natural', 'Natural', 'Natural', 1, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 16:55:51', '2021-03-19 16:55:51'),
(13, 8, 3, 'Crunchy', 'crunchy', 'Crunchy', NULL, 1, NULL, NULL, 'assets/category/Crunchy528161678_s.jpg', 8, 'assets/category/banner/Crunchy-banner792835845_s.jpg', 8, NULL, 'Crunchy', 'Crunchy', 'Crunchy', 'Crunchy', 2, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 16:57:35', '2021-03-19 16:57:35'),
(14, 9, 3, 'Crunchy', 'crunchy', 'Crunchy', NULL, 1, NULL, NULL, 'assets/category/Crunchy528161678_s.jpg', 8, 'assets/category/banner/Crunchy-banner792835845_s.jpg', 8, NULL, 'Crunchy', 'Crunchy', 'Crunchy', 'Crunchy', 2, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 16:57:35', '2021-03-19 16:57:35'),
(15, 8, 4, 'Creamy', 'creamy', 'Creamy', NULL, 0, NULL, NULL, 'assets/category/Creamy252437841_s.jpg', 8, 'assets/category/banner/Creamy-banner594116145_s.jpg', 8, NULL, 'Creamy', 'Creamy', 'Creamy', 'Creamy', 3, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 17:00:13', '2021-03-19 17:00:13'),
(16, 9, 4, 'Creamy', 'creamy', 'Creamy', NULL, 0, NULL, NULL, 'assets/category/Creamy252437841_s.jpg', 8, 'assets/category/banner/Creamy-banner594116145_s.jpg', 8, NULL, 'Creamy', 'Creamy', 'Creamy', 'Creamy', 3, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 17:00:13', '2021-03-19 17:00:13'),
(17, 8, 5, 'Chocolate', 'chocolate', 'Chocolate', NULL, 1, NULL, NULL, 'assets/category/Chocolate2118905963_s.jpg', 8, 'assets/category/banner/Chocolate-banner685615313_s.png', 8, NULL, 'Chocolate', 'Chocolate', 'Chocolate', 'Chocolate', 4, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 17:02:25', '2021-03-19 17:02:25'),
(18, 9, 5, 'Chocolate', 'chocolate', 'Chocolate', NULL, 1, NULL, NULL, 'assets/category/Chocolate2118905963_s.jpg', 8, 'assets/category/banner/Chocolate-banner685615313_s.png', 8, NULL, 'Chocolate', 'Chocolate', 'Chocolate', 'Chocolate', 4, 0, NULL, 'Merakirichfood', 'Merakirichfood', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-19 17:02:25', '2021-03-19 17:02:25'),
(19, 8, 6, 'Meraki Peanut Butter Powder', 'meraki-peanut-butter-powder', 'Meraki Peanut Butter Powder', NULL, 0, NULL, NULL, '', 0, '', 0, NULL, 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 2, 0, NULL, 'merakirichfoods', 'merakirichfoods', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 08:45:58', '2021-03-21 08:45:58'),
(20, 9, 6, 'Meraki Peanut Butter Powder', 'meraki-peanut-butter-powder', 'Meraki Peanut Butter Powder', NULL, 0, NULL, NULL, '', 0, '', 0, NULL, 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 'Meraki Peanut Butter Powder', 2, 0, NULL, 'merakirichfoods', 'merakirichfoods', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 08:45:58', '2021-03-21 08:45:58'),
(21, 8, 7, 'Meraki Premium Peanut', 'meraki-premium-peanut', 'Meraki Premium Peanut', NULL, 0, NULL, NULL, '', 0, '', 0, NULL, 'Meraki Premium Peanut', 'Meraki Premium Peanut', 'Meraki Premium Peanut', 'Meraki Premium Peanut', 3, 0, NULL, 'merakirichfoods', 'merakirichfoods', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 08:46:33', '2021-03-21 08:46:33'),
(22, 9, 7, 'Meraki Premium Peanut', 'meraki-premium-peanut', 'Meraki Premium Peanut', NULL, 0, NULL, NULL, '', 0, '', 0, NULL, 'Meraki Premium Peanut', 'Meraki Premium Peanut', 'Meraki Premium Peanut', 'Meraki Premium Peanut', 3, 0, NULL, 'merakirichfoods', 'merakirichfoods', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 08:46:33', '2021-03-21 08:46:33'),
(23, 8, 8, 'Meraki Coconut Water', 'meraki-coconut-water', 'Meraki Coconut Water', NULL, 0, NULL, NULL, '', 0, '', 0, NULL, 'Meraki Coconut Water', 'Meraki Coconut Water', 'Meraki Coconut Water', 'Meraki Coconut Water', 4, 0, NULL, 'merakirichfoods', 'merakirichfoods', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 08:47:01', '2021-03-21 08:47:01'),
(24, 9, 8, 'Meraki Coconut Water', 'meraki-coconut-water', 'Meraki Coconut Water', NULL, 0, NULL, NULL, '', 0, '', 0, NULL, 'Meraki Coconut Water', 'Meraki Coconut Water', 'Meraki Coconut Water', 'Meraki Coconut Water', 4, 0, NULL, 'merakirichfoods', 'merakirichfoods', NULL, NULL, NULL, NULL, NULL, NULL, '2021-03-21 08:47:01', '2021-03-21 08:47:01');

-- --------------------------------------------------------

--
-- Table structure for table `product_category_map`
--

DROP TABLE IF EXISTS `product_category_map`;
CREATE TABLE IF NOT EXISTS `product_category_map` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `InCatID` (`category_id`),
  KEY `InProdID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps products to product_category table';

--
-- Truncate table before insert `product_category_map`
--

TRUNCATE TABLE `product_category_map`;
--
-- Dumping data for table `product_category_map`
--

INSERT INTO `product_category_map` (`product_id`, `category_id`) VALUES
(1, 2),
(2, 5),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_cctld`
--

DROP TABLE IF EXISTS `product_cctld`;
CREATE TABLE IF NOT EXISTS `product_cctld` (
  `product_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT 'from product table',
  `manufacturer_id` int(11) NOT NULL COMMENT 'From 16-02-2015 this field is used as lang/country content identifire',
  `product_metal_priority_id` int(11) NOT NULL,
  `product_cs_priority_id` int(11) NOT NULL,
  `product_ss1_priority_id` int(11) NOT NULL,
  `product_ss2_priority_id` int(11) NOT NULL,
  `product_discount` double NOT NULL,
  `product_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 enable and 1 disable',
  `product_name` varchar(500) NOT NULL COMMENT 'unique name',
  `product_short_description` text NOT NULL,
  `product_description` mediumtext NOT NULL,
  `custom_page_title` varchar(200) NOT NULL COMMENT 'title of the custome page',
  `meta_keyword` mediumtext NOT NULL COMMENT 'seo',
  `meta_description` mediumtext NOT NULL COMMENT 'seo',
  `robots` int(11) NOT NULL,
  `author` varchar(200) NOT NULL,
  `content_rights` varchar(200) NOT NULL,
  `product_cctld_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_cctld_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_cctld_id`),
  UNIQUE KEY `UnProdIDManufID` (`product_id`,`manufacturer_id`),
  KEY `InProdID` (`product_id`),
  KEY `InManufID` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='roduct child table created to implement ccTLD specific features where required';

--
-- Truncate table before insert `product_cctld`
--

TRUNCATE TABLE `product_cctld`;
--
-- Dumping data for table `product_cctld`
--

INSERT INTO `product_cctld` (`product_cctld_id`, `product_id`, `manufacturer_id`, `product_metal_priority_id`, `product_cs_priority_id`, `product_ss1_priority_id`, `product_ss2_priority_id`, `product_discount`, `product_status`, `product_name`, `product_short_description`, `product_description`, `custom_page_title`, `meta_keyword`, `meta_description`, `robots`, `author`, `content_rights`, `product_cctld_created_date`, `product_cctld_modified_date`) VALUES
(1, 1, 8, 0, 0, 0, 0, 0, 0, 'Natural Peanut Butter Crunch', 'Unsweetened | Made with 100% Roasted Peanuts | No added Sugar | No added Salt | No Hydrogenated Oils | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry and hygienic place. Away from direct sun light.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', '', '', '', 1, '', '', '2021-03-21 07:58:32', '2021-03-21 07:58:32'),
(2, 1, 9, 0, 0, 0, 0, 0, 0, 'Natural Peanut Butter Crunch', 'Unsweetened | Made with 100% Roasted Peanuts | No added Sugar | No added Salt | No Hydrogenated Oils | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry and hygienic place. Away from direct sun light.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', '', '', '', 1, '', '', '2021-03-21 07:58:33', '2021-03-21 07:58:33'),
(3, 2, 8, 0, 0, 0, 0, 0, 0, 'Chocolate Peanut Butter Smooth', 'Made with High-Quality Roasted Peanuts, Cocoa Powder & Choco Chips | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry, and hygienic place. Away from direct sunlight.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre &nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', '', '', '', 1, '', '', '2021-03-21 08:37:24', '2021-03-21 08:37:24'),
(4, 2, 9, 0, 0, 0, 0, 0, 0, 'Chocolate Peanut Butter Smooth', 'Made with High-Quality Roasted Peanuts, Cocoa Powder & Choco Chips | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry, and hygienic place. Away from direct sunlight.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre &nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', '', '', '', 1, '', '', '2021-03-21 08:37:24', '2021-03-21 08:37:24'),
(5, 3, 8, 0, 0, 0, 0, 0, 0, 'Classic Peanut Butter Crunch', 'Made with High-Quality Roasted Peanuts | 100% Non-GMO | Gluten-Free | Vegan', '', '', '', '', 1, '', '', '2021-03-21 08:40:26', '2021-03-21 08:40:26'),
(6, 3, 9, 0, 0, 0, 0, 0, 0, 'Classic Peanut Butter Crunch', 'Made with High-Quality Roasted Peanuts | 100% Non-GMO | Gluten-Free | Vegan', '', '', '', '', 1, '', '', '2021-03-21 08:40:26', '2021-03-21 08:40:26'),
(7, 4, 8, 0, 0, 0, 0, 0, 0, 'Coconut Peanut Butter Smooth', 'India’s 1st Coconut Peanut Butter | Made with High-Quality Roasted Peanuts & Goodness of Coconut | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry, and hygienic place. Away from direct sunlight.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', '', '', '', 1, '', '', '2021-03-21 08:43:37', '2021-03-21 08:43:37'),
(8, 4, 9, 0, 0, 0, 0, 0, 0, 'Coconut Peanut Butter Smooth', 'India’s 1st Coconut Peanut Butter | Made with High-Quality Roasted Peanuts & Goodness of Coconut | 100% Non-GMO | Gluten-Free | Vegan', '<span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Alpino Health Foods offers a wide variety of convenient, delicious &amp; affordable food choices that can help everyone enjoy a balanced and healthy diet. Alpino health foods strive to be a global leader in food products and a socially responsible company that attains its quality standards. We believe in traditions, trust &amp; good taste. With an assorted range of healthy products, Alpino Health Foods bring everything from fitness supplements to health essentials under one roof - peanut butter, almond butter, green tea, apple cider vinegar, super muesli, super oats, peanut butter powder, and many more.<br />\r\n<br />\r\nStore in a cool, dry, and hygienic place. Away from direct sunlight.</span><br />\r\n<br />\r\n<button aria-expanded=\"true\" class=\"Collapsible__Button Heading u-h6\" data-action=\"toggle-collapsible\" style=\"-webkit-font-smoothing: antialiased; color: rgb(0, 0, 0); font-style: var(--heading-font-style); font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: 14px; line-height: 17px; font-family: var(--heading-font-family); margin: 0px; padding: 16px 0px; overflow: visible; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-width: initial; border-style: none; border-color: initial; border-radius: 0px; appearance: button; text-transform: uppercase; cursor: pointer; transition: color 0.2s ease-in-out 0s; display: block; position: relative; width: 535px; text-align: left;\">KEY FEATURES</button>\r\n<div class=\"Collapsible__Inner\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; height: auto; visibility: visible; transition: height 0.35s ease-in-out 0s; overflow: visible; font-family: Montserrat, sans-serif; font-size: 14px;\">\r\n<div class=\"Collapsible__Content\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding-bottom: 45px; padding-right: 80px;\">\r\n<div class=\"Rte\" style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; word-break: break-word;\">\r\n<ul style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; margin: 0px 0px 0px 30px; padding-right: 0px; padding-left: 0px; list-style-position: outside;\">\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Trans Fat&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">No Cholesterol&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Rich Source of Fibre&nbsp;</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">25% Protein Per Serving Of 32 G</li>\r\n	<li style=\"-webkit-font-smoothing: antialiased; box-sizing: border-box; padding: 5px 0px;\">Good Source Of Vitamins E, B3 &amp; B6</li>\r\n</ul>\r\n</div>\r\n</div>\r\n</div>\r\n', '', '', '', 1, '', '', '2021-03-21 08:43:37', '2021-03-21 08:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_center_stone`
--

DROP TABLE IF EXISTS `product_center_stone`;
CREATE TABLE IF NOT EXISTS `product_center_stone` (
  `product_center_stone_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) DEFAULT NULL COMMENT 'Foreign key from inventory_type table',
  `inventory_master_specifier_id` int(11) DEFAULT NULL COMMENT 'Foreign key from inventory_master_specifier table',
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL COMMENT ' id from diamond_price(category) in for loop',
  `product_center_stone_weight` double DEFAULT NULL COMMENT 'center stone weight, 23-02-2015: changed to double to support dynamic invetntory. For dynamic inventory numeric attribute saved here',
  `product_center_stone_size` varchar(300) DEFAULT NULL COMMENT '23-02-2015: changed to VARCHAR(300) to support dynamic invetntory.  For dynamic inventory text attribute saved here',
  `pcs_diamond_shape_id` int(11) DEFAULT NULL COMMENT 'name drop down, 23-02-2015: changed to int to support dynamic invetntory.  For dynamic inventory primary_id from attribute master saved here',
  `product_center_stone_total` varchar(20) DEFAULT NULL COMMENT 'total stone of ring',
  `product_center_stone_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 enabled and 1 disabled',
  `product_center_stone_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_center_stone_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_center_stone_id`),
  KEY `InDiamondCatID` (`category_id`),
  KEY `InProductID` (`product_id`),
  KEY `InShapeID` (`pcs_diamond_shape_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_center_stone`
--

TRUNCATE TABLE `product_center_stone`;
-- --------------------------------------------------------

--
-- Table structure for table `product_center_stone_cctld`
--

DROP TABLE IF EXISTS `product_center_stone_cctld`;
CREATE TABLE IF NOT EXISTS `product_center_stone_cctld` (
  `product_center_stone_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'From 16-02-2015 this field is used as lang/country content identifire',
  `product_center_stone_id` int(11) NOT NULL COMMENT 'Foreign key from product_center_stone table',
  `product_center_stone_size` varchar(300) NOT NULL COMMENT '23-02-2015: changed size  to 300 to support dynamic invetntory.  For dynamic inventory text attribute saved here',
  `pcsc_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pcsc_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_center_stone_cctld_id`),
  UNIQUE KEY `product_center_stone_id` (`product_center_stone_id`,`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_center_stone_cctld`
--

TRUNCATE TABLE `product_center_stone_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `product_making_prices`
--

DROP TABLE IF EXISTS `product_making_prices`;
CREATE TABLE IF NOT EXISTS `product_making_prices` (
  `product_making_prices_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_price_id` int(11) NOT NULL COMMENT 'foriegn key from product_price table',
  `pmp_name` varchar(30) NOT NULL,
  `pmp_key` varchar(30) NOT NULL,
  `pmp_value` double NOT NULL,
  `pmp_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_making_prices_id`),
  KEY `FK_pmp_product_price_id` (`product_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains all costing involved in detail for product making';

--
-- Truncate table before insert `product_making_prices`
--

TRUNCATE TABLE `product_making_prices`;
-- --------------------------------------------------------

--
-- Table structure for table `product_making_prices_cctld`
--

DROP TABLE IF EXISTS `product_making_prices_cctld`;
CREATE TABLE IF NOT EXISTS `product_making_prices_cctld` (
  `product_making_prices_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_price_id` int(11) NOT NULL COMMENT 'foriegn key from product_price table',
  `manufacturer_id` int(11) NOT NULL,
  `pmp_name` varchar(30) NOT NULL,
  `pmp_key` varchar(30) NOT NULL,
  `pmp_value` double NOT NULL,
  `pmp_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_making_prices_cctld_id`),
  KEY `FK_pmpc_product_price_id` (`product_price_id`),
  KEY `FK_pmpc_manufacturer_id` (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='contains all costing involved in detail for product making';

--
-- Truncate table before insert `product_making_prices_cctld`
--

TRUNCATE TABLE `product_making_prices_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `product_metal`
--

DROP TABLE IF EXISTS `product_metal`;
CREATE TABLE IF NOT EXISTS `product_metal` (
  `product_metal_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `inventory_master_specifier_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_master_specifier table',
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT 'id from metal_price(category) in for loop',
  `product_metal_weight` varchar(20) NOT NULL COMMENT 'metal weight in for loop',
  `product_metal_status` tinyint(1) NOT NULL DEFAULT '0',
  `product_metal_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_metal_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_metal_id`),
  UNIQUE KEY `UnProdIDCatID` (`product_id`,`category_id`),
  KEY `InProdID` (`product_id`),
  KEY `InCatID` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_metal`
--

TRUNCATE TABLE `product_metal`;
-- --------------------------------------------------------

--
-- Table structure for table `product_offer`
--

DROP TABLE IF EXISTS `product_offer`;
CREATE TABLE IF NOT EXISTS `product_offer` (
  `product_offer_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_offer_name` varchar(200) NOT NULL COMMENT 'featured, festive, hot offeres, chrismas offers',
  `product_offer_key` varchar(200) NOT NULL,
  `product_offer_icon` mediumtext NOT NULL,
  `image_size_id` int(11) NOT NULL,
  `product_offer_description` mediumtext NOT NULL,
  `product_offer_sort_order` int(11) NOT NULL,
  `product_offer_status` tinyint(3) NOT NULL,
  `product_offer_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_offer_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_offer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='this table dropdown used in product category and product modules';

--
-- Truncate table before insert `product_offer`
--

TRUNCATE TABLE `product_offer`;
-- --------------------------------------------------------

--
-- Table structure for table `product_offer_map`
--

DROP TABLE IF EXISTS `product_offer_map`;
CREATE TABLE IF NOT EXISTS `product_offer_map` (
  `product_id` int(11) NOT NULL,
  `product_offer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_offer_map`
--

TRUNCATE TABLE `product_offer_map`;
-- --------------------------------------------------------

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
CREATE TABLE IF NOT EXISTS `product_price` (
  `product_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `product_id` int(11) NOT NULL,
  `product_generated_code` varchar(200) NOT NULL COMMENT 'size  changed to 200 on 2-03-2015, to some multiple attributes',
  `product_generated_code_displayable` varchar(50) NOT NULL COMMENT 'added on 2-03-2015: displayed to public',
  `product_generated_code_info` varchar(1000) NOT NULL COMMENT 'it will help keep some info so that at runtime it will not require to query all master tables',
  `product_price_weight` double NOT NULL COMMENT 'weight always in gm and datatype double selected for better query processing',
  `metal_price_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `metal_type_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `metal_color_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `metal_purity_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `cs_diamond_price_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `pcs_diamond_shape_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_type_id_cs` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_color_id_cs` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_purity_id_cs` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `ss1_diamond_price_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `pss1_diamond_shape_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_type_id_ss1` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_color_id_ss1` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_purity_id_ss1` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `ss2_diamond_price_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `pss2_diamond_shape_id` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_type_id_ss2` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_color_id_ss2` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `diamond_purity_id_ss2` int(11) DEFAULT NULL COMMENT 'fields added to improve searching',
  `product_price_calculated_price` double DEFAULT NULL,
  `product_price_calculated_price_cz` double DEFAULT NULL,
  `product_price_calculated_price_mount` double DEFAULT NULL,
  `product_discount` varchar(20) DEFAULT NULL COMMENT 'discount applied to final price costing as specified in product, stored in unit of (%)',
  `product_discount_cz` double DEFAULT NULL COMMENT 'discount applied to final price costing as specified in product, stored in unit of (%): this price is for cz category',
  `product_discount_mount` double DEFAULT NULL,
  `product_discounted_price` double DEFAULT NULL COMMENT 'price obtained after appying discount',
  `product_discounted_price_cz` double DEFAULT NULL,
  `product_discounted_price_mount` double DEFAULT NULL,
  `product_price_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT 'if combination de-selected in product then particular product_code combination will be disabled 0 for enable and 1 for disable',
  `product_price_status_temp` tinyint(4) DEFAULT NULL COMMENT 'Used to update product at run time so that at front side no effect on product_price_status at once: 0 enable and 1 disable',
  `product_price_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_price_modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_price_id`),
  UNIQUE KEY `UnProdIDProdGenCode` (`product_generated_code`),
  KEY `InProdID` (`product_id`),
  KEY `InMtlTypeID` (`metal_type_id`),
  KEY `InMtlColorID` (`metal_color_id`),
  KEY `InMtlPurityID` (`metal_purity_id`),
  KEY `InDiaCSColorID` (`diamond_color_id_cs`),
  KEY `InDiaCSPurityID` (`diamond_purity_id_cs`),
  KEY `InDiaCSShapeID` (`pcs_diamond_shape_id`),
  KEY `InDiaCSTypeID` (`diamond_type_id_cs`),
  KEY `InDiaSS1ShapeID` (`pss1_diamond_shape_id`),
  KEY `InDiaSS1TypeID` (`diamond_type_id_ss1`),
  KEY `InDiaSS1ColorID` (`diamond_color_id_ss1`),
  KEY `InDiaSS2ShapeID` (`pss2_diamond_shape_id`),
  KEY `InDiaSS2TypeID` (`diamond_type_id_ss2`),
  KEY `InDiaSS2ColorID` (`diamond_color_id_ss2`),
  KEY `InDiaSS2PurityID` (`diamond_purity_id_ss2`),
  KEY `InDiaSS1PurityID` (`diamond_purity_id_ss1`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='in this table product prices will be stored for combinations of metal and stone';

--
-- Truncate table before insert `product_price`
--

TRUNCATE TABLE `product_price`;
--
-- Dumping data for table `product_price`
--

INSERT INTO `product_price` (`product_price_id`, `inventory_type_id`, `product_id`, `product_generated_code`, `product_generated_code_displayable`, `product_generated_code_info`, `product_price_weight`, `metal_price_id`, `metal_type_id`, `metal_color_id`, `metal_purity_id`, `cs_diamond_price_id`, `pcs_diamond_shape_id`, `diamond_type_id_cs`, `diamond_color_id_cs`, `diamond_purity_id_cs`, `ss1_diamond_price_id`, `pss1_diamond_shape_id`, `diamond_type_id_ss1`, `diamond_color_id_ss1`, `diamond_purity_id_ss1`, `ss2_diamond_price_id`, `pss2_diamond_shape_id`, `diamond_type_id_ss2`, `diamond_color_id_ss2`, `diamond_purity_id_ss2`, `product_price_calculated_price`, `product_price_calculated_price_cz`, `product_price_calculated_price_mount`, `product_discount`, `product_discount_cz`, `product_discount_mount`, `product_discounted_price`, `product_discounted_price_cz`, `product_discounted_price_mount`, `product_price_status`, `product_price_status_temp`, `product_price_created_date`, `product_price_modified_date`) VALUES
(1, 1, 1, 'KMN-1', 'KMN-1-1', 'KMN|1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 300, NULL, NULL, '0', NULL, NULL, 300, NULL, NULL, 0, 0, '2021-03-21 07:58:33', '2021-03-21 07:58:33'),
(2, 1, 2, 'KMC-2', 'KMC-2-2', 'KMC|2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, 0, 0, '2021-03-21 08:37:25', '2021-03-21 08:37:25'),
(3, 1, 3, 'KMC-3', 'KMC-3-3', 'KMC|3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 600, NULL, NULL, '0', NULL, NULL, 600, NULL, NULL, 0, 0, '2021-03-21 08:40:26', '2021-03-21 08:40:26'),
(4, 1, 4, 'KMC-4', 'KMC-4-4', 'KMC|4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, 0, 0, '2021-03-21 08:43:37', '2021-03-21 08:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_price_cctld`
--

DROP TABLE IF EXISTS `product_price_cctld`;
CREATE TABLE IF NOT EXISTS `product_price_cctld` (
  `product_price_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `product_generated_code` varchar(200) NOT NULL COMMENT 'just to add uniue index on product_generated_code, size  changed to 200 on 2-03-2015, to support multiple attributes',
  `product_generated_code_displayable` varchar(50) NOT NULL COMMENT 'added on 2-03-2015',
  `product_generated_code_info` varchar(1000) NOT NULL COMMENT 'it will help keep some info so that at runtime it will not require to query all master tables',
  `product_price_id` int(11) DEFAULT NULL COMMENT 'from product_price table',
  `manufacturer_id` int(11) DEFAULT NULL COMMENT 'manufacturer_id identify ccTLD',
  `product_price_calculated_price` double DEFAULT NULL,
  `product_price_calculated_price_cz` double DEFAULT NULL,
  `product_price_calculated_price_mount` double DEFAULT NULL,
  `product_discount` varchar(20) DEFAULT NULL,
  `product_discount_cz` double DEFAULT NULL,
  `product_discount_mount` double DEFAULT NULL,
  `product_discounted_price` double DEFAULT NULL,
  `product_discounted_price_cz` double DEFAULT NULL,
  `product_discounted_price_mount` double DEFAULT NULL,
  `product_price_status` tinyint(1) DEFAULT NULL COMMENT '0 enable adn 1 disable',
  `product_price_status_temp` tinyint(1) DEFAULT NULL,
  `product_price_cctld_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_price_cctld_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_price_cctld_id`),
  UNIQUE KEY `UnProdGenCodeCcTld` (`product_generated_code`,`manufacturer_id`),
  KEY `InProdPriceID` (`product_price_id`),
  KEY `InManufID` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='product_price child table created to implement ccTLD specific features';

--
-- Truncate table before insert `product_price_cctld`
--

TRUNCATE TABLE `product_price_cctld`;
--
-- Dumping data for table `product_price_cctld`
--

INSERT INTO `product_price_cctld` (`product_price_cctld_id`, `inventory_type_id`, `product_generated_code`, `product_generated_code_displayable`, `product_generated_code_info`, `product_price_id`, `manufacturer_id`, `product_price_calculated_price`, `product_price_calculated_price_cz`, `product_price_calculated_price_mount`, `product_discount`, `product_discount_cz`, `product_discount_mount`, `product_discounted_price`, `product_discounted_price_cz`, `product_discounted_price_mount`, `product_price_status`, `product_price_status_temp`, `product_price_cctld_created_date`, `product_price_cctld_modified_date`) VALUES
(1, 1, 'KMN-1', 'KMN-1-1', 'KMN|1', 1, 8, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-03-21 07:58:33', '2021-03-21 07:58:33'),
(2, 1, 'KMN-1', 'KMN-1-1', 'KMN|1', 1, 9, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-03-21 07:58:33', '2021-03-21 07:58:33'),
(3, 1, 'KMC-2', 'KMC-2-2', 'KMC|2', 2, 8, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-03-21 08:37:25', '2021-03-21 08:37:25'),
(4, 1, 'KMC-2', 'KMC-2-2', 'KMC|2', 2, 9, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-03-21 08:37:25', '2021-03-21 08:37:25'),
(5, 1, 'KMC-3', 'KMC-3-3', 'KMC|3', 3, 8, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-03-21 08:40:26', '2021-03-21 08:40:26'),
(6, 1, 'KMC-3', 'KMC-3-3', 'KMC|3', 3, 9, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-03-21 08:40:26', '2021-03-21 08:40:26'),
(7, 1, 'KMC-4', 'KMC-4-4', 'KMC|4', 4, 8, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-03-21 08:43:37', '2021-03-21 08:43:37'),
(8, 1, 'KMC-4', 'KMC-4-4', 'KMC|4', 4, 9, 0, NULL, NULL, '0', NULL, NULL, 0, NULL, NULL, NULL, 0, '2021-03-21 08:43:37', '2021-03-21 08:43:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_review`
--

DROP TABLE IF EXISTS `product_review`;
CREATE TABLE IF NOT EXISTS `product_review` (
  `product_review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL COMMENT 'if review given by customer then customer id else admin id',
  `user_type` varchar(10) NOT NULL COMMENT 'A: admin, C: customer',
  `product_review_rating` double NOT NULL COMMENT 'On 07-05-2015 changed to double',
  `product_review_description` mediumtext NOT NULL,
  `product_review_status` int(11) NOT NULL,
  `product_review_ipaddress` varchar(200) DEFAULT NULL,
  `product_review_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_review_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_review_id`),
  KEY `InProdID` (`product_id`),
  KEY `InCusID` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_review`
--

TRUNCATE TABLE `product_review`;
--
-- Dumping data for table `product_review`
--

INSERT INTO `product_review` (`product_review_id`, `product_id`, `customer_id`, `user_type`, `product_review_rating`, `product_review_description`, `product_review_status`, `product_review_ipaddress`, `product_review_created_date`, `product_review_modified_date`) VALUES
(1, 1, 1, 'A', 4, 'Yaaaa, It\'s a perfect product and its processor.', 1, NULL, '2021-03-21 08:56:42', '2021-03-21 08:56:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_side_stone1`
--

DROP TABLE IF EXISTS `product_side_stone1`;
CREATE TABLE IF NOT EXISTS `product_side_stone1` (
  `product_side_stone1_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `inventory_master_specifier_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_master_specifier table',
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT 'id from diamond_price(category) in for loop',
  `product_side_stone1_weight` double NOT NULL COMMENT 'side stone1 weight in for loop, 23-02-2015: changed to double to support dynamic invetntory',
  `product_side_stone1_size` varchar(300) NOT NULL COMMENT '23-02-2015: changed to VARCHAR(300) to support dynamic invetntory',
  `pss1_diamond_shape_id` int(11) NOT NULL COMMENT 'name drop down, 23-02-2015: changed to int to support dynamic invetntory',
  `product_side_stone1_total` varchar(20) NOT NULL COMMENT 'total side stone1',
  `product_side_stone1_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 enabled and 1 disabled',
  `product_side_stone1_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_side_stone1_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_side_stone1_id`),
  KEY `InProductIDSS1` (`product_id`),
  KEY `InDiamondCatIDSS1` (`category_id`),
  KEY `InShapeIDSS1` (`pss1_diamond_shape_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_side_stone1`
--

TRUNCATE TABLE `product_side_stone1`;
-- --------------------------------------------------------

--
-- Table structure for table `product_side_stone1_cctld`
--

DROP TABLE IF EXISTS `product_side_stone1_cctld`;
CREATE TABLE IF NOT EXISTS `product_side_stone1_cctld` (
  `product_side_stone1_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'From 16-02-2015 this field is used as lang/country content identifire',
  `product_side_stone1_id` int(11) NOT NULL COMMENT 'Foreign key from product_side_stone1 table',
  `product_side_stone1_size` varchar(300) NOT NULL COMMENT '23-02-2015: changed to VARCHAR(300) to support dynamic invetntory.  For dynamic inventory text attribute saved here',
  `pss1c_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pss1c_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_side_stone1_cctld_id`),
  UNIQUE KEY `product_side_stone1_id` (`product_side_stone1_id`,`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_side_stone1_cctld`
--

TRUNCATE TABLE `product_side_stone1_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `product_side_stone2`
--

DROP TABLE IF EXISTS `product_side_stone2`;
CREATE TABLE IF NOT EXISTS `product_side_stone2` (
  `product_side_stone2_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `inventory_master_specifier_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_master_specifier table',
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT 'id from diamond_price(category) in for loop',
  `product_side_stone2_weight` double NOT NULL COMMENT 'side stone2 weight in for loop, 23-02-2015: changed to double to support dynamic invetntory',
  `pss2_diamond_shape_id` int(11) NOT NULL COMMENT 'name drop down, 23-02-2015: changed to int to support dynamic invetntory',
  `product_side_stone2_size` varchar(300) NOT NULL COMMENT ', 23-02-2015: changed to VARCHAR(300) to support dynamic invetntory',
  `product_side_stone2_total` varchar(20) NOT NULL COMMENT 'total side stone2',
  `product_side_stone2_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 enabled and 1 disabled',
  `product_side_stone2_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_side_stone2_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_side_stone2_id`),
  KEY `InDiamondCatIDSS2` (`category_id`),
  KEY `InShapeIDSS2` (`pss2_diamond_shape_id`),
  KEY `InProductIDSS2` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_side_stone2`
--

TRUNCATE TABLE `product_side_stone2`;
-- --------------------------------------------------------

--
-- Table structure for table `product_side_stone2_cctld`
--

DROP TABLE IF EXISTS `product_side_stone2_cctld`;
CREATE TABLE IF NOT EXISTS `product_side_stone2_cctld` (
  `product_side_stone2_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'From 16-02-2015 this field is used as lang/country content identifire',
  `product_side_stone2_id` int(11) NOT NULL COMMENT 'Foreign key from product_side_stone1 table',
  `product_side_stone2_size` varchar(300) NOT NULL COMMENT '23-02-2015: changed to VARCHAR(300) to support dynamic invetntory.  For dynamic inventory text attribute saved here',
  `pss2c_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pss2c_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_side_stone2_cctld_id`),
  UNIQUE KEY `product_side_stone2_id` (`product_side_stone2_id`,`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_side_stone2_cctld`
--

TRUNCATE TABLE `product_side_stone2_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `product_side_stones`
--

DROP TABLE IF EXISTS `product_side_stones`;
CREATE TABLE IF NOT EXISTS `product_side_stones` (
  `product_side_stones_id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_type_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_type table',
  `inventory_master_specifier_id` int(11) NOT NULL COMMENT 'Foreign key from inventory_master_specifier table',
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL COMMENT 'id from diamond_price(category) in for loop',
  `product_stone_number` int(11) NOT NULL COMMENT 'indicate stone number for product by default start from 4 because 3 stone are stored in center_stone,side_stone1,side_stone2 tables',
  `product_side_stones_weight` double NOT NULL COMMENT 'side stone2 weight in for loop, 23-02-2015: changed to double to support dynamic invetntory',
  `psss_diamond_shape_id` int(11) NOT NULL COMMENT 'name drop down, 23-02-2015: changed to int to support dynamic invetntory',
  `product_side_stones_size` varchar(300) NOT NULL COMMENT '23-02-2015: changed to VARCHAR(300) to support dynamic invetntory',
  `product_side_stones_total` varchar(20) NOT NULL COMMENT 'total side stone2',
  `product_side_stones_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 enabled and 1 disabled',
  `product_side_stones_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_side_stones_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_side_stones_id`),
  KEY `InDiamondCatIDSSS` (`category_id`),
  KEY `InProductIDSSS` (`product_id`),
  KEY `InShapeIDSSS` (`psss_diamond_shape_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='table created to add more then 3 stone for product';

--
-- Truncate table before insert `product_side_stones`
--

TRUNCATE TABLE `product_side_stones`;
-- --------------------------------------------------------

--
-- Table structure for table `product_side_stones_cctld`
--

DROP TABLE IF EXISTS `product_side_stones_cctld`;
CREATE TABLE IF NOT EXISTS `product_side_stones_cctld` (
  `product_side_stones_cctld_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'From 16-02-2015 this field is used as lang/country content identifire',
  `product_side_stones_id` int(11) NOT NULL COMMENT 'Foreign key from product_side_stones table',
  `product_side_stones_size` varchar(300) NOT NULL COMMENT '23-02-2015: changed to VARCHAR(300) to support dynamic invetntory.  For dynamic inventory text attribute saved here',
  `pssc_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pssc_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_side_stones_cctld_id`),
  UNIQUE KEY `product_side_stones_id` (`product_side_stones_id`,`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `product_side_stones_cctld`
--

TRUNCATE TABLE `product_side_stones_cctld`;
-- --------------------------------------------------------

--
-- Table structure for table `product_value`
--

DROP TABLE IF EXISTS `product_value`;
CREATE TABLE IF NOT EXISTS `product_value` (
  `product_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `pv_quantity_unit` varchar(30) DEFAULT NULL COMMENT 'added on 17-03-2015 to support dynamic inventory',
  `product_value_quantity` double DEFAULT NULL COMMENT 'changed to douible on 6-03-2015 to support warehouse features',
  `pv_reflective_price` int(11) DEFAULT NULL COMMENT 'not product net price, but reflective price that goes up and down as per profit or loss cost applied(during sale) to initial product costing. Net product price is stored in product table',
  `product_value_width` varchar(20) DEFAULT NULL,
  `product_value_height` varchar(20) DEFAULT NULL,
  `product_value_weight` varchar(20) DEFAULT NULL,
  `product_value_notification_level` varchar(20) DEFAULT NULL,
  `product_value_maximum_purchase` varchar(20) DEFAULT NULL,
  `stock_status_id` int(11) DEFAULT NULL COMMENT 'stock_status_id from stock_status table',
  PRIMARY KEY (`product_value_id`),
  KEY `InProdID` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='warehouse center value holder, except net product price';

--
-- Truncate table before insert `product_value`
--

TRUNCATE TABLE `product_value`;
--
-- Dumping data for table `product_value`
--

INSERT INTO `product_value` (`product_value_id`, `product_id`, `pv_quantity_unit`, `product_value_quantity`, `pv_reflective_price`, `product_value_width`, `product_value_height`, `product_value_weight`, `product_value_notification_level`, `product_value_maximum_purchase`, `stock_status_id`) VALUES
(1, 1, '0', 0, NULL, '0', '0 mm', '0', '0', '0', 0),
(2, 2, '0', 0, NULL, '0', '0 mm', '0', '0', '0', 0),
(3, 3, '0', 0, NULL, '0', '0 mm', '0', '0', '0', 0),
(4, 4, '0', 0, NULL, '0', '0 mm', '0', '0', '0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `seo_robots`
--

DROP TABLE IF EXISTS `seo_robots`;
CREATE TABLE IF NOT EXISTS `seo_robots` (
  `robots_id` int(11) NOT NULL AUTO_INCREMENT,
  `robots_name` varchar(255) NOT NULL,
  `robots_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`robots_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `seo_robots`
--

TRUNCATE TABLE `seo_robots`;
--
-- Dumping data for table `seo_robots`
--

INSERT INTO `seo_robots` (`robots_id`, `robots_name`, `robots_status`) VALUES
(1, 'Index', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `sessions_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(128) NOT NULL COMMENT 'as provided by PHP lib OR custom generated ',
  `s_ip` varchar(50) NOT NULL,
  `s_user_agent` varchar(1000) DEFAULT NULL,
  `s_user_device` varchar(255) NOT NULL,
  `s_created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `s_modified_date` timestamp NOT NULL DEFAULT '1970-01-01 02:30:00',
  PRIMARY KEY (`sessions_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `sessions`
--

TRUNCATE TABLE `sessions`;
--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`sessions_id`, `session_id`, `s_ip`, `s_user_agent`, `s_user_device`, `s_created_time`, `s_modified_date`) VALUES
(1, 'b3b982aa0e0354e1155279b09b94b389', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36', 'PC: Chrome', '2021-03-16 01:10:11', '1970-01-01 02:30:00'),
(2, 'fcb77446fb5f08c9b3b1fd5e32872a9f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-19 15:53:33', '1970-01-01 02:30:00'),
(3, '79e99f2d88072d0ba0a41670f6b2899b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-19 15:58:13', '1970-01-01 02:30:00'),
(4, 'd5004e8886fd60dd2eedd1f360e5ab27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-19 17:37:50', '1970-01-01 02:30:00'),
(5, '315a97e949a160f8bd7853f2fbf4b959', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-19 17:39:05', '1970-01-01 02:30:00'),
(6, '9a047481964fe4f78ef8bb6c92138a99', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-19 17:39:40', '1970-01-01 02:30:00'),
(7, '1dd70c7358f7e73950a7da8a6bd6dcca', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-20 16:46:21', '1970-01-01 02:30:00'),
(8, '785641a350a24fb1f550a18e177f2a93', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-21 07:13:13', '1970-01-01 02:30:00'),
(9, '715330472372942d4f0e77e83a0d1c98', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-21 07:26:19', '1970-01-01 02:30:00'),
(10, 'e478117bcb5378604b5ad8f337582ba8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-21 07:30:39', '1970-01-01 02:30:00'),
(11, '4765e5d2a4320d9db72acc495e1784f0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-21 08:47:25', '1970-01-01 02:30:00'),
(12, 'aadea351c0eb30d7bda1b516d9672017', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', 'PC: Chrome', '2021-03-21 09:02:49', '1970-01-01 02:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `site_config`
--

DROP TABLE IF EXISTS `site_config`;
CREATE TABLE IF NOT EXISTS `site_config` (
  `site_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL COMMENT 'manufacturer_id identify ccTLD',
  `site_offline` tinyint(1) NOT NULL COMMENT 'site offline in use front',
  `offline_msg` tinyint(1) NOT NULL COMMENT 'offline message show on front side',
  `custom_message` text NOT NULL COMMENT 'if set custom message show on front side',
  `offline_image` text NOT NULL COMMENT 'offline image show on front side',
  `noti_new_order` tinyint(1) NOT NULL COMMENT 'show notification of new order',
  `noti_new_customer` tinyint(1) NOT NULL COMMENT 'show notification of new customer',
  `noti_new_message` tinyint(1) NOT NULL COMMENT 'show notification of new message',
  `custom_page_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `robots` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content_rights` text NOT NULL,
  `modified_by` int(11) NOT NULL COMMENT 'total no. of modified',
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`site_config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='website global configuration';

--
-- Truncate table before insert `site_config`
--

TRUNCATE TABLE `site_config`;
--
-- Dumping data for table `site_config`
--

INSERT INTO `site_config` (`site_config_id`, `manufacturer_id`, `site_offline`, `offline_msg`, `custom_message`, `offline_image`, `noti_new_order`, `noti_new_customer`, `noti_new_message`, `custom_page_title`, `meta_description`, `meta_keyword`, `robots`, `author`, `content_rights`, `modified_by`, `created_date`, `modified_date`) VALUES
(1, 7, 0, 1, 'This site is down for maintenance. Please check back again soon.', 'assets/site_config/9f1b4bc5c99213aa75d9faac0f1a6e951.jpg', 1, 1, 1, 'Meraki Rich Foods', 'Meraki Rich Foods', 'Meraki Rich Foods', 2, 'Meraki Rich Foods', 'Meraki Rich Foods', 6, '2015-03-18 00:38:37', '2019-05-05 12:43:16'),
(3, 8, 0, 1, 'This site is down for maintenance. Please check back after some time.', 'assets/site_config/9f1b4bc5c99213aa75d9faac0f1a6e951.jpg', 1, 1, 1, 'Meraki Rich Foods', 'Meraki Rich Foods', 'Meraki Rich Foods', 2, 'Meraki Rich Foods', 'Meraki Rich Foods', 1, '2015-03-18 00:38:37', '2016-03-04 07:00:02'),
(4, 9, 0, 1, 'This site is down for maintenance. Please check back again soon.', 'assets/site_config/9f1b4bc5c99213aa75d9faac0f1a6e951.jpg', 1, 1, 1, 'Meraki Rich Foods', 'Meraki Rich Foods', 'Meraki Rich Foods', 2, 'Meraki Rich Foods', 'Meraki Rich Foods', 1, '2015-03-18 00:38:37', '2016-03-04 07:00:37');

-- --------------------------------------------------------

--
-- Table structure for table `stock_status`
--

DROP TABLE IF EXISTS `stock_status`;
CREATE TABLE IF NOT EXISTS `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(100) NOT NULL,
  `stock_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-enabled,1-disabled',
  PRIMARY KEY (`stock_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `stock_status`
--

TRUNCATE TABLE `stock_status`;
--
-- Dumping data for table `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `status_name`, `stock_status`) VALUES
(6, '2 - 3 Days', 0),
(7, 'In Stock', 0),
(8, 'Pre-Order', 0),
(10, 'Out Of Stock', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
CREATE TABLE IF NOT EXISTS `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_rate_name` varchar(200) NOT NULL,
  `tax_rate_rate` int(11) NOT NULL,
  `tax_rate_type` varchar(200) NOT NULL,
  `tax_rate_status` int(11) NOT NULL,
  `tax_rate_sort_order` int(11) NOT NULL,
  `tax_rate_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tax_rate_modified_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Truncate table before insert `tax_rate`
--

TRUNCATE TABLE `tax_rate`;
--
-- Dumping data for table `tax_rate`
--

INSERT INTO `tax_rate` (`tax_rate_id`, `tax_rate_name`, `tax_rate_rate`, `tax_rate_type`, `tax_rate_status`, `tax_rate_sort_order`, `tax_rate_created_date`, `tax_rate_modified_date`) VALUES
(1, 'demo', 10, 'Percent', 1, 0, '2013-07-08 10:58:17', '2013-08-23 09:28:10'),
(2, 'test', 200, 'Fix', 1, 0, '2013-07-08 10:59:48', '2013-07-13 09:59:42'),
(3, 'afd', 300, 'Fix', 1, 0, '2013-07-11 11:37:39', '2013-07-13 09:59:09'),
(5, 'sddd', 200, 'Fix', 1, 0, '2013-08-12 09:37:09', '0000-00-00 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
