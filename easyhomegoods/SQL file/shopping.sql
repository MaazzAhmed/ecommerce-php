-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2024 at 09:14 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', '2024-03-03 10:08:02', '04-03-2024 11:09:41 AM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(12, 'Video Games', 'Video Games', '2024-03-05 14:16:47', NULL),
(13, 'TV and Video', 'Tv & video', '2024-03-06 07:09:59', '06-03-2024 08:20:26 AM'),
(14, 'Smart Home', 'Smart Home', '2024-03-06 07:37:10', NULL),
(15, 'Headphones', 'Headphones', '2024-03-06 07:58:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contactus`
--

CREATE TABLE `contactus` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `subject` varchar(250) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(36, 12, 19, 'XB1 Xbox Series S', 'Xbox', 126, 130, 'DSADS ADSD', 'xbox1.jpeg', 'xbox2.jpeg', 'xbox3.webp', 33, 'In Stock', '2024-03-06 06:17:52', NULL),
(37, 12, 19, 'XBOX ONE 500GB GAME CONSOLE BLACK 5C5-00025', 'Xbox', 200, 120, '<div class=\"expand-collapse-header flex justify-between items-center w-100\" style=\"box-sizing: border-box; display: flex; align-items: center; justify-content: space-between; width: 859.328px;\"><h3 aria-hidden=\"false\" class=\"w-100 ma0 pa3 f5 lh-copy normal\" style=\"box-sizing: border-box; font-weight: 400; line-height: 1.5; width: 819.328px; padding: 1rem; margin-bottom: 0px; font-size: 1rem;\">Product details</h3><div class=\"pr3\" style=\"box-sizing: border-box; padding-right: 1rem;\"><button class=\"bg-transparent bn lh-solid pa0 sans-serif tc underline inline-button black pointer f6 bw0 bg-white pt3\" type=\"button\" aria-expanded=\"true\" aria-label=\"Product details\" style=\"box-sizing: inherit; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 0.875rem; line-height: 1; overflow: visible; border-style: none; border-width: 0px; color: rgb(0, 0, 0); padding: 1rem 0px 0px; text-decoration-line: underline;\"><span class=\"ld ld-ChevronUp pa0\" style=\"box-sizing: content-box; -webkit-font-smoothing: antialiased; display: inline-block; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 1.5rem; line-height: 1; font-family: ui-icons; padding: 0px; vertical-align: -0.25em; width: 1.5rem; height: 1.5rem;\"></span></button></div></div><div class=\"w_rNem expand-collapse-content\" data-testid=\"ui-collapse-panel\" style=\"box-sizing: border-box; overflow-y: hidden; transition: height 0.3s linear 0s; width: 859.328px; height: auto;\"><div class=\"ph3 pb4 pt1\" style=\"box-sizing: border-box; padding: 0.25rem 1rem 1.5rem;\"><div class=\"nb3\" data-testid=\"product-description-content\" style=\"box-sizing: border-box; margin-bottom: -1rem;\"><div class=\"mb3\" style=\"box-sizing: border-box; margin-bottom: 1rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><span class=\"b f6 mid-gray lh-copy lh-title overflow-visible db w_V_DM\" style=\"box-sizing: inherit; -webkit-box-orient: vertical; display: block; overflow: visible; font-weight: 700; line-height: 1.5; color: rgb(70, 71, 74); font-size: 0.875rem; padding-bottom: 0em; margin-bottom: 0em;\"><div class=\"dangerous-html mb3\" style=\"box-sizing: border-box; margin-bottom: 1rem;\"><br style=\"box-sizing: inherit;\">• Powerful hardware provides stunning, true-to-life graphics<br style=\"box-sizing: inherit;\">• Play with millions of other gamers across the web with Xbox Live<br style=\"box-sizing: inherit;\">• Jump seamlessly between your favourite game, TV show or movie<br style=\"box-sizing: inherit;\">• 10/100/1000 Mbps Gigabit Ethernet<br style=\"box-sizing: inherit;\">• AMD Radeon Graphics Core Next Engine<br style=\"box-sizing: inherit;\"></div><div><br></div></span></div><div class=\"mb3\" style=\"box-sizing: border-box; margin-bottom: 1rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><span class=\"f6 mid-gray lh-title overflow-visible db w_V_DM\" style=\"box-sizing: inherit; -webkit-box-orient: vertical; display: block; overflow: visible; line-height: 1.25; color: rgb(70, 71, 74); font-size: 0.875rem; padding-bottom: 0em; margin-bottom: 0em;\"><div class=\"dangerous-html mb3\" style=\"box-sizing: border-box; margin-bottom: 1rem;\"><ul style=\"box-sizing: border-box; margin-bottom: 1rem; margin-top: 1rem; padding-left: 1.5rem;\"></ul></div></span></div></div></div></div>', 'xboxone-1.webp', 'xboxone-2.webp', 'xboxone-3.webp', 5, 'In Stock', '2024-03-06 06:31:35', NULL),
(38, 12, 20, ' Sony PlayStation 4 Pro', 'Sony', 229, 233, '<div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Manufacturer Part Number</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">CUH-7015B</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Data Storage</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">1 TB</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Is Smart</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">Y</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Inputs &amp; Outputs</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">HDMI Cable</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Video Game Platform</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">PlayStation 4</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Age Group</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">Adult</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Maximum Video Resolution</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">4K</span></div></div><div class=\"\" style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Number of Controllers</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">1</span></div></div>', 'playstation.webp', 'playstation.webp', 'playstation.webp', 10, 'In Stock', '2024-03-06 07:03:41', NULL),
(39, 12, 20, 'PlayStation 5 Slim Disc Version', 'Sony', 499, 500, '<h3 aria-hidden=\"false\" class=\"w-100 ma0 pa3 f5 lh-copy normal\" style=\"box-sizing: border-box; line-height: 1.5; width: 819.328px; padding: 1rem; margin-bottom: 0px; font-size: 1rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">Product details</h3><div><span style=\"color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\">PlayStation 5 Slim Disc Console with 1TB PCIe Gen 4 NVNe SSD Storage x 1</span><br style=\"box-sizing: inherit; color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\"><span style=\"color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\">DS Wireless Gaming Controller x 2</span><br style=\"box-sizing: inherit; color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\"><span style=\"color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\">HDMI cable x 1</span><br style=\"box-sizing: inherit; color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\"><span style=\"color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\">AC power cord x 1</span><br style=\"box-sizing: inherit; color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\"><span style=\"color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\">USB cable x 1</span><br style=\"box-sizing: inherit; color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\"><span style=\"color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\">User Manual x 1</span><p style=\"box-sizing: border-box; color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\">* JP Version Hardware Region Free Console.</p><p style=\"box-sizing: border-box; color: rgb(70, 71, 74); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 700;\">* PS operating system is stored on the internal storage drive, a portion of the storage capacity is reserved for the OS and system files.</p></div>', 'playstation5.webp', 'playstation5-1.webp', 'playstation5-2.webp', 10, 'In Stock', '2024-03-06 07:07:01', NULL),
(40, 13, 21, ' Crystal UHD 4K Smart Television UN55CU7000BXZA', 'Samsung', 99, 109, '<br>', 'sam1.webp', 'sam2.webp', 'sam3.webp', 10, 'In Stock', '2024-03-06 07:16:32', NULL),
(41, 13, 21, 'VIZIO 50\"  4K UHD LED Smart TV V505-J09', 'VIZIO', 110, 116, '<div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 1;\">Screen size</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 2;\">50 in</div><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 3;\">Platform</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 4;\">VIZIO Home</div><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 5;\">Resolution</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 6;\">4K UHD<br></div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 6;\"><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(81, 83, 87); order: 1;\">Display</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; order: 2;\">LED</div><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(81, 83, 87); order: 3;\">Refresh rate</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; order: 4;\">60 Hz</div><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(81, 83, 87); order: 5;\">Aspect</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; order: 6;\">16:9</div></div>', 'vizio.jpeg', 'vizio1.jpeg', 'vizio2.jpeg', 10, 'In Stock', '2024-03-06 07:26:45', NULL),
(42, 13, 22, 'HONPOW 4K Support Portable Mini Projector with Wifi/Bluetooth/Speaker', 'Honpow', 89, 0, '<div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 1;\">Is cordless</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 2;\">Y</div><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 3;\">Color</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 4;\">White</div><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 5;\">Dimensions</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 6;\">13.19 x 9.25 x 4.53 Inches</div>', 'honpow.webp', 'honpow1.webp', 'honpow2.webp', 5, 'In Stock', '2024-03-06 07:30:16', NULL),
(43, 13, 22, 'Towond 120inch Projector Screen', 'Towond', 59, 65, '<div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Manufacturer Part Number</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">TWD-120-SMALL</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Model</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">TWD-120-SMALL</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Brand</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">TOWOND</span></div></div><div class=\"\" style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Assembled Product Dimensions (L x W x H)</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">7.68 x 7.28 x 16.77 Inches</span></div></div>', 'Towond.webp', 'Towond1.webp', 'Towond2.webp', 0, 'In Stock', '2024-03-06 07:33:05', NULL),
(44, 14, 23, 'TP-Link Deco Wi-Fi 6E', 'TP-Link ', 150, 160, '<div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 1;\">Transfer rate</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 2;\">5.4 Gbps</div><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 3;\">Inputs/Outputs</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 4;\">RJ45</div><div class=\"b mv1\" style=\"box-sizing: border-box; font-weight: 700; margin-bottom: 0.25rem; margin-top: 0.25rem; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); color: rgb(81, 83, 87); order: 5;\">Router type</div><div class=\"ml3 mv1\" style=\"box-sizing: border-box; margin-left: 1rem; margin-bottom: 0.25rem; margin-top: 0.25rem; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; background-color: rgb(248, 248, 248); order: 6;\">Mesh Router</div>', 'tplink.webp', 'tplink1.webp', 'tplink2.webp', 0, 'In Stock', '2024-03-06 07:40:28', NULL),
(45, 14, 23, 'Orbi Whole Home Tri-Band Mesh WiFi 6 System (RBK652S)', 'NETGEAR ', 120, 150, '<div class=\"expand-collapse-header flex justify-between items-center w-100\" style=\"box-sizing: border-box; display: flex; align-items: center; justify-content: space-between; width: 859.328px; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h2 aria-hidden=\"false\" class=\"w-100 ma0 pa3 f5 lh-copy normal undefined\" style=\"box-sizing: border-box; font-weight: 400; line-height: 1.5; width: 819.328px; padding: 1rem; margin-bottom: 0px; font-size: 1rem;\">Specifications</h2><div class=\"pr3\" style=\"box-sizing: border-box; padding-right: 1rem;\"><button class=\"bg-transparent bn lh-solid pa0 sans-serif tc underline inline-button black pointer f6 bw0 bg-white pt3\" type=\"button\" aria-expanded=\"true\" aria-label=\"Specifications\" style=\"box-sizing: inherit; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 0.875rem; line-height: 1; overflow: visible; border-style: none; border-width: 0px; color: rgb(0, 0, 0); padding: 1rem 0px 0px; text-decoration-line: underline;\"><span class=\"ld ld-ChevronUp pa0\" style=\"box-sizing: content-box; -webkit-font-smoothing: antialiased; display: inline-block; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 1.5rem; line-height: 1; font-family: ui-icons; padding: 0px; vertical-align: -0.25em; width: 1.5rem; height: 1.5rem;\"></span></button></div></div><div class=\"w_rNem expand-collapse-content\" data-testid=\"ui-collapse-panel\" style=\"box-sizing: border-box; overflow-y: hidden; transition: height 0.3s linear 0s; width: 859.328px; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium; height: auto;\"><div class=\"ph3 pb4 pt1\" style=\"box-sizing: border-box; padding: 0.25rem 1rem 1.5rem;\"><div class=\"nt1\" style=\"box-sizing: border-box; margin-top: -0.25rem;\"><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Manufacturer Part Number</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">RBK652S-100NAS</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Assembled Product Weight</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">6.65 lb</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Brand</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">NETGEAR</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Features</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">No features description available</span></div></div></div></div></div>', 'NETGEAR.webp', 'NETGEAR1.webp', 'NETGEAR2.webp', 5, 'In Stock', '2024-03-06 07:48:07', NULL),
(46, 14, 24, 'BLUELK Smart Door Lock, Fingerprint Door Lock Knob with App Control, Suitable for Home', 'BLUELK', 39, 50, '<div class=\"expand-collapse-header flex justify-between items-center w-100\" style=\"box-sizing: border-box; display: flex; align-items: center; justify-content: space-between; width: 859.328px; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h2 aria-hidden=\"false\" class=\"w-100 ma0 pa3 f5 lh-copy normal undefined\" style=\"box-sizing: border-box; font-weight: 400; line-height: 1.5; width: 819.328px; padding: 1rem; margin-bottom: 0px; font-size: 1rem;\">Specifications</h2><div class=\"pr3\" style=\"box-sizing: border-box; padding-right: 1rem;\"><button class=\"bg-transparent bn lh-solid pa0 sans-serif tc underline inline-button black pointer f6 bw0 bg-white pt3\" type=\"button\" aria-expanded=\"true\" aria-label=\"Specifications\" style=\"box-sizing: inherit; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 0.875rem; line-height: 1; overflow: visible; border-style: none; border-width: 0px; color: rgb(0, 0, 0); padding: 1rem 0px 0px; text-decoration-line: underline;\"><span class=\"ld ld-ChevronUp pa0\" style=\"box-sizing: content-box; -webkit-font-smoothing: antialiased; display: inline-block; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 1.5rem; line-height: 1; font-family: ui-icons; padding: 0px; vertical-align: -0.25em; width: 1.5rem; height: 1.5rem;\"></span></button></div></div><div class=\"w_rNem expand-collapse-content\" data-testid=\"ui-collapse-panel\" style=\"box-sizing: border-box; overflow-y: hidden; transition: height 0.3s linear 0s; width: 859.328px; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium; height: auto;\"><div class=\"ph3 pb4 pt1\" style=\"box-sizing: border-box; padding: 0.25rem 1rem 1.5rem;\"><div class=\"nt1\" style=\"box-sizing: border-box; margin-top: -0.25rem;\"><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Features</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">Smart Door Lock, Electronic Door Lock, Bluetooth Door Lock, Keyless Door Lock, Smart Home Door Lock, Smart Lock for Home, Wireless Door Lock, Remote Control Door Lock, Touchscreen Door Lock</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Brand</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">Bluelk</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Manufacturer</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">GANEN</span></div></div><div class=\"\" style=\"box-sizing: border-box;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Manufacturer Part Number</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">K10</span></div></div></div></div></div>', 'BLUELK.webp', 'BLUELK2.webp', 'BLUELK3.webp', 10, 'In Stock', '2024-03-06 07:53:26', NULL),
(47, 15, 25, 'AirPods Pro (2nd generation) ', 'Apple', 450, 500, '<div class=\"expand-collapse-header flex justify-between items-center w-100\" style=\"box-sizing: border-box; display: flex; align-items: center; justify-content: space-between; width: 859.328px; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium;\"><h2 aria-hidden=\"false\" class=\"w-100 ma0 pa3 f5 lh-copy normal undefined\" style=\"box-sizing: border-box; font-weight: 400; line-height: 1.5; width: 819.328px; padding: 1rem; margin-bottom: 0px; font-size: 1rem;\">Specifications</h2><div class=\"pr3\" style=\"box-sizing: border-box; padding-right: 1rem;\"><button class=\"bg-transparent bn lh-solid pa0 sans-serif tc underline inline-button black pointer f6 bw0 bg-white pt3\" type=\"button\" aria-expanded=\"true\" aria-label=\"Specifications\" style=\"box-sizing: inherit; font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 0.875rem; line-height: 1; overflow: visible; border-style: none; border-width: 0px; color: rgb(0, 0, 0); padding: 1rem 0px 0px; text-decoration-line: underline;\"><span class=\"ld ld-ChevronUp pa0\" style=\"box-sizing: content-box; -webkit-font-smoothing: antialiased; display: inline-block; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 1.5rem; line-height: 1; font-family: ui-icons; padding: 0px; vertical-align: -0.25em; width: 1.5rem; height: 1.5rem;\"></span></button></div></div><div class=\"w_rNem expand-collapse-content\" data-testid=\"ui-collapse-panel\" style=\"box-sizing: border-box; overflow-y: hidden; transition: height 0.3s linear 0s; width: 859.328px; color: rgb(0, 0, 0); font-family: Bogle, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: medium; height: auto;\"><div class=\"ph3 pb4 pt1\" style=\"box-sizing: border-box; padding: 0.25rem 1rem 1.5rem;\"><div class=\"nt1\" style=\"box-sizing: border-box; margin-top: -0.25rem;\"><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Recommended Use</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">Casual Listening, Sports</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Power Type</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">Battery</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Features</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">Dust-Resistant, Sweat Resistant, Water-Resistant</span></div></div><div class=\"pb2\" style=\"box-sizing: border-box; padding-bottom: 0.5rem;\"><h3 class=\"flex items-center mv0 lh-copy f5 pb1 dark-gray\" style=\"box-sizing: border-box; display: flex; align-items: center; line-height: 1.5; color: rgb(46, 47, 50); padding-bottom: 0.25rem; margin-bottom: 0px; font-size: 1rem;\">Brand</h3><div class=\"mv0 lh-copy mid-gray f6\" style=\"box-sizing: border-box; line-height: 1.5; color: rgb(70, 71, 74); margin-bottom: 0px; margin-top: 0px; font-size: 0.875rem;\"><span style=\"box-sizing: inherit;\">Apple</span></div></div></div></div></div>', 'AirPods.webp', 'AirPods1.webp', 'AirPods2.webp', 10, 'In Stock', '2024-03-06 08:00:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(19, 12, 'Xbox', '2024-03-05 14:17:08', NULL),
(20, 12, 'PlayStation', '2024-03-06 07:01:59', NULL),
(21, 13, 'Smart TVs', '2024-03-06 07:10:49', NULL),
(22, 13, 'Projector & screens', '2024-03-06 07:27:39', NULL),
(23, 14, 'Routers', '2024-03-06 07:38:22', NULL),
(24, 14, 'Smart Door Locks', '2024-03-06 07:51:07', NULL),
(25, 15, 'AirPods', '2024-03-06 07:58:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `authenticationkey` varchar(255) NOT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactus`
--
ALTER TABLE `contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `contactus`
--
ALTER TABLE `contactus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
