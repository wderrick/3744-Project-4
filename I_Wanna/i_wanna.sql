-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2016 at 07:25 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `i_wanna`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `intro` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `achievements`
--

INSERT INTO `achievements` (`id`, `title`, `intro`) VALUES
(1, 'First Jump!', '...(press shift.)'),
(2, 'Tonight, we dine... out of screen?', 'You fell out of the stage. And God knows what happened there.'),
(3, 'Double-jumper', 'I know. Not the physics.'),
(4, 'Apple!', 'Sir Issac Newton will be pleased.'),
(5, 'You didn''t see that coming?', 'Got killed by a hidden trap.'),
(6, 'Killer spiiiiiiiiiiiiikes!', 'Jumped over a killer spike! How did it feel?');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `subject` text NOT NULL,
  `content` text NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `author_id`, `name`, `subject`, `content`, `time`) VALUES
(1, 1, 'Derrick Wang', 'Test', ':P', '2016-03-07 12:12:18'),
(2, 2, 'Test Account', 'A test comment', 'This is a test comment to verify that the refresh-resubmission bug has been fixed.', '2016-03-07 12:21:32');

-- --------------------------------------------------------

--
-- Table structure for table `intro`
--

CREATE TABLE `intro` (
  `id` int(11) UNSIGNED NOT NULL,
  `img` text NOT NULL,
  `img_alt` text NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `intro`
--

INSERT INTO `intro` (`id`, `img`, `img_alt`, `title`, `subtitle`, `content`) VALUES
(1, '/intro/main.jpg', 'logo', 'The Original', 'I Wanna Be the Guy', 'IWBTG is a 2D platform video game created by Michael "Kayin" O''Reilly. First released in October 2007, the game quickly became famous of its unusually difficult platforming elements and unorthodox level design. Kayin released the source code in November 2011, which allowed authors worldwide to develop thousands of different and colorful fan versions.'),
(2, '/intro/game_stage.png', 'stage', 'Defy Physics', 'With your double-jump', 'In IWBTG, you the hero do not possess any ability aside from double-jumping and almost useless gun-shooting. For a stage like this, how would you reach the middle-bottom and proceed to the next stage? Spikes kill!<br>Pay attention to the picture. You only have these two floating boards to stand on, and you have to leave it and double-jump back on to avoid touching the spikes. This is a medium difficulty, which gives you double as much the saves. Hard, and impossible... hehe.'),
(3, '/intro/newton.png', 'newton', 'He who found the gravity', 'I can''t imagine...', 'In the world of I Wanna, the apples are one of the most dangerous creature that our little guy would explode into pieces when hit by them. And you know... The apples fall from the trees. Imagine what would happen to Sir Issac Newton...');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `avatar` text NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(200) NOT NULL DEFAULT '',
  `progress` int(11) NOT NULL DEFAULT '0',
  `deaths` int(11) NOT NULL,
  `time` time NOT NULL DEFAULT '00:00:00',
  `start_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `achievements` int(11) NOT NULL DEFAULT '0' COMMENT 'converted from binary'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `avatar`, `username`, `first_name`, `last_name`, `email`, `password`, `progress`, `deaths`, `time`, `start_time`, `achievements`) VALUES
(1, '/avatar/1.jpg', 'derrickwang', 'Derrick', 'Wang', 'wdehua7@vt.edu', '1234qwer', 3, 253, '14:33:19', '2016-02-08 02:18:39', 63),
(2, '/avatar/default.png', 'Test1', 'Test', 'Account', 'email@example.com', '1234qwer', 0, 0, '00:00:00', '2016-03-07 12:16:05', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `intro`
--
ALTER TABLE `intro`
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
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `intro`
--
ALTER TABLE `intro`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
