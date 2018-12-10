-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2018 at 06:44 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.1.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `safefood`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activity_id`, `admin_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Logged In', '2018-12-03 07:31:18', '2018-12-03 07:31:18'),
(2, 1, 'Logged In', '2018-12-03 07:32:01', '2018-12-03 07:32:01'),
(3, 1, 'Logged In', '2018-12-03 09:01:08', '2018-12-03 09:01:08'),
(4, 1, 'Logged In', '2018-12-03 09:54:22', '2018-12-03 09:54:22'),
(5, 1, 'Logged In', '2018-12-03 09:56:30', '2018-12-03 09:56:30');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `password`, `contact_number`, `address`, `is_verified`, `added_by`, `updated_by`, `created_at`, `updated_at`, `status`) VALUES
(1, 'First Admin', 'admin@gmail.com', '1234', '01712345678', '', 1, 1, 0, '2018-11-27 15:39:51', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_category_id` int(11) DEFAULT NULL,
  `company_quality_type_id` int(11) DEFAULT NULL,
  `inspection_id` int(11) DEFAULT NULL,
  `title_english` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_bangla` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_english` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_bangla` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `upazila_id` int(11) NOT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `owner_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_id`, `company_category_id`, `company_quality_type_id`, `inspection_id`, `title_english`, `title_bangla`, `location_english`, `location_bangla`, `division_id`, `district_id`, `upazila_id`, `zip_code`, `latitude`, `longitude`, `owner_name`, `owner_contact_number`, `image`, `is_verified`, `added_by`, `updated_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BFSA181203031217', NULL, 2, 20, 'bfc', 'বিএফসি', 'Plot No.:1, Sector 1, Uttara Tower, Jashimuddin Road, Uttara, Dhaka 1230, Bangladesh', 'উত্তারা', 3, 1, 149, '1230', '23.8609952', '90.3997316', 'Sadik Ahmed', '01912345679', '/public/uploads/company/images/BFSA181203031217.jpg', 1, 1, 1, 1, '2018-12-03 09:59:17', '2018-12-03 12:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `company_categories`
--

CREATE TABLE `company_categories` (
  `company_category_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(500) NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company_quality_types`
--

CREATE TABLE `company_quality_types` (
  `company_quality_types_id` int(10) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_quality_types`
--

INSERT INTO `company_quality_types` (`company_quality_types_id`, `title`, `color`, `description`, `added_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'A+', 'green', 'best', 1, NULL, '2018-11-27 16:26:19', NULL),
(2, 'A', 'blue', 'better', 1, NULL, '2018-11-27 16:27:20', NULL),
(3, 'B', 'yellow', 'good', 1, NULL, '2018-11-27 16:27:20', NULL),
(4, 'c', 'red', 'worst', 1, NULL, '2018-11-27 16:27:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `district_id` int(11) NOT NULL,
  `division_id` int(11) NOT NULL,
  `title_english` varchar(200) NOT NULL,
  `title_bangla` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`district_id`, `division_id`, `title_english`, `title_bangla`, `latitude`, `longitude`, `website`, `added_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 3, 'Dhaka', 'ঢাকা', 23.7115253, 90.4111451, 'www.dhaka.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 3, 'Faridpur', 'ফরিদপুর', 23.6070822, 89.8429406, 'www.faridpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 3, 'Gazipur', 'গাজীপুর', 24.0022858, 90.4264283, 'www.gazipur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 3, 'Gopalganj', 'গোপালগঞ্জ', 23.0050857, 89.8266059, 'www.gopalganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 8, 'Jamalpur', 'জামালপুর', 24.937533, 89.937775, 'www.jamalpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 3, 'Kishoreganj', 'কিশোরগঞ্জ', 24.444937, 90.776575, 'www.kishoreganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 3, 'Madaripur', 'মাদারীপুর', 23.164102, 90.1896805, 'www.madaripur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 3, 'Manikganj', 'মানিকগঞ্জ', 0, 0, 'www.manikganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 3, 'Munshiganj', 'মুন্সিগঞ্জ', 0, 0, 'www.munshiganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 8, 'Mymensingh', 'ময়মনসিংহ', 0, 0, 'www.mymensingh.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 3, 'Narayanganj', 'নারায়াণগঞ্জ', 23.63366, 90.496482, 'www.narayanganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 3, 'Narsingdi', 'নরসিংদী', 23.932233, 90.71541, 'www.narsingdi.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 8, 'Netrokona', 'নেত্রকোণা', 24.870955, 90.727887, 'www.netrokona.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 3, 'Rajbari', 'রাজবাড়ি', 23.7574305, 89.6444665, 'www.rajbari.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 3, 'Shariatpur', 'শরীয়তপুর', 0, 0, 'www.shariatpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 8, 'Sherpur', 'শেরপুর', 25.0204933, 90.0152966, 'www.sherpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 3, 'Tangail', 'টাঙ্গাইল', 0, 0, 'www.tangail.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 5, 'Bogura', 'বগুড়া', 24.8465228, 89.377755, 'www.bogra.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 5, 'Joypurhat', 'জয়পুরহাট', 0, 0, 'www.joypurhat.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 5, 'Naogaon', 'নওগাঁ', 0, 0, 'www.naogaon.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 5, 'Natore', 'নাটোর', 24.420556, 89.000282, 'www.natore.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 5, 'Nawabganj', 'নবাবগঞ্জ', 24.5965034, 88.2775122, 'www.chapainawabganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 5, 'Pabna', 'পাবনা', 23.998524, 89.233645, 'www.pabna.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 5, 'Rajshahi', 'রাজশাহী', 0, 0, 'www.rajshahi.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 5, 'Sirajgonj', 'সিরাজগঞ্জ', 24.4533978, 89.7006815, 'www.sirajganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 6, 'Dinajpur', 'দিনাজপুর', 25.6217061, 88.6354504, 'www.dinajpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 6, 'Gaibandha', 'গাইবান্ধা', 25.328751, 89.528088, 'www.gaibandha.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 6, 'Kurigram', 'কুড়িগ্রাম', 25.805445, 89.636174, 'www.kurigram.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 6, 'Lalmonirhat', 'লালমনিরহাট', 0, 0, 'www.lalmonirhat.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 6, 'Nilphamari', 'নীলফামারী', 25.931794, 88.856006, 'www.nilphamari.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 6, 'Panchagarh', 'পঞ্চগড়', 26.3411, 88.5541606, 'www.panchagarh.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 6, 'Rangpur', 'রংপুর', 25.7558096, 89.244462, 'www.rangpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 6, 'Thakurgaon', 'ঠাকুরগাঁও', 26.0336945, 88.4616834, 'www.thakurgaon.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 1, 'Barguna', 'বরগুনা', 0, 0, 'www.barguna.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 1, 'Barishal', 'বরিশাল', 0, 0, 'www.barisal.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 1, 'Bhola', 'ভোলা', 22.685923, 90.648179, 'www.bhola.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 1, 'Jhalokati', 'ঝালকাঠি', 0, 0, 'www.jhalakathi.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 1, 'Patuakhali', 'পটুয়াখালী', 22.3596316, 90.3298712, 'www.patuakhali.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 1, 'Pirojpur', 'পিরোজপুর', 0, 0, 'www.pirojpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 2, 'Bandarban', 'বান্দরবান', 22.1953275, 92.2183773, 'www.bandarban.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 2, 'Brahmanbaria', 'ব্রাহ্মণবাড়িয়া', 23.9570904, 91.1119286, 'www.brahmanbaria.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 2, 'Chandpur', 'চাঁদপুর', 23.2332585, 90.6712912, 'www.chandpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 2, 'Chattogram', 'চট্টগ্রাম', 22.335109, 91.834073, 'www.chittagong.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 2, 'Cumilla', 'কুমিল্লা', 23.4682747, 91.1788135, 'www.comilla.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 2, 'Cox\'s Bazar', 'কক্স বাজার', 0, 0, 'www.coxsbazar.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 2, 'Feni', 'ফেনী', 23.023231, 91.3840844, 'www.feni.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 2, 'Khagrachari', 'খাগড়াছড়ি', 23.119285, 91.984663, 'www.khagrachhari.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 2, 'Lakshmipur', 'লক্ষ্মীপুর', 22.942477, 90.841184, 'www.lakshmipur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 2, 'Noakhali', 'নোয়াখালী', 22.869563, 91.099398, 'www.noakhali.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 2, 'Rangamati', 'রাঙ্গামাটি', 0, 0, 'www.rangamati.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 7, 'Habiganj', 'হবিগঞ্জ', 24.374945, 91.41553, 'www.habiganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 7, 'Maulvibazar', 'মৌলভীবাজার', 24.482934, 91.777417, 'www.moulvibazar.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 7, 'Sunamganj', 'সুনামগঞ্জ', 25.0658042, 91.3950115, 'www.sunamganj.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 7, 'Sylhet', 'সিলেট', 24.8897956, 91.8697894, 'www.sylhet.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 4, 'Bagerhat', 'বাগেরহাট', 22.651568, 89.785938, 'www.bagerhat.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 4, 'Chuadanga', 'চুয়াডাঙ্গা', 23.6401961, 88.841841, 'www.chuadanga.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 4, 'Jashore', 'যশোর', 23.16643, 89.2081126, 'www.jessore.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 4, 'Jhenaidah', 'ঝিনাইদহ', 23.5448176, 89.1539213, 'www.jhenaidah.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 4, 'Khulna', 'খুলনা', 22.815774, 89.568679, 'www.khulna.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 4, 'Kushtia', 'কুষ্টিয়া', 23.901258, 89.120482, 'www.kushtia.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 4, 'Magura', 'মাগুরা', 23.487337, 89.419956, 'www.magura.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 4, 'Meherpur', 'মেহেরপুর', 23.762213, 88.631821, 'www.meherpur.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 4, 'Narail', 'নড়াইল', 23.172534, 89.512672, 'www.narail.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 4, 'Satkhira', 'সাতক্ষীরা', 0, 0, 'www.satkhira.gov.bd', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `divisions`
--

CREATE TABLE `divisions` (
  `division_id` int(11) NOT NULL,
  `title_english` varchar(200) NOT NULL,
  `title_bangla` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `divisions`
--

INSERT INTO `divisions` (`division_id`, `title_english`, `title_bangla`, `added_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Barishal', 'বরিশাল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Chattogram', 'চট্টগ্রাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Dhaka', 'ঢাকা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Khulna', 'খুলনা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Rajshahi', 'রাজশাহী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Rangpur', 'রংপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Sylhet', 'সিলেট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Mymensingh', 'ময়মনসিংহ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `feedback_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inspections`
--

CREATE TABLE `inspections` (
  `inspection_id` int(10) NOT NULL,
  `company_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inspection_date` date NOT NULL,
  `next_inspection` date NOT NULL,
  `quality_category` int(11) NOT NULL,
  `inspected_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inspected_by_designation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `added_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inspections`
--

INSERT INTO `inspections` (`inspection_id`, `company_id`, `inspection_date`, `next_inspection`, `quality_category`, `inspected_by`, `inspected_by_designation`, `notes`, `is_verified`, `added_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(19, 'BFSA181203031217', '2018-11-13', '2019-05-13', 1, 'Salam', 'magistrate', 'best', 1, 1, NULL, '2018-12-03 11:22:34', '2018-12-03 11:22:34'),
(20, 'BFSA181203031217', '2018-12-03', '2019-03-03', 2, 'Hassan', 'magistrate', 'demotion', 1, 1, NULL, '2018-12-03 11:25:51', '2018-12-03 11:25:51');

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `login_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(191) NOT NULL,
  `rating` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upazilas`
--

CREATE TABLE `upazilas` (
  `upazila_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `title_english` varchar(200) NOT NULL,
  `title_bangla` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `updated_by` int(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `upazilas`
--

INSERT INTO `upazilas` (`upazila_id`, `district_id`, `title_english`, `title_bangla`, `added_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 34, 'Amtali Upazila', 'আমতলী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 34, 'Bamna Upazila', 'বামনা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 34, 'Barguna Sadar Upazila', 'বরগুনা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 34, 'Betagi Upazila', 'বেতাগি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 34, 'Patharghata Upazila', 'পাথরঘাটা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 34, 'Taltali Upazila', 'তালতলী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 35, 'Muladi Upazila', 'মুলাদি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 35, 'Babuganj Upazila', 'বাবুগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 35, 'Agailjhara Upazila', 'আগাইলঝরা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 35, 'Barisal Sadar Upazila', 'বরিশাল সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 35, 'Bakerganj Upazila', 'বাকেরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 35, 'Banaripara Upazila', 'বানাড়িপারা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 35, 'Gaurnadi Upazila', 'গৌরনদী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 35, 'Hizla Upazila', 'হিজলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 35, 'Mehendiganj Upazila', 'মেহেদিগঞ্জ ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 35, 'Wazirpur Upazila', 'ওয়াজিরপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 36, 'Bhola Sadar Upazila', 'ভোলা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 36, 'Burhanuddin Upazila', 'বুরহানউদ্দিন', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 36, 'Char Fasson Upazila', 'চর ফ্যাশন', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 36, 'Daulatkhan Upazila', 'দৌলতখান', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 36, 'Lalmohan Upazila', 'লালমোহন', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 36, 'Manpura Upazila', 'মনপুরা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 36, 'Tazumuddin Upazila', 'তাজুমুদ্দিন', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 37, 'Jhalokati Sadar Upazila', 'ঝালকাঠি সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 37, 'Kathalia Upazila', 'কাঁঠালিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 37, 'Nalchity Upazila', 'নালচিতি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 37, 'Rajapur Upazila', 'রাজাপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 38, 'Bauphal Upazila', 'বাউফল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 38, 'Dashmina Upazila', 'দশমিনা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 38, 'Galachipa Upazila', 'গলাচিপা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 38, 'Kalapara Upazila', 'কালাপারা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 38, 'Mirzaganj Upazila', 'মির্জাগঞ্জ ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 38, 'Patuakhali Sadar Upazila', 'পটুয়াখালী সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 38, 'Dumki Upazila', 'ডুমকি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 38, 'Rangabali Upazila', 'রাঙ্গাবালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 39, 'Bhandaria', 'ভ্যান্ডারিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 39, 'Kaukhali', 'কাউখালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 39, 'Mathbaria', 'মাঠবাড়িয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 39, 'Nazirpur', 'নাজিরপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 39, 'Nesarabad', 'নেসারাবাদ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 39, 'Pirojpur Sadar', 'পিরোজপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 39, 'Zianagar', 'জিয়ানগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 40, 'Bandarban Sadar', 'বান্দরবন সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 40, 'Thanchi', 'থানচি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 40, 'Lama', 'লামা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 40, 'Naikhongchhari', 'নাইখংছড়ি ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 40, 'Ali kadam', 'আলী কদম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 40, 'Rowangchhari', 'রউয়াংছড়ি ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 40, 'Ruma', 'রুমা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 41, 'Brahmanbaria Sadar Upazila', 'ব্রাহ্মণবাড়িয়া সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 41, 'Ashuganj Upazila', 'আশুগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 41, 'Nasirnagar Upazila', 'নাসির নগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 41, 'Nabinagar Upazila', 'নবীনগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 41, 'Sarail Upazila', 'সরাইল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 41, 'Shahbazpur Town', 'শাহবাজপুর টাউন', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 41, 'Kasba Upazila', 'কসবা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 41, 'Akhaura Upazila', 'আখাউরা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 41, 'Bancharampur Upazila', 'বাঞ্ছারামপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 41, 'Bijoynagar Upazila', 'বিজয় নগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 42, 'Chandpur Sadar', 'চাঁদপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 42, 'Faridganj', 'ফরিদগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 42, 'Haimchar', 'হাইমচর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 42, 'Haziganj', 'হাজীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 42, 'Kachua', 'কচুয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 42, 'Matlab Uttar', 'মতলব উত্তর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 42, 'Matlab Dakkhin', 'মতলব দক্ষিণ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 42, 'Shahrasti', 'শাহরাস্তি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 43, 'Anwara Upazila', 'আনোয়ারা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 43, 'Banshkhali Upazila', 'বাশখালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 43, 'Boalkhali Upazila', 'বোয়ালখালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 43, 'Chandanaish Upazila', 'চন্দনাইশ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 43, 'Fatikchhari Upazila', 'ফটিকছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 43, 'Hathazari Upazila', 'হাঠহাজারী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 43, 'Lohagara Upazila', 'লোহাগারা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 43, 'Mirsharai Upazila', 'মিরসরাই', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 43, 'Patiya Upazila', 'পটিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 43, 'Rangunia Upazila', 'রাঙ্গুনিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 43, 'Raozan Upazila', 'রাউজান', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 43, 'Sandwip Upazila', 'সন্দ্বীপ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 43, 'Satkania Upazila', 'সাতকানিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 43, 'Sitakunda Upazila', 'সীতাকুণ্ড', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 44, 'Barura Upazila', 'বড়ুরা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 44, 'Brahmanpara Upazila', 'ব্রাহ্মণপাড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 44, 'Burichong Upazila', 'বুড়িচং', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 44, 'Chandina Upazila', 'চান্দিনা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 44, 'Chauddagram Upazila', 'চৌদ্দগ্রাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 44, 'Daudkandi Upazila', 'দাউদকান্দি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 44, 'Debidwar Upazila', 'দেবীদ্বার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 44, 'Homna Upazila', 'হোমনা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 44, 'Comilla Sadar Upazila', 'কুমিল্লা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 44, 'Laksam Upazila', 'লাকসাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 44, 'Monohorgonj Upazila', 'মনোহরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 44, 'Meghna Upazila', 'মেঘনা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 44, 'Muradnagar Upazila', 'মুরাদনগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 44, 'Nangalkot Upazila', 'নাঙ্গালকোট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 44, 'Comilla Sadar South Upazila', 'কুমিল্লা সদর দক্ষিণ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 44, 'Titas Upazila', 'তিতাস', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 45, 'Chakaria Upazila', 'চকরিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 45, 'Cox\'s Bazar Sadar Upazila', 'কক্স বাজার সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 45, 'Kutubdia Upazila', 'কুতুবদিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 45, 'Maheshkhali Upazila', 'মহেশখালী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 45, 'Ramu Upazila', 'রামু', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 45, 'Teknaf Upazila', 'টেকনাফ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 45, 'Ukhia Upazila', 'উখিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 45, 'Pekua Upazila', 'পেকুয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 46, 'Feni Sadar', 'ফেনী সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 46, 'Chagalnaiya', 'ছাগল নাইয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 46, 'Daganbhyan', 'দাগানভিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 46, 'Parshuram', 'পরশুরাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 46, 'Fhulgazi', 'ফুলগাজি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 46, 'Sonagazi', 'সোনাগাজি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 47, 'Dighinala Upazila', 'দিঘিনালা ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 47, 'Khagrachhari Upazila', 'খাগড়াছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 47, 'Lakshmichhari Upazila', 'লক্ষ্মীছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 47, 'Mahalchhari Upazila', 'মহলছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 47, 'Manikchhari Upazila', 'মানিকছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 47, 'Matiranga Upazila', 'মাটিরাঙ্গা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 47, 'Panchhari Upazila', 'পানছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 47, 'Ramgarh Upazila', 'রামগড়', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 48, 'Lakshmipur Sadar Upazila', 'লক্ষ্মীপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 48, 'Raipur Upazila', 'রায়পুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 48, 'Ramganj Upazila', 'রামগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 48, 'Ramgati Upazila', 'রামগতি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 48, 'Komol Nagar Upazila', 'কমল নগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 49, 'Noakhali Sadar Upazila', 'নোয়াখালী সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 49, 'Begumganj Upazila', 'বেগমগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 49, 'Chatkhil Upazila', 'চাটখিল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 49, 'Companyganj Upazila', 'কোম্পানীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 49, 'Shenbag Upazila', 'শেনবাগ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 49, 'Hatia Upazila', 'হাতিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 49, 'Kobirhat Upazila', 'কবিরহাট ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 49, 'Sonaimuri Upazila', 'সোনাইমুরি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 49, 'Suborno Char Upazila', 'সুবর্ণ চর ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 50, 'Rangamati Sadar Upazila', 'রাঙ্গামাটি সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 50, 'Belaichhari Upazila', 'বেলাইছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 50, 'Bagaichhari Upazila', 'বাঘাইছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 50, 'Barkal Upazila', 'বরকল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 50, 'Juraichhari Upazila', 'জুরাইছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 50, 'Rajasthali Upazila', 'রাজাস্থলি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 50, 'Kaptai Upazila', 'কাপ্তাই', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 50, 'Langadu Upazila', 'লাঙ্গাডু', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 50, 'Nannerchar Upazila', 'নান্নেরচর ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 50, 'Kaukhali Upazila', 'কাউখালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 1, 'Dhamrai Upazila', 'ধামরাই', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 1, 'Dohar Upazila', 'দোহার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 1, 'Keraniganj Upazila', 'কেরানীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 1, 'Nawabganj Upazila', 'নবাবগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 1, 'Savar Upazila', 'সাভার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 2, 'Faridpur Sadar Upazila', 'ফরিদপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 2, 'Boalmari Upazila', 'বোয়ালমারী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 2, 'Alfadanga Upazila', 'আলফাডাঙ্গা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 2, 'Madhukhali Upazila', 'মধুখালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 2, 'Bhanga Upazila', 'ভাঙ্গা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 2, 'Nagarkanda Upazila', 'নগরকান্ড', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 2, 'Charbhadrasan Upazila', 'চরভদ্রাসন ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 2, 'Sadarpur Upazila', 'সদরপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 2, 'Shaltha Upazila', 'শালথা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 3, 'Gazipur Sadar-Joydebpur', 'গাজীপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 3, 'Kaliakior', 'কালিয়াকৈর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 3, 'Kapasia', 'কাপাসিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 3, 'Sripur', 'শ্রীপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 3, 'Kaliganj', 'কালীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 3, 'Tongi', 'টঙ্গি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 4, 'Gopalganj Sadar Upazila', 'গোপালগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 4, 'Kashiani Upazila', 'কাশিয়ানি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 4, 'Kotalipara Upazila', 'কোটালিপাড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 4, 'Muksudpur Upazila', 'মুকসুদপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 4, 'Tungipara Upazila', 'টুঙ্গিপাড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 5, 'Dewanganj Upazila', 'দেওয়ানগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 5, 'Baksiganj Upazila', 'বকসিগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 5, 'Islampur Upazila', 'ইসলামপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 5, 'Jamalpur Sadar Upazila', 'জামালপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 5, 'Madarganj Upazila', 'মাদারগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 5, 'Melandaha Upazila', 'মেলানদাহা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 5, 'Sarishabari Upazila', 'সরিষাবাড়ি ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 5, 'Narundi Police I.C', 'নারুন্দি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 6, 'Astagram Upazila', 'অষ্টগ্রাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 6, 'Bajitpur Upazila', 'বাজিতপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 6, 'Bhairab Upazila', 'ভৈরব', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 6, 'Hossainpur Upazila', 'হোসেনপুর ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 6, 'Itna Upazila', 'ইটনা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 6, 'Karimganj Upazila', 'করিমগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 6, 'Katiadi Upazila', 'কতিয়াদি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 6, 'Kishoreganj Sadar Upazila', 'কিশোরগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 6, 'Kuliarchar Upazila', 'কুলিয়ারচর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 6, 'Mithamain Upazila', 'মিঠামাইন', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 6, 'Nikli Upazila', 'নিকলি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 6, 'Pakundia Upazila', 'পাকুন্ডা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 6, 'Tarail Upazila', 'তাড়াইল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 7, 'Madaripur Sadar', 'মাদারীপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 7, 'Kalkini', 'কালকিনি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 7, 'Rajoir', 'রাজইর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 7, 'Shibchar', 'শিবচর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 8, 'Manikganj Sadar Upazila', 'মানিকগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 8, 'Singair Upazila', 'সিঙ্গাইর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 8, 'Shibalaya Upazila', 'শিবালয়', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 8, 'Saturia Upazila', 'সাঠুরিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 8, 'Harirampur Upazila', 'হরিরামপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 8, 'Ghior Upazila', 'ঘিওর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 8, 'Daulatpur Upazila', 'দৌলতপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 9, 'Lohajang Upazila', 'লোহাজং', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 9, 'Sreenagar Upazila', 'শ্রীনগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 9, 'Munshiganj Sadar Upazila', 'মুন্সিগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 9, 'Sirajdikhan Upazila', 'সিরাজদিখান', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 9, 'Tongibari Upazila', 'টঙ্গিবাড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 9, 'Gazaria Upazila', 'গজারিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 10, 'Bhaluka', 'ভালুকা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 10, 'Trishal', 'ত্রিশাল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 10, 'Haluaghat', 'হালুয়াঘাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 10, 'Muktagachha', 'মুক্তাগাছা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 10, 'Dhobaura', 'ধবারুয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 10, 'Fulbaria', 'ফুলবাড়িয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 10, 'Gaffargaon', 'গফরগাঁও', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 10, 'Gauripur', 'গৌরিপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 10, 'Ishwarganj', 'ঈশ্বরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 10, 'Mymensingh Sadar', 'ময়মনসিং সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 10, 'Nandail', 'নন্দাইল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 10, 'Phulpur', 'ফুলপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 11, 'Araihazar Upazila', 'আড়াইহাজার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 11, 'Sonargaon Upazila', 'সোনারগাঁও', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 11, 'Bandar', 'বান্দার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 11, 'Naryanganj Sadar Upazila', 'নারায়ানগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 11, 'Rupganj Upazila', 'রূপগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 11, 'Siddirgonj Upazila', 'সিদ্ধিরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 12, 'Belabo Upazila', 'বেলাবো', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 12, 'Monohardi Upazila', 'মনোহরদি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 12, 'Narsingdi Sadar Upazila', 'নরসিংদী সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 12, 'Palash Upazila', 'পলাশ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 12, 'Raipura Upazila, Narsingdi', 'রায়পুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 12, 'Shibpur Upazila', 'শিবপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 13, 'Kendua Upazilla', 'কেন্দুয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 13, 'Atpara Upazilla', 'আটপাড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 13, 'Barhatta Upazilla', 'বরহাট্টা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 13, 'Durgapur Upazilla', 'দুর্গাপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 13, 'Kalmakanda Upazilla', 'কলমাকান্দা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 13, 'Madan Upazilla', 'মদন', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 13, 'Mohanganj Upazilla', 'মোহনগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 13, 'Netrakona-S Upazilla', 'নেত্রকোনা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 13, 'Purbadhala Upazilla', 'পূর্বধলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 13, 'Khaliajuri Upazilla', 'খালিয়াজুরি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 14, 'Baliakandi Upazila', 'বালিয়াকান্দি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 14, 'Goalandaghat Upazila', 'গোয়ালন্দ ঘাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 14, 'Pangsha Upazila', 'পাংশা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 14, 'Kalukhali Upazila', 'কালুখালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 14, 'Rajbari Sadar Upazila', 'রাজবাড়ি সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 15, 'Shariatpur Sadar -Palong', 'শরীয়তপুর সদর ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 15, 'Damudya Upazila', 'দামুদিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 15, 'Naria Upazila', 'নড়িয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 15, 'Jajira Upazila', 'জাজিরা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 15, 'Bhedarganj Upazila', 'ভেদারগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 15, 'Gosairhat Upazila', 'গোসাইর হাট ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 16, 'Jhenaigati Upazila', 'ঝিনাইগাতি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 16, 'Nakla Upazila', 'নাকলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 16, 'Nalitabari Upazila', 'নালিতাবাড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 16, 'Sherpur Sadar Upazila', 'শেরপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 16, 'Sreebardi Upazila', 'শ্রীবরদি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 17, 'Tangail Sadar Upazila', 'টাঙ্গাইল সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 17, 'Sakhipur Upazila', 'সখিপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 17, 'Basail Upazila', 'বসাইল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 17, 'Madhupur Upazila', 'মধুপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 17, 'Ghatail Upazila', 'ঘাটাইল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 17, 'Kalihati Upazila', 'কালিহাতি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 17, 'Nagarpur Upazila', 'নগরপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 17, 'Mirzapur Upazila', 'মির্জাপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 17, 'Gopalpur Upazila', 'গোপালপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 17, 'Delduar Upazila', 'দেলদুয়ার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 17, 'Bhuapur Upazila', 'ভুয়াপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 17, 'Dhanbari Upazila', 'ধানবাড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 55, 'Bagerhat Sadar Upazila', 'বাগেরহাট সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 55, 'Chitalmari Upazila', 'চিতলমাড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 55, 'Fakirhat Upazila', 'ফকিরহাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 55, 'Kachua Upazila', 'কচুয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 55, 'Mollahat Upazila', 'মোল্লাহাট ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 55, 'Mongla Upazila', 'মংলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 55, 'Morrelganj Upazila', 'মরেলগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 55, 'Rampal Upazila', 'রামপাল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 55, 'Sarankhola Upazila', 'স্মরণখোলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 56, 'Damurhuda Upazila', 'দামুরহুদা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 56, 'Chuadanga-S Upazila', 'চুয়াডাঙ্গা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 56, 'Jibannagar Upazila', 'জীবন নগর ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 56, 'Alamdanga Upazila', 'আলমডাঙ্গা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 57, 'Abhaynagar Upazila', 'অভয়নগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 57, 'Keshabpur Upazila', 'কেশবপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 57, 'Bagherpara Upazila', 'বাঘের পাড়া ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 57, 'Jessore Sadar Upazila', 'যশোর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 57, 'Chaugachha Upazila', 'চৌগাছা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 57, 'Manirampur Upazila', 'মনিরামপুর ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 57, 'Jhikargachha Upazila', 'ঝিকরগাছা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 57, 'Sharsha Upazila', 'সারশা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 58, 'Jhenaidah Sadar Upazila', 'ঝিনাইদহ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 58, 'Maheshpur Upazila', 'মহেশপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 58, 'Kaliganj Upazila', 'কালীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 58, 'Kotchandpur Upazila', 'কোট চাঁদপুর ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 58, 'Shailkupa Upazila', 'শৈলকুপা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 58, 'Harinakunda Upazila', 'হাড়িনাকুন্দা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 59, 'Terokhada Upazila', 'তেরোখাদা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 59, 'Batiaghata Upazila', 'বাটিয়াঘাটা ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 59, 'Dacope Upazila', 'ডাকপে', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 59, 'Dumuria Upazila', 'ডুমুরিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 59, 'Dighalia Upazila', 'দিঘলিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 59, 'Koyra Upazila', 'কয়ড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 59, 'Paikgachha Upazila', 'পাইকগাছা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 59, 'Phultala Upazila', 'ফুলতলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 59, 'Rupsa Upazila', 'রূপসা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 60, 'Kushtia Sadar', 'কুষ্টিয়া সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 60, 'Kumarkhali', 'কুমারখালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 60, 'Daulatpur', 'দৌলতপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 60, 'Mirpur', 'মিরপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 60, 'Bheramara', 'ভেরামারা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 60, 'Khoksa', 'খোকসা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 61, 'Magura Sadar Upazila', 'মাগুরা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 61, 'Mohammadpur Upazila', 'মোহাম্মাদপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 61, 'Shalikha Upazila', 'শালিখা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 61, 'Sreepur Upazila', 'শ্রীপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 62, 'angni Upazila', 'আংনি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 62, 'Mujib Nagar Upazila', 'মুজিব নগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 62, 'Meherpur-S Upazila', 'মেহেরপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 63, 'Narail-S Upazilla', 'নড়াইল সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 63, 'Lohagara Upazilla', 'লোহাগাড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 63, 'Kalia Upazilla', 'কালিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 64, 'Satkhira Sadar Upazila', 'সাতক্ষীরা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 64, 'Assasuni Upazila', 'আসসাশুনি ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 64, 'Debhata Upazila', 'দেভাটা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 64, 'Tala Upazila', 'তালা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 64, 'Kalaroa Upazila', 'কলরোয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 64, 'Kaliganj Upazila', 'কালীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 64, 'Shyamnagar Upazila', 'শ্যামনগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 18, 'Adamdighi', 'আদমদিঘী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 18, 'Bogra Sadar', 'বগুড়া সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 18, 'Sherpur', 'শেরপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 18, 'Dhunat', 'ধুনট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 18, 'Dhupchanchia', 'দুপচাচিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 18, 'Gabtali', 'গাবতলি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 18, 'Kahaloo', 'কাহালু', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 18, 'Nandigram', 'নন্দিগ্রাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 18, 'Sahajanpur', 'শাহজাহানপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 18, 'Sariakandi', 'সারিয়াকান্দি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, 18, 'Shibganj', 'শিবগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, 18, 'Sonatala', 'সোনাতলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, 19, 'Joypurhat S', 'জয়পুরহাট সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, 19, 'Akkelpur', 'আক্কেলপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, 19, 'Kalai', 'কালাই', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, 19, 'Khetlal', 'খেতলাল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, 19, 'Panchbibi', 'পাঁচবিবি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, 20, 'Naogaon Sadar Upazila', 'নওগাঁ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, 20, 'Mohadevpur Upazila', 'মহাদেবপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, 20, 'Manda Upazila', 'মান্দা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, 20, 'Niamatpur Upazila', 'নিয়ামতপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, 20, 'Atrai Upazila', 'আত্রাই', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, 20, 'Raninagar Upazila', 'রাণীনগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, 20, 'Patnitala Upazila', 'পত্নীতলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, 20, 'Dhamoirhat Upazila', 'ধামইরহাট ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, 20, 'Sapahar Upazila', 'সাপাহার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(355, 20, 'Porsha Upazila', 'পোরশা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, 20, 'Badalgachhi Upazila', 'বদলগাছি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, 21, 'Natore Sadar Upazila', 'নাটোর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(358, 21, 'Baraigram Upazila', 'বড়াইগ্রাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, 21, 'Bagatipara Upazila', 'বাগাতিপাড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(360, 21, 'Lalpur Upazila', 'লালপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, 21, 'Natore Sadar Upazila', 'নাটোর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, 21, 'Baraigram Upazila', 'বড়াই গ্রাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, 22, 'Bholahat Upazila', 'ভোলাহাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, 22, 'Gomastapur Upazila', 'গোমস্তাপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, 22, 'Nachole Upazila', 'নাচোল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, 22, 'Nawabganj Sadar Upazila', 'নবাবগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, 22, 'Shibganj Upazila', 'শিবগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, 23, 'Atgharia Upazila', 'আটঘরিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, 23, 'Bera Upazila', 'বেড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, 23, 'Bhangura Upazila', 'ভাঙ্গুরা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, 23, 'Chatmohar Upazila', 'চাটমোহর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, 23, 'Faridpur Upazila', 'ফরিদপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, 23, 'Ishwardi Upazila', 'ঈশ্বরদী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, 23, 'Pabna Sadar Upazila', 'পাবনা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, 23, 'Santhia Upazila', 'সাথিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, 23, 'Sujanagar Upazila', 'সুজানগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, 24, 'Bagha', 'বাঘা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, 24, 'Bagmara', 'বাগমারা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, 24, 'Charghat', 'চারঘাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, 24, 'Durgapur', 'দুর্গাপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, 24, 'Godagari', 'গোদাগারি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, 24, 'Mohanpur', 'মোহনপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, 24, 'Paba', 'পবা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(384, 24, 'Puthia', 'পুঠিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, 24, 'Tanore', 'তানোর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, 25, 'Sirajganj Sadar Upazila', 'সিরাজগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(387, 25, 'Belkuchi Upazila', 'বেলকুচি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, 25, 'Chauhali Upazila', 'চৌহালি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, 25, 'Kamarkhanda Upazila', 'কামারখান্দা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, 25, 'Kazipur Upazila', 'কাজীপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, 25, 'Raiganj Upazila', 'রায়গঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, 25, 'Shahjadpur Upazila', 'শাহজাদপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, 25, 'Tarash Upazila', 'তারাশ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, 25, 'Ullahpara Upazila', 'উল্লাপাড়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, 26, 'Birampur Upazila', 'বিরামপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, 26, 'Birganj', 'বীরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, 26, 'Biral Upazila', 'বিড়াল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, 26, 'Bochaganj Upazila', 'বোচাগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, 26, 'Chirirbandar Upazila', 'চিরিরবন্দর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, 26, 'Phulbari Upazila', 'ফুলবাড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, 26, 'Ghoraghat Upazila', 'ঘোড়াঘাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, 26, 'Hakimpur Upazila', 'হাকিমপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, 26, 'Kaharole Upazila', 'কাহারোল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, 26, 'Khansama Upazila', 'খানসামা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, 26, 'Dinajpur Sadar Upazila', 'দিনাজপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, 26, 'Nawabganj', 'নবাবগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, 26, 'Parbatipur Upazila', 'পার্বতীপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, 27, 'Fulchhari', 'ফুলছড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(409, 27, 'Gaibandha sadar', 'গাইবান্ধা সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(410, 27, 'Gobindaganj', 'গোবিন্দগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, 27, 'Palashbari', 'পলাশবাড়ী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, 27, 'Sadullapur', 'সাদুল্যাপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, 27, 'Saghata', 'সাঘাটা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(414, 27, 'Sundarganj', 'সুন্দরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, 28, 'Kurigram Sadar', 'কুড়িগ্রাম সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, 28, 'Nageshwari', 'নাগেশ্বরী', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, 28, 'Bhurungamari', 'ভুরুঙ্গামারি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, 28, 'Phulbari', 'ফুলবাড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, 28, 'Rajarhat', 'রাজারহাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(420, 28, 'Ulipur', 'উলিপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(421, 28, 'Chilmari', 'চিলমারি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, 28, 'Rowmari', 'রউমারি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, 28, 'Char Rajibpur', 'চর রাজিবপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, 29, 'Lalmanirhat Sadar', 'লালমনিরহাট সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, 29, 'Aditmari', 'আদিতমারি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, 29, 'Kaliganj', 'কালীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(427, 29, 'Hatibandha', 'হাতিবান্ধা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, 29, 'Patgram', 'পাটগ্রাম', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, 30, 'Nilphamari Sadar', 'নীলফামারী সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, 30, 'Saidpur', 'সৈয়দপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, 30, 'Jaldhaka', 'জলঢাকা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, 30, 'Kishoreganj', 'কিশোরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, 30, 'Domar', 'ডোমার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(434, 30, 'Dimla', 'ডিমলা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, 31, 'Panchagarh Sadar', 'পঞ্চগড় সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, 31, 'Debiganj', 'দেবীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, 31, 'Boda', 'বোদা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(438, 31, 'Atwari', 'আটোয়ারি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, 31, 'Tetulia', 'তেতুলিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, 32, 'Badarganj', 'বদরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, 32, 'Mithapukur', 'মিঠাপুকুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, 32, 'Gangachara', 'গঙ্গাচরা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, 32, 'Kaunia', 'কাউনিয়া', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, 32, 'Rangpur Sadar', 'রংপুর সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, 32, 'Pirgachha', 'পীরগাছা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, 32, 'Pirganj', 'পীরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, 32, 'Taraganj', 'তারাগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, 33, 'Thakurgaon Sadar Upazila', 'ঠাকুরগাঁও সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, 33, 'Pirganj Upazila', 'পীরগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, 33, 'Baliadangi Upazila', 'বালিয়াডাঙ্গি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, 33, 'Haripur Upazila', 'হরিপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, 33, 'Ranisankail Upazila', 'রাণীসংকইল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, 51, 'Ajmiriganj', 'আজমিরিগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, 51, 'Baniachang', 'বানিয়াচং', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, 51, 'Bahubal', 'বাহুবল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, 51, 'Chunarughat', 'চুনারুঘাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, 51, 'Habiganj Sadar', 'হবিগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, 51, 'Lakhai', 'লাক্ষাই', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(459, 51, 'Madhabpur', 'মাধবপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, 51, 'Nabiganj', 'নবীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, 51, 'Shaistagonj Upazila', 'শায়েস্তাগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, 52, 'Moulvibazar Sadar', 'মৌলভীবাজার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, 52, 'Barlekha', 'বড়লেখা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, 52, 'Juri', 'জুড়ি', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, 52, 'Kamalganj', 'কামালগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, 52, 'Kulaura', 'কুলাউরা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, 52, 'Rajnagar', 'রাজনগর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, 52, 'Sreemangal', 'শ্রীমঙ্গল', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, 53, 'Bishwamvarpur', 'বিসশম্ভারপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, 53, 'Chhatak', 'ছাতক', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, 53, 'Derai', 'দেড়াই', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, 53, 'Dharampasha', 'ধরমপাশা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, 53, 'Dowarabazar', 'দোয়ারাবাজার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, 53, 'Jagannathpur', 'জগন্নাথপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, 53, 'Jamalganj', 'জামালগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, 53, 'Sulla', 'সুল্লা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, 53, 'Sunamganj Sadar', 'সুনামগঞ্জ সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, 53, 'Shanthiganj', 'শান্তিগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(479, 53, 'Tahirpur', 'তাহিরপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, 54, 'Sylhet Sadar', 'সিলেট সদর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, 54, 'Beanibazar', 'বেয়ানিবাজার', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, 54, 'Bishwanath', 'বিশ্বনাথ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, 54, 'Dakshin Surma Upazila', 'দক্ষিণ সুরমা', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, 54, 'Balaganj', 'বালাগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, 54, 'Companiganj', 'কোম্পানিগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, 54, 'Fenchuganj', 'ফেঞ্চুগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, 54, 'Golapganj', 'গোলাপগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, 54, 'Gowainghat', 'গোয়াইনঘাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, 54, 'Jaintiapur', 'জয়ন্তপুর', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, 54, 'Kanaighat', 'কানাইঘাট', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, 54, 'Zakiganj', 'জাকিগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, 54, 'Nobigonj', 'নবীগঞ্জ', NULL, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_verified` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_contact_number_unique` (`contact_number`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title_english` (`title_english`),
  ADD UNIQUE KEY `title_bangla` (`title_bangla`),
  ADD KEY `division_id` (`division_id`),
  ADD KEY `upazila_id` (`upazila_id`),
  ADD KEY `company_category_id` (`company_category_id`),
  ADD KEY `company_quality_type_id` (`company_quality_type_id`),
  ADD KEY `inspection_id` (`inspection_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `district_id` (`district_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `company_categories`
--
ALTER TABLE `company_categories`
  ADD PRIMARY KEY (`company_category_id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `company_quality_types`
--
ALTER TABLE `company_quality_types`
  ADD PRIMARY KEY (`company_quality_types_id`),
  ADD UNIQUE KEY `categorys_title_unique` (`title`),
  ADD UNIQUE KEY `color` (`color`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `division_id` (`division_id`);

--
-- Indexes for table `divisions`
--
ALTER TABLE `divisions`
  ADD PRIMARY KEY (`division_id`),
  ADD UNIQUE KEY `title_english` (`title_english`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `title_bangla` (`title_bangla`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `inspections`
--
ALTER TABLE `inspections`
  ADD PRIMARY KEY (`inspection_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD PRIMARY KEY (`upazila_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_contact_number_unique` (`contact_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company_categories`
--
ALTER TABLE `company_categories`
  MODIFY `company_category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_quality_types`
--
ALTER TABLE `company_quality_types`
  MODIFY `company_quality_types_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `divisions`
--
ALTER TABLE `divisions`
  MODIFY `division_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `feedbacks`
--
ALTER TABLE `feedbacks`
  MODIFY `feedback_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inspections`
--
ALTER TABLE `inspections`
  MODIFY `inspection_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `upazilas`
--
ALTER TABLE `upazilas`
  MODIFY `upazila_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=493;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_2` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`division_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_ibfk_3` FOREIGN KEY (`upazila_id`) REFERENCES `upazilas` (`upazila_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_ibfk_4` FOREIGN KEY (`company_category_id`) REFERENCES `company_categories` (`company_category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_ibfk_5` FOREIGN KEY (`company_quality_type_id`) REFERENCES `company_quality_types` (`company_quality_types_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_ibfk_6` FOREIGN KEY (`inspection_id`) REFERENCES `inspections` (`inspection_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_ibfk_7` FOREIGN KEY (`added_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_ibfk_8` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `companies_ibfk_9` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_categories`
--
ALTER TABLE `company_categories`
  ADD CONSTRAINT `company_categories_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_categories_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `company_quality_types`
--
ALTER TABLE `company_quality_types`
  ADD CONSTRAINT `company_quality_types_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `company_quality_types_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `districts_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `districts_ibfk_3` FOREIGN KEY (`division_id`) REFERENCES `divisions` (`division_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `divisions`
--
ALTER TABLE `divisions`
  ADD CONSTRAINT `divisions_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `divisions_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inspections`
--
ALTER TABLE `inspections`
  ADD CONSTRAINT `inspections_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inspections_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `upazilas`
--
ALTER TABLE `upazilas`
  ADD CONSTRAINT `upazilas_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `upazilas_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `admins` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `upazilas_ibfk_3` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
