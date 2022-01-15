-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2022-01-15 16:10:53
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `bilibili_bot`
--

-- --------------------------------------------------------

--
-- 表的结构 `omg_replys`
--

CREATE TABLE `omg_replys` (
  `at_time` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `at_unix_time` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `at_id` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `at_type` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `at_title` varchar(1000) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `at_url` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `at_sor_id` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `at_content` varchar(1000) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `atman_uid` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `atman_name` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null',
  `reply_count` varchar(255) COLLATE utf8mb4_bin NOT NULL DEFAULT 'null'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 转存表中的数据 `omg_replys`
--

INSERT INTO `omg_replys` (`at_time`, `at_unix_time`, `at_id`, `at_type`, `at_title`, `at_url`, `at_sor_id`, `at_content`, `atman_uid`, `atman_name`, `reply_count`) VALUES
('2021年11月25日16:30:04', '1637829004', '213618139', 'reply', '111', 'https://t.bilibili.com/596958646932883596#reply5830278573', '5830278573', '@ismaOfficial 查重小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！小伙伴你好！😭😭😭别骂了别骂了，在努力了在努力了，一起加油啊！', '524616657', 'isma123', '100.0%'),
('2021年11月25日16:34:48', '1637829288', '213704585', 'reply', '111', 'https://t.bilibili.com/596958646932883596#reply5830310571', '5830310571', '@ismaOfficial 查重祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]', '524616657', 'isma123', '100.0%'),
('2021年11月25日16:36:08', '1637829368', '213802444', 'reply', '祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]祝最甜甜甜的小🐺公主一周年出道快乐！[贝拉kira_笔芯][贝拉kira_送你小花花][贝拉kira_笔芯]', 'https://t.bilibili.com/596958646932883596#reply5830312558', '5830312558', '@ismaOfficial  查重', '524616657', 'isma123', '100.0%'),
('2021年11月26日17:57:56', '1637920676', '213960419', 'reply', '然然用七个表情讲述了出道以来的经历。\n1.在b站开通账号，为每一位来往的路人送上最大的热情与诚意。\n2.遭受网暴，无可奈何，只得默默提升自己以期望获得大家的认可。\n3.首播二十连惊艳观众，小作文等神回让她收获了第一批嘉心糖\n4.健身环、血色新春等等一系列挫折，让她曾灰心、丧气。\n5.与自己、与嘉心糖和解，向大家更多的展开自己\n6.收获越来越多的赞扬与褒奖，也取得了更大大成功和进步\n7.然然可爱捏，大家都给我狠狠地宠😇', 'https://t.bilibili.com/596958646932883596#reply5836469646', '5836469646', '@ismaOfficial 查重', '524616657', 'isma123', '100.0%'),
('2021年11月26日18:01:40', '1637920900', '213932565', 'reply', '然然用七个表情讲述了出道以来的经历。\n1.在b站开通账号，为每一位来往的路人送上最大的热情与诚意。\n2.遭受网暴，无可奈何，只得默默提升自己以期望获得大家的认可。\n3.首播二十连惊艳观众，小作文等神回让她收获了第一批嘉心糖\n4.健身环、血色新春等等一系列挫折，让她曾灰心、丧气。\n5.与自己、与嘉心糖和解，向大家更多的展开自己\n6.收获越来越多的赞扬与褒奖，也取得了更大大成功和进步\n7.然然可爱捏，大家都给我狠狠地宠😇\n防重复cfcfcf', 'https://t.bilibili.com/596958646932883596#reply5836497853', '5836497853', '然然用七个表情讲述了出道以来的经历。\n1.在b站开通账号，为每一位来往的路人送上最大的热情与诚意。\n2.遭受网暴，无可奈何，只得默默提升自己以期望获得大家的认可。\n3.首播二十连惊艳观众，小作文等神回让她收获了第一批嘉心糖\n4.健身环、血色新春等等一系列挫折，让她曾灰心、丧气。\n5.与自己、与嘉心糖和解，向大家更多的展开自己\n6.收获越来越多的赞扬与褒奖，也取得了更大大成功和进步\n7.然然可爱捏，大家都给我狠狠地宠😇\n防重复cfcfcf', '524616657', 'isma123', '95.26%'),
('2021年11月26日18:12:04', '1637921524', '213960600', 'reply', '然然用七个表情讲述了出道以来的经历。\n1.在b站开通账号，为每一位来往的路人送上最大的热情与诚意。\n2.遭受网暴，无可奈何，只得默默提升自己以期望获得大家的认可。\n3.首播二十连惊艳观众，小作文等神回让她收获了第一批嘉心糖\n4.健身环、血色新春等等一系列挫折，让她曾灰心、丧气。\n5.与自己、与嘉心糖和解，向大家更多的展开自己\n6.收获越来越多的赞扬与褒奖，也取得了更大大成功和进步\n7.然然可爱捏，大家都给我狠狠地宠😇\n防重复cfcfcf', 'https://t.bilibili.com/596958646932883596#reply93385305296', '93385305296', '然然用七个表情讲述了出道以来的经历。\n1.在b站开通账号，为每一位来往的路人送上最大的热情与诚意。\n2.遭受网暴，无可奈何，只得默默提升自己以期望获得大家的认可。\n3.首播二十连惊艳观众，小作文等神回让她收获了第一批嘉心糖\n4.健身环、血色新春等等一系列挫折，让她曾灰心、丧气。\n5.与自己、与嘉心糖和解，向大家更多的展开自己\n6.收获越来越多的赞扬与褒奖，也取得了更大大成功和进步\n7.然然可爱捏，大家都给我狠狠地宠😇\n防重复cfcfcf', '514144368', '白给教师-柒柒', '95.26%'),
('2021年12月11日15:20:01', '1639207201', '216508674', 'reply', '2021年12月8日8时29分，贝拉锐评一个魂：家里有一个魂很恐怖。望周知😇😇😇', 'https://t.bilibili.com/596958646932883596#reply94861184992', '94861184992', '2021年12月8日8时29分，贝拉锐评一个魂：家里有一个魂很恐怖。望周知😇😇😇', '524616657', 'isma123', '100.0%'),
('2021年12月11日15:21:08', '1639207268', '216508684', 'reply', '111', 'https://t.bilibili.com/596958646932883596#reply94861120144', '94861120144', '2021年12月8日8时29分，贝拉锐评一个魂：家里有一个魂很恐怖。望周知😇😇😇', '524616657', 'isma123', '100.0%'),
('2022年01月15日02:15:17', '1642184117', '221831497', 'reply', 'test', 'https://t.bilibili.com/615664771402148381#reply98569343648', '98569343648', '@ismaOfficial 查重几十年后，我在海底捞把火锅往衣兜里倒\n“爸！你干什么啊！”\n“这个…这个乃琳喜欢”[乃琳Queen_吃火锅]', '524616657', 'isma123', '100.0%'),
('2022年01月15日02:15:48', '1642184148', '221685624', 'reply', '几十年后，我在海底捞把火锅往衣兜里倒\n“爸！你干什么啊！”\n“这个…这个乃琳喜欢”[乃琳Queen_吃火锅]', 'https://t.bilibili.com/615664771402148381#reply98569430512', '98569430512', '@ismaOfficial 查重', '524616657', 'isma123', '100.0%');

--
-- 转储表的索引
--

--
-- 表的索引 `omg_replys`
--
ALTER TABLE `omg_replys`
  ADD PRIMARY KEY (`at_time`(20));
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
