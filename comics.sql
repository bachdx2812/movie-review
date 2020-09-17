-- Database export via SQLPro (https://www.sqlprostudio.com/allapps.html)
-- Exported by vuth at 01-09-2020 08:52.
-- WARNING: This file may contain descructive statements such as DROPs.
-- Please ensure that you are running the script at the proper location.


-- BEGIN TABLE comics
DROP TABLE IF EXISTS comics;
CREATE TABLE `comics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `copyright_title` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `publisher_id` int DEFAULT NULL,
  `year_start` int DEFAULT NULL,
  `year_end` int DEFAULT NULL,
  `volumes_collected` int DEFAULT NULL,
  `volumes_total` int DEFAULT NULL,
  `ongoing` tinyint(1) DEFAULT NULL,
  `finished` tinyint(1) DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Inserting 39 rows into comics
-- Insert batch #1
INSERT INTO comics (id, title, copyright_title, author, publisher_id, year_start, year_end, volumes_collected, volumes_total, ongoing, finished, thumbnail, created_at, updated_at) VALUES
(1, 'Black Clover', 'Black Clover', 'Yuki Tabata', 1, 2020, NULL, 7, 23, 0, 0, '7_92.jpg', '2020-08-29 10:09:30', '2020-08-31 11:13:32'),
(2, 'Kết giới sư', 'Kekkaishi', 'Yellow Tanabe', 1, 2016, 2016, 35, 35, 0, 1, 'ket-gioi-su-1.u547.d20161202.t162152.803846.png', '2020-08-29 11:27:56', '2020-08-30 13:18:41'),
(3, 'Togari', 'Togari', 'Natsume Yoshinori', 1, 2009, 2009, 8, 8, 0, 1, 'E6hT70k.jpg', '2020-08-29 11:31:30', '2020-08-30 13:21:34'),
(4, 'Hello Komang', 'Hello Komang', 'Park In-Seo, Choi Sang', 1, 2007, 2007, 6, 6, 0, 1, 'QO4oUGX__1_.jpg', '2020-08-29 11:34:51', '2020-08-30 12:18:32'),
(5, 'Thiên thần diệt thế', 'Seraph of the end', 'Takaya Kagami, Yamato Yamamoto, Daisuke Furuya', 1, 2018, 2018, 15, 21, 1, 0, '1_120.jpg', '2020-08-29 11:51:18', '2020-08-30 13:26:44'),
(6, 'Thần Thoại Minh Vương', 'Saint Seiya The Last Canvas', 'Masami Kurumada, Shiori Teshirogi', 3, 2013, 2013, 25, 25, 0, 1, 'Pejc0Sg.jpg', '2020-08-29 13:51:58', '2020-08-30 13:21:10'),
(7, 'Pokémon đặc biệt', 'Pocket Monster Special', 'Hidenori Kusaka, Mato', 1, 2019, NULL, 53, 55, 1, 0, '1_148.jpg', '2020-08-29 13:58:35', '2020-08-30 13:26:29'),
(8, 'Học Viện Siêu Anh Hùng', 'My Hero Academia', 'Kohei Horikoshi', 1, 2018, NULL, 22, 27, 1, 0, '1_205.jpg', '2020-08-29 14:03:48', '2020-08-30 13:15:36'),
(9, 'Hunter X Hunter', 'Hunter X Hunter', 'Yoshihiro Togashi', 1, 2017, NULL, 35, 36, 1, 0, '1_10.jpg', '2020-08-29 14:30:54', '2020-08-30 12:15:40'),
(10, 'Pokémon - Cuộc phiêu lưu của Pippi', 'Pokémon', 'Kosaku Anakubo', 1, 2020, 2020, 14, 14, 0, 1, '1_81.jpg', '2020-08-29 14:37:13', '2020-08-30 13:20:10'),
(11, 'Chú Thoòng', 'Laofuzi', 'Vương Trạch', 1, 2017, 2017, 25, 25, 0, 1, '25_9.jpg', '2020-08-29 14:38:33', '2020-08-30 12:04:43'),
(12, 'Dr. Slump', 'Dr. Slump', 'Akira Toriyama', 1, 2012, 2012, 18, 18, 0, 1, 'image_88911.jpg', '2020-08-29 15:20:55', '2020-08-30 12:12:49'),
(13, 'Hành Trình U Linh Giới', 'Yu Yu Hakusho', 'Yoshihiro Togashi ', 1, 2015, 2016, 19, 19, 0, 1, 'yuyuhakusho.jpg', '2020-08-29 15:25:33', '2020-08-30 13:14:50'),
(14, 'Cuộc phiêu lưu của Croket', 'Croket!', 'Manavu Kashimoto', 1, 2019, 2019, 15, 15, 0, 1, '1_36.jpg', '2020-08-29 15:29:42', '2020-08-30 12:05:10'),
(15, 'Doraemon truyện dài', 'Daichohen Doraemon', 'Fujiko F Fujio', 1, 2020, 2020, 24, 24, 0, 1, '24_28.jpg', '2020-08-29 15:31:35', '2020-08-30 12:08:58'),
(16, 'Siêu quậy Teppei', 'Ore wa Teppei', 'Tetsuya Chiba', 1, 2019, 2020, 31, 31, 0, 1, '1_104.jpg', '2020-08-29 15:33:02', '2020-08-30 13:20:32'),
(17, 'Yu-Gi-Oh!', 'Yu-Gi-Oh!', 'Kazuki Takahashi', 1, 2018, 2019, 38, 38, 0, 1, '1_80.jpg', '2020-08-29 16:11:45', '2020-08-30 13:22:15'),
(18, 'Itto - Sóng gió cầu trường', 'Buttobi Itto', 'Motoki Monma', 1, 2019, 2019, 0, 26, 0, 1, 'chap-15-1.jpg', '2020-08-29 17:34:54', '2020-08-31 11:24:54'),
(19, 'Kurozakuro', 'Kurozakuro', 'Natsume Yoshinori', 1, 2009, 2009, 7, 7, 0, 1, 'ZNGZhCJ__1_.jpeg', '2020-08-29 17:50:04', '2020-08-30 12:17:13'),
(20, 'Thám Tử Kindaichi', 'Kindaichi Shōnen no Jikenbo', 'Seimaru Amagi, Fumiya Sato', 2, 2018, 2019, 34, 34, 0, 1, 'image_74097.jpg', '2020-08-29 17:53:16', '2020-08-30 13:20:50'),
(21, 'Thám Tử Kindaichi R', 'Kindaichi Shōnen no Jikenbo R', 'Seimaru Amagi, Fumiya Sato', 2, 2020, 2020, 12, 14, 0, 0, '59ZehzL.jpg', '2020-08-29 17:55:11', '2020-08-31 11:12:13'),
(22, 'Văn hào lưu lạc', 'Bungou Stray Dogs', 'Asagiri Kafka, Harukawa Sango', 5, 2018, NULL, 15, 15, 1, 0, '2020_04_04_09_52_17_1.jpg', '2020-08-29 18:00:59', '2020-08-30 13:27:47'),
(23, 'Giả thuật kim sư', 'Fullmetal Alchemist', 'Hiromu Arakawa', 3, 2013, 2013, 27, 27, 0, 1, 'ZSOTSss.jpg', '2020-08-29 18:10:53', '2020-08-30 12:14:18'),
(24, 'Cậu bé ba mắt', 'Mitsume ga Tooru', 'Osamu Tezuka', 6, 2012, 2012, 9, 9, 0, 1, '853d2674-f48d-48ad-aff6-29ebd3fb615e_9ea278f31bb8475e872b481b91ffb7c9_master.webp', '2020-08-29 18:14:22', '2020-08-30 12:06:01'),
(25, 'Tomodachi x Monster', 'Tomodachi x Monster', 'Yoshihiko Inui', 4, 2016, 2016, 3, 3, 0, 1, 'vol1biangoaduyeti.u2487.d20170104.t134512.291323.jpg', '2020-08-29 18:25:56', '2020-08-30 13:21:51'),
(26, 'Thanh gươm diệt quỷ', 'Kimetsu no Yaiba', 'Koyoharu Gotouge', 1, 2020, 2020, 14, 23, 0, 0, '14_49.jpg', '2020-08-29 18:27:57', '2020-08-31 11:12:28'),
(27, 'Đội quân nhí nhố', 'Kung Fu Boy Komang', 'Park In-Seo, Choi Sang', 1, 2020, NULL, 5, 39, 0, 0, '5_135.jpg', '2020-08-29 18:29:16', '2020-08-31 11:12:47'),
(28, 'Tsubasa - Giấc mơ sân cỏ', 'Captain Tsubasa', 'Yoichi Takahashi', 1, 2020, NULL, 5, 26, 0, 0, '5_134.jpg', '2020-08-29 18:30:37', '2020-08-31 11:11:56'),
(29, 'Thám tử lừng danh Conan', 'Meitantei Conan', 'Gosho Aoyama', 1, 2020, NULL, 5, 97, 1, 0, '97_2.jpg', '2020-08-29 18:32:47', '2020-08-30 13:27:29'),
(30, 'One Punch Man', 'One Punch Man', 'Yusuke Murata, One', 1, 2019, NULL, 20, 21, 1, 0, '20_40.jpg', '2020-08-29 18:34:01', '2020-08-31 11:11:16'),
(31, 'Bleach', 'Bleach', 'Tite Kubo', 1, 2019, NULL, 32, 74, 0, 0, '32_19.jpg', '2020-08-29 18:34:58', '2020-08-31 11:13:11'),
(32, 'Inuyasha', 'Inuyasha Deluxe', 'Rumiko Takahashi', 2, 2017, 2019, 0, 30, 0, 0, 'inuyasha.jpg', '2020-08-29 18:37:23', '2020-08-30 13:18:00'),
(33, 'Học Viện Thám Tử Q', 'Tantei Gakuen Q', 'Seimaru Amagi, Fumiya Sato', 1, 2019, NULL, 0, 22, 0, 0, 'q.jpg', '2020-08-29 18:38:57', '2020-08-30 13:17:18'),
(34, 'Naruto', 'Naruto', 'Masashi Kishimoto', 1, 2019, NULL, 39, 72, 0, 0, '1_217.jpg', '2020-08-29 18:40:02', '2020-09-01 01:41:53'),
(35, 'Dragon Ball', 'Dragon Ball', 'Akira Toriyama', 1, 2019, 2020, 42, 42, 0, 1, '42_9.jpg', '2020-08-29 18:41:07', '2020-08-31 11:20:25'),
(36, 'One Piece', 'One Piece', 'Eiichiro Oda', 1, 2020, NULL, 0, 93, 1, 0, '1_175.jpg', '2020-08-29 18:42:32', '2020-08-30 13:19:25'),
(37, 'Gintama', 'Gintama', 'Hideaki Sorachi', 1, 2018, NULL, 0, 77, 0, 0, '57_4.jpg', '2020-08-29 18:43:38', '2020-08-30 12:13:49'),
(38, 'Yaiba', 'Yaiba', 'Gosho Aoyama', 1, 2020, NULL, 0, 24, 0, 0, '1_223.jpg', '2020-08-29 18:44:15', '2020-08-30 13:28:29'),
(39, 'Assassination Classroom', 'Assassination Classroom', 'Yusei Matsui', 2, 2020, NULL, 12, 21, 0, 0, 'b6d3276a12afdc1de9e7dea737584610__1_.jpeg', '2020-08-29 18:45:38', '2020-08-31 11:13:04');

-- END TABLE comics

-- BEGIN TABLE publishers
DROP TABLE IF EXISTS publishers;
CREATE TABLE `publishers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Inserting 6 rows into publishers
-- Insert batch #1
INSERT INTO publishers (id, name, logo, created_at, updated_at) VALUES
(1, 'NXB Kim Đồng', '/images/publishers/kimdong.png', '2020-08-29 10:09:18', '2020-08-30 11:55:44'),
(2, 'NXB Trẻ', '/images/publishers/nxb_tre.png', '2020-08-29 10:09:18', '2020-08-30 11:58:01'),
(3, 'TVM Comics', '/images/publishers/tvm.jpg', '2020-08-29 10:09:19', '2020-08-29 10:09:19'),
(4, 'TABooks', '/images/publishers/tabooks.png', '2020-08-29 10:09:20', '2020-08-29 10:09:20'),
(5, 'NXB Hồng Đức', '/images/publishers/hongduc.png', '2020-08-29 10:09:21', '2020-08-30 11:54:32'),
(6, 'NXB Thanh Niên', '/images/publishers/thanh_nien.png', '2020-08-29 18:15:52', '2020-08-29 18:15:52');

-- END TABLE publishers

