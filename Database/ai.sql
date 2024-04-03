-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2024 at 02:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ai`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Role` varchar(255) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `Username`, `Password`, `Name`, `Role`) VALUES
(1, 'admin1', '1234', 'admin North', 'admin'),
(3, 'admin', '1234', 'admin steve', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add admin', 8, 'add_admin'),
(30, 'Can change admin', 8, 'change_admin'),
(31, 'Can delete admin', 8, 'delete_admin'),
(32, 'Can view admin', 8, 'view_admin'),
(33, 'Can add text_mood', 9, 'add_text_mood'),
(34, 'Can change text_mood', 9, 'change_text_mood'),
(35, 'Can delete text_mood', 9, 'delete_text_mood'),
(36, 'Can view text_mood', 9, 'view_text_mood'),
(37, 'Can add type_mood', 10, 'add_type_mood'),
(38, 'Can change type_mood', 10, 'change_type_mood'),
(39, 'Can delete type_mood', 10, 'delete_type_mood'),
(40, 'Can view type_mood', 10, 'view_type_mood'),
(41, 'Can add face_detect', 11, 'add_face_detect'),
(42, 'Can change face_detect', 11, 'change_face_detect'),
(43, 'Can delete face_detect', 11, 'delete_face_detect'),
(44, 'Can view face_detect', 11, 'view_face_detect'),
(45, 'Can add user_db', 12, 'add_user_db'),
(46, 'Can change user_db', 12, 'change_user_db'),
(47, 'Can delete user_db', 12, 'delete_user_db'),
(48, 'Can view user_db', 12, 'view_user_db');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'myapp', 'admin'),
(11, 'myapp', 'face_detect'),
(9, 'myapp', 'text_mood'),
(10, 'myapp', 'type_mood'),
(7, 'myapp', 'user'),
(12, 'myapp', 'user_db'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-10 17:48:34.466472'),
(2, 'auth', '0001_initial', '2024-02-10 17:48:42.140767'),
(3, 'admin', '0001_initial', '2024-02-10 17:48:43.965796'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-02-10 17:48:44.005926'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-10 17:48:44.059919'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-02-10 17:48:44.670860'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-02-10 17:48:45.902664'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-02-10 17:48:46.208364'),
(9, 'auth', '0004_alter_user_username_opts', '2024-02-10 17:48:46.239374'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-02-10 17:48:47.420148'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-02-10 17:48:47.449294'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-02-10 17:48:47.535973'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-02-10 17:48:47.645028'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-02-10 17:48:47.716384'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-02-10 17:48:47.824718'),
(16, 'auth', '0011_update_proxy_permissions', '2024-02-10 17:48:47.856034'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-02-10 17:48:47.949184'),
(18, 'myapp', '0001_initial', '2024-02-10 17:48:48.156538'),
(19, 'myapp', '0002_user_name_user_role', '2024-02-10 17:48:48.349695'),
(20, 'myapp', '0003_rename_name_user_name_rename_password_user_password_and_more', '2024-02-10 17:48:48.599607'),
(21, 'myapp', '0004_alter_user_table', '2024-02-10 17:48:48.743971'),
(22, 'myapp', '0005_alter_user_table', '2024-02-10 17:48:48.932186'),
(23, 'myapp', '0006_admin_remove_user_name_remove_user_password_and_more', '2024-02-10 17:49:45.655485'),
(24, 'myapp', '0007_text_mood_type_mood', '2024-02-10 17:49:46.288320'),
(25, 'sessions', '0001_initial', '2024-02-10 17:49:46.642233'),
(26, 'myapp', '0008_face_detect', '2024-02-11 16:16:19.064853'),
(27, 'myapp', '0009_user_db_delete_user', '2024-02-12 13:09:10.563121');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `face_detect`
--

CREATE TABLE `face_detect` (
  `id` bigint(20) NOT NULL,
  `big_img_path` varchar(255) NOT NULL,
  `small_img_path` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `Eng_name` varchar(255) NOT NULL,
  `mood_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `face_detect`
--

INSERT INTO `face_detect` (`id`, `big_img_path`, `small_img_path`, `date`, `time`, `Eng_name`, `mood_type`) VALUES
(1919, '/Full/b_Anuthep_Kumseam-2024-04-01-21-34-16-286170.png', '/Face/s_Anuthep_Kumseam-2024-04-01-21-34-16-286170.png', '2024-04-01', '21:34:16.286170', 'Anuthep_Kumseam', 'Neutral'),
(1920, '/Full/b_Anuthep_Kumseam-2024-04-01-21-34-46-076195.png', '/Face/s_Anuthep_Kumseam-2024-04-01-21-34-46-076195.png', '2024-04-01', '21:34:46.076195', 'Anuthep_Kumseam', 'Neutral'),
(1921, '/Full/b_Anuthep_Kumseam-2024-04-01-21-35-13-501118.png', '/Face/s_Anuthep_Kumseam-2024-04-01-21-35-13-501118.png', '2024-04-01', '21:35:13.501118', 'Anuthep_Kumseam', 'Happy'),
(1922, '/Full/b_Anuthep_Kumseam-2024-04-01-21-35-22-696526.png', '/Face/s_Anuthep_Kumseam-2024-04-01-21-35-22-696526.png', '2024-04-01', '21:35:22.696526', 'Anuthep_Kumseam', 'Happy'),
(1923, '/Full/b_Anuthep_Kumseam-2024-04-01-21-35-37-888817.png', '/Face/s_Anuthep_Kumseam-2024-04-01-21-35-37-888817.png', '2024-04-01', '21:35:37.888817', 'Anuthep_Kumseam', 'Neutral'),
(1924, '/Full/b_Anuthep_Kumseam-2024-04-01-21-35-56-896397.png', '/Face/s_Anuthep_Kumseam-2024-04-01-21-35-56-896397.png', '2024-04-01', '21:35:56.896397', 'Anuthep_Kumseam', 'Neutral'),
(1925, '/Full/b_Anuthep_Kumseam-2024-04-01-21-36-01-940687.png', '/Face/s_Anuthep_Kumseam-2024-04-01-21-36-01-940687.png', '2024-04-01', '21:36:01.940687', 'Anuthep_Kumseam', 'Happy'),
(1926, '/Full/b_Anuthep_Kumseam-2024-04-01-21-36-10-427106.png', '/Face/s_Anuthep_Kumseam-2024-04-01-21-36-10-427106.png', '2024-04-01', '21:36:10.427106', 'Anuthep_Kumseam', 'Neutral'),
(1927, '/Full/b_Anuthep_Kumseam-2024-04-02-10-38-11-623133.png', '/Face/s_Anuthep_Kumseam-2024-04-02-10-38-11-623133.png', '2024-04-02', '10:38:11.623133', 'Anuthep_Kumseam', 'Neutral'),
(1928, '/Full/b_Anuthep_Kumseam-2024-04-02-10-39-36-276206.png', '/Face/s_Anuthep_Kumseam-2024-04-02-10-39-36-276206.png', '2024-04-02', '10:39:36.276206', 'Anuthep_Kumseam', 'Neutral'),
(1929, '/Full/b_Anuthep_Kumseam-2024-04-02-10-39-54-059971.png', '/Face/s_Anuthep_Kumseam-2024-04-02-10-39-54-059971.png', '2024-04-02', '10:39:54.059971', 'Anuthep_Kumseam', 'Neutral'),
(1930, '/Full/b_Anuthep_Kumseam-2024-04-02-11-39-51-330033.png', '/Face/s_Anuthep_Kumseam-2024-04-02-11-39-51-330033.png', '2024-04-02', '11:39:51.330033', 'Anuthep_Kumseam', 'Neutral'),
(1931, '/Full/b_Anuthep_Kumseam-2024-04-02-11-40-03-267599.png', '/Face/s_Anuthep_Kumseam-2024-04-02-11-40-03-267599.png', '2024-04-02', '11:40:03.267599', 'Anuthep_Kumseam', 'Angry'),
(1932, '/Full/b_Anuthep_Kumseam-2024-04-02-11-40-05-100347.png', '/Face/s_Anuthep_Kumseam-2024-04-02-11-40-05-100347.png', '2024-04-02', '11:40:05.100347', 'Anuthep_Kumseam', 'Neutral'),
(1933, '/Full/b_Anuthep_Kumseam-2024-04-02-11-40-38-999209.png', '/Face/s_Anuthep_Kumseam-2024-04-02-11-40-38-999209.png', '2024-04-02', '11:40:38.999209', 'Anuthep_Kumseam', 'Neutral'),
(1934, '/Full/b_Anuthep_Kumseam-2024-04-02-11-41-18-567687.png', '/Face/s_Anuthep_Kumseam-2024-04-02-11-41-18-567687.png', '2024-04-02', '11:41:18.567687', 'Anuthep_Kumseam', 'Angry'),
(1935, '/Full/b_Anuthep_Kumseam-2024-04-02-11-42-19-198591.png', '/Face/s_Anuthep_Kumseam-2024-04-02-11-42-19-198591.png', '2024-04-02', '11:42:19.198591', 'Anuthep_Kumseam', 'Neutral'),
(1936, '/Full/b_Anuthep_Kumseam-2024-04-02-12-05-59-341077.png', '/Face/s_Anuthep_Kumseam-2024-04-02-12-05-59-341077.png', '2024-04-02', '12:05:59.341077', 'Anuthep_Kumseam', 'Angry'),
(1937, '/Full/b_Anuthep_Kumseam-2024-04-02-12-06-10-894295.png', '/Face/s_Anuthep_Kumseam-2024-04-02-12-06-10-894295.png', '2024-04-02', '12:06:10.894295', 'Anuthep_Kumseam', 'Angry'),
(1938, '/Full/b_Anuthep_Kumseam-2024-04-02-12-06-23-164584.png', '/Face/s_Anuthep_Kumseam-2024-04-02-12-06-23-164584.png', '2024-04-02', '12:06:23.164584', 'Anuthep_Kumseam', 'Angry'),
(1939, '/Full/b_Anuthep_Kumseam-2024-04-02-12-06-44-759361.png', '/Face/s_Anuthep_Kumseam-2024-04-02-12-06-44-759361.png', '2024-04-02', '12:06:44.759361', 'Anuthep_Kumseam', 'Neutral'),
(1940, '/Full/b_Anuthep_Kumseam-2024-04-02-12-06-53-221032.png', '/Face/s_Anuthep_Kumseam-2024-04-02-12-06-53-221032.png', '2024-04-02', '12:06:53.221032', 'Anuthep_Kumseam', 'Angry'),
(1941, '/Full/b_Anuthep_Kumseam-2024-04-02-12-07-03-971264.png', '/Face/s_Anuthep_Kumseam-2024-04-02-12-07-03-971264.png', '2024-04-02', '12:07:03.971264', 'Anuthep_Kumseam', 'Neutral'),
(1942, '/Full/b_Anuthep_Kumseam-2024-04-02-12-07-35-369544.png', '/Face/s_Anuthep_Kumseam-2024-04-02-12-07-35-369544.png', '2024-04-02', '12:07:35.369544', 'Anuthep_Kumseam', 'Angry'),
(1943, '/Full/b_Anuthep_Kumseam-2024-04-02-14-17-40-771241.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-17-40-771241.png', '2024-04-02', '14:17:40.771241', 'Anuthep_Kumseam', 'Happy'),
(1944, '/Full/b_Anuthep_Kumseam-2024-04-02-14-17-47-128387.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-17-47-128387.png', '2024-04-02', '14:17:47.128387', 'Anuthep_Kumseam', 'Neutral'),
(1945, '/Full/b_Anuthep_Kumseam-2024-04-02-14-18-01-475819.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-18-01-475819.png', '2024-04-02', '14:18:01.475819', 'Anuthep_Kumseam', 'Neutral'),
(1946, '/Full/b_Anuthep_Kumseam-2024-04-02-14-18-03-442753.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-18-03-442753.png', '2024-04-02', '14:18:03.442753', 'Anuthep_Kumseam', 'Angry'),
(1947, '/Full/b_Anuthep_Kumseam-2024-04-02-14-40-03-899056.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-40-03-899056.png', '2024-04-02', '14:40:03.899056', 'Anuthep_Kumseam', 'Neutral'),
(1948, '/Full/b_Anuthep_Kumseam-2024-04-02-14-41-31-055884.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-41-31-055884.png', '2024-04-02', '14:41:31.055884', 'Anuthep_Kumseam', 'Happy'),
(1949, '/Full/b_Anuthep_Kumseam-2024-04-02-14-43-08-175988.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-43-08-175988.png', '2024-04-02', '14:43:08.175988', 'Anuthep_Kumseam', 'Happy'),
(1950, '/Full/b_unknown-2024-04-02-14-53-07-761198.png', '/Face/s_unknown-2024-04-02-14-53-07-761198.png', '2024-04-02', '14:53:07.761198', 'unknown', 'Happy'),
(1951, '/Full/b_Anuthep_Kumseam-2024-04-02-14-53-32-083705.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-53-32-083705.png', '2024-04-02', '14:53:32.083705', 'Anuthep_Kumseam', 'Neutral'),
(1952, '/Full/b_Anuthep_Kumseam-2024-04-02-14-54-30-498755.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-54-30-498755.png', '2024-04-02', '14:54:30.498755', 'Anuthep_Kumseam', 'Angry'),
(1953, '/Full/b_Anuthep_Kumseam-2024-04-02-14-57-14-231975.png', '/Face/s_Anuthep_Kumseam-2024-04-02-14-57-14-231975.png', '2024-04-02', '14:57:14.231975', 'Anuthep_Kumseam', 'Neutral'),
(1954, '/Full/b_Anuthep_Kumseam-2024-04-02-15-00-21-982079.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-00-21-982079.png', '2024-04-02', '15:00:21.982079', 'Anuthep_Kumseam', 'Happy'),
(1955, '/Full/b_Anuthep_Kumseam-2024-04-02-15-02-41-354796.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-02-41-354796.png', '2024-04-02', '15:02:41.354796', 'Anuthep_Kumseam', 'Neutral'),
(1956, '/Full/b_Anuthep_Kumseam-2024-04-02-15-12-35-612586.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-12-35-612586.png', '2024-04-02', '15:12:35.612586', 'Anuthep_Kumseam', 'Neutral'),
(1957, '/Full/b_Anuthep_Kumseam-2024-04-02-15-12-39-304450.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-12-39-304450.png', '2024-04-02', '15:12:39.304450', 'Anuthep_Kumseam', 'Neutral'),
(1958, '/Full/b_Anuthep_Kumseam-2024-04-02-15-13-33-259050.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-13-33-259050.png', '2024-04-02', '15:13:33.259050', 'Anuthep_Kumseam', 'Neutral'),
(1959, '/Full/b_Anuthep_Kumseam-2024-04-02-15-14-26-253190.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-14-26-253190.png', '2024-04-02', '15:14:26.253190', 'Anuthep_Kumseam', 'Neutral'),
(1960, '/Full/b_Anuthep_Kumseam-2024-04-02-15-14-49-140626.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-14-49-140626.png', '2024-04-02', '15:14:49.140626', 'Anuthep_Kumseam', 'Neutral'),
(1961, '/Full/b_Anuthep_Kumseam-2024-04-02-15-14-56-258004.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-14-56-258004.png', '2024-04-02', '15:14:56.258004', 'Anuthep_Kumseam', 'Neutral'),
(1962, '/Full/b_Anuthep_Kumseam-2024-04-02-15-15-04-955621.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-15-04-955621.png', '2024-04-02', '15:15:04.955621', 'Anuthep_Kumseam', 'Neutral'),
(1963, '/Full/b_Anuthep_Kumseam-2024-04-02-15-15-19-155578.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-15-19-155578.png', '2024-04-02', '15:15:19.155578', 'Anuthep_Kumseam', 'Neutral'),
(1964, '/Full/b_Anuthep_Kumseam-2024-04-02-15-15-33-698741.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-15-33-698741.png', '2024-04-02', '15:15:33.698741', 'Anuthep_Kumseam', 'Neutral'),
(1965, '/Full/b_Anuthep_Kumseam-2024-04-02-15-18-39-260900.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-18-39-260900.png', '2024-04-02', '15:18:39.260900', 'Anuthep_Kumseam', 'Neutral'),
(1966, '/Full/b_Anuthep_Kumseam-2024-04-02-15-19-04-914372.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-19-04-914372.png', '2024-04-02', '15:19:04.914372', 'Anuthep_Kumseam', 'Neutral'),
(1967, '/Full/b_Anuthep_Kumseam-2024-04-02-15-19-10-566175.png', '/Face/s_Anuthep_Kumseam-2024-04-02-15-19-10-566175.png', '2024-04-02', '15:19:10.566175', 'Anuthep_Kumseam', 'Neutral'),
(1968, '/Full/b_Anuthep_Kumseam-2024-04-02-16-25-41-817292.png', '/Face/s_Anuthep_Kumseam-2024-04-02-16-25-41-817292.png', '2024-04-02', '16:25:41.817292', 'Anuthep_Kumseam', 'Angry'),
(1969, '/Full/b_Anuthep_Kumseam-2024-04-02-16-26-49-110647.png', '/Face/s_Anuthep_Kumseam-2024-04-02-16-26-49-110647.png', '2024-04-02', '16:26:49.110647', 'Anuthep_Kumseam', 'Neutral'),
(1970, '/Full/b_Anuthep_Kumseam-2024-04-02-16-27-57-764721.png', '/Face/s_Anuthep_Kumseam-2024-04-02-16-27-57-764721.png', '2024-04-02', '16:27:57.764721', 'Anuthep_Kumseam', 'Angry'),
(1971, '/Full/b_unknown-2024-04-02-16-29-07-610417.png', '/Face/s_unknown-2024-04-02-16-29-07-610417.png', '2024-04-02', '16:29:07.610417', 'unknown', 'Sad'),
(1972, '/Full/b_unknown-2024-04-02-16-29-30-475228.png', '/Face/s_unknown-2024-04-02-16-29-30-475228.png', '2024-04-02', '16:29:30.475228', 'unknown', 'Neutral'),
(1973, '/Full/b_Anuthep_Kumseam-2024-04-02-16-29-57-640693.png', '/Face/s_Anuthep_Kumseam-2024-04-02-16-29-57-640693.png', '2024-04-02', '16:29:57.640693', 'Anuthep_Kumseam', 'Neutral'),
(1974, '/Full/b_Anuthep_Kumseam-2024-04-02-16-30-14-380026.png', '/Face/s_Anuthep_Kumseam-2024-04-02-16-30-14-380026.png', '2024-04-02', '16:30:14.380026', 'Anuthep_Kumseam', 'Angry'),
(1975, '/Full/b_Anuthep_Kumseam-2024-04-02-19-40-53-691854.png', '/Face/s_Anuthep_Kumseam-2024-04-02-19-40-53-691854.png', '2024-04-02', '19:40:53.691854', 'Anuthep_Kumseam', 'Happy'),
(1976, '/Full/b_Anuthep_Kumseam-2024-04-02-21-52-20-183531.png', '/Face/s_Anuthep_Kumseam-2024-04-02-21-52-20-183531.png', '2024-04-02', '21:52:20.183531', 'Anuthep_Kumseam', 'Neutral'),
(1977, '/Full/b_Anuthep_Kumseam-2024-04-02-21-55-10-082422.png', '/Face/s_Anuthep_Kumseam-2024-04-02-21-55-10-082422.png', '2024-04-02', '21:55:10.082422', 'Anuthep_Kumseam', 'Neutral'),
(1978, '/Full/b_Anuthep_Kumseam-2024-04-02-21-56-52-691407.png', '/Face/s_Anuthep_Kumseam-2024-04-02-21-56-52-691407.png', '2024-04-02', '21:56:52.691407', 'Anuthep_Kumseam', 'Sad'),
(1979, '/Full/b_Anuthep_Kumseam-2024-04-03-09-22-27-188342.png', '/Face/s_Anuthep_Kumseam-2024-04-03-09-22-27-188342.png', '2024-04-03', '09:22:27.188342', 'Anuthep_Kumseam', 'Neutral'),
(1980, '/Full/b_Anuthep_Kumseam-2024-04-03-09-45-18-214271.png', '/Face/s_Anuthep_Kumseam-2024-04-03-09-45-18-214271.png', '2024-04-03', '09:45:18.214271', 'Anuthep_Kumseam', 'Neutral'),
(1981, '/Full/b_Anuthep_Kumseam-2024-04-03-09-45-35-126621.png', '/Face/s_Anuthep_Kumseam-2024-04-03-09-45-35-126621.png', '2024-04-03', '09:45:35.126621', 'Anuthep_Kumseam', 'Neutral'),
(1982, '/Full/b_Anuthep_Kumseam-2024-04-03-09-45-40-582788.png', '/Face/s_Anuthep_Kumseam-2024-04-03-09-45-40-582788.png', '2024-04-03', '09:45:40.582788', 'Anuthep_Kumseam', 'Neutral'),
(1983, '/Full/b_Anuthep_Kumseam-2024-04-03-09-47-55-105839.png', '/Face/s_Anuthep_Kumseam-2024-04-03-09-47-55-105839.png', '2024-04-03', '09:47:55.105839', 'Anuthep_Kumseam', 'Neutral'),
(1984, '/Full/b_Anuthep_Kumseam-2024-04-03-09-50-06-812139.png', '/Face/s_Anuthep_Kumseam-2024-04-03-09-50-06-812139.png', '2024-04-03', '09:50:06.812139', 'Anuthep_Kumseam', 'Neutral'),
(1985, '/Full/b_Anuthep_Kumseam-2024-04-03-09-52-52-899076.png', '/Face/s_Anuthep_Kumseam-2024-04-03-09-52-52-899076.png', '2024-04-03', '09:52:52.899076', 'Anuthep_Kumseam', 'Happy');

-- --------------------------------------------------------

--
-- Table structure for table `text_mood`
--

CREATE TABLE `text_mood` (
  `id` bigint(20) NOT NULL,
  `mood_text` varchar(255) NOT NULL,
  `mood_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `text_mood`
--

INSERT INTO `text_mood` (`id`, `mood_text`, `mood_type`) VALUES
(2, 'สวัสดี x คุณดูมีความสุขดีนะครับขอให้มีความสุขในวันนี้นะครับ', 'Happy'),
(3, 'คุณxดูมีความสุขดีนะครับ', 'Happy'),
(4, 'สวัสดี x คุณดูโกรธนะคุณไปทำอะไรมาครับ', 'Angry'),
(5, 'สวัสดีxคุณดูเศร้านะกลับบ้านไหม', 'Sad'),
(16, 'คุณxดูธรรมชาติดีนะครับ', 'Neutral'),
(17, 'เอ่อคุณxคุณดูขยะแขยงอะไรหน่ะ', 'Disgust'),
(18, 'สวัสดีxคุณกลัวอะไรอย่างนั้นหรอ', 'Fear'),
(19, 'สวัสดีxคุณดูตื่นเต้นนะ', 'Surprise'),
(20, 'ไม่อยากทำแล้ว x ทำไงดี', 'Neutral'),
(21, 'ขี้เกียจทำแล้วxทำไงดี', 'Neutral');

-- --------------------------------------------------------

--
-- Table structure for table `type_mood`
--

CREATE TABLE `type_mood` (
  `id` bigint(20) NOT NULL,
  `mood_type` varchar(255) NOT NULL,
  `mood_type_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type_mood`
--

INSERT INTO `type_mood` (`id`, `mood_type`, `mood_type_path`) VALUES
(2, 'Happy', './Happy/');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `TH_name` varchar(255) NOT NULL,
  `Eng_name` varchar(255) NOT NULL,
  `Folder_img_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `TH_name`, `Eng_name`, `Folder_img_path`) VALUES
(1, 'อนุเทพ คุ้มเสม', 'Anuthep Kumseam', '/img/Anuthep_Kumseam/'),
(55, 'ทอม ฮอลคูล', 'Tom holland', '/img/Tom holland/'),
(57, 'คริส อีแวนส์', 'Chris Evans', '/img/Chris Evans/');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `face_detect`
--
ALTER TABLE `face_detect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_mood`
--
ALTER TABLE `text_mood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_mood`
--
ALTER TABLE `type_mood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `face_detect`
--
ALTER TABLE `face_detect`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1986;

--
-- AUTO_INCREMENT for table `text_mood`
--
ALTER TABLE `text_mood`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `type_mood`
--
ALTER TABLE `type_mood`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
