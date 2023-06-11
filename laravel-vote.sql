/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 100420 (10.4.20-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : laravel-vote

 Target Server Type    : MySQL
 Target Server Version : 100420 (10.4.20-MariaDB)
 File Encoding         : 65001

 Date: 11/06/2023 11:03:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admins_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'Fikri Omar', 'fikriomar16', '$2y$10$V3JcElIc/Yiv5PEtSj/Fo.M8ykobPcuEstl7Q8ihhhc4OYgdyJR/W', 1, '2023-06-01 01:08:41', '2023-06-01 01:08:41');
INSERT INTO `admins` VALUES (2, 'Super Admin', 'superadmin', '$2y$10$bbMZrX5eOekIbBUGVUqCs.wz9RMgOA2M/r7lLER45PEiZfVw1m4iW', 1, '2023-06-01 01:08:41', '2023-06-01 01:08:41');

-- ----------------------------
-- Table structure for candidates
-- ----------------------------
DROP TABLE IF EXISTS `candidates`;
CREATE TABLE `candidates`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_calon` bigint NOT NULL,
  `nama_calon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_wakil_calon` bigint NOT NULL,
  `nama_wakil_calon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `misi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidates
-- ----------------------------
INSERT INTO `candidates` VALUES (1, 6571482602003036, 'Humaira Pratiwi S.H.', 1402296906148719, 'Victoria Fujiati', '<p>Excepturi et inventore possimus et aliquam velit incidunt.</p><p>Consequuntur dolores nihil consequatur sit aut ut dolorum.</p>', '<p>Ipsam ducimus accusamus vitae repellendus vitae voluptate.</p><p>Illum natus sequi perferendis ut.</p><p>Sed quo occaecati dolores magni non provident quasi.</p><p>Et mollitia a possimus magni cum explicabo.</p>', 'default.png', '2023-06-01 01:08:41', '2023-06-01 01:08:41');
INSERT INTO `candidates` VALUES (2, 5105192504156996, 'Siska Mandasari', 7308655902094495, 'Bahuwirya Karsa Irawan', '<p>Non amet tempore accusamus soluta dolorem est id.</p><p>Ipsum voluptatem expedita dignissimos est id ea dolorum esse.</p><p>Tempora fugiat qui aperiam necessitatibus.</p>', '<p>Deleniti eveniet odio saepe in.</p><p>Qui magnam est velit error.</p><p>Quisquam enim amet vel ipsum.</p><p>Earum enim dolore inventore quidem non animi.</p><p>Sed et perspiciatis ut necessitatibus.</p>', 'default.png', '2023-06-01 01:08:41', '2023-06-01 01:08:41');
INSERT INTO `candidates` VALUES (3, 6204611702141569, 'Rahmi Ika Lailasari', 8101982302049939, 'Ajeng Uyainah', '<p>Sed natus non quisquam molestiae.</p><p>At nesciunt aut ex temporibus ut deserunt et aut.</p><p>Autem sapiente quibusdam necessitatibus voluptas facilis.</p>', '<p>Autem eveniet voluptas quo amet.</p><p>Et sequi et omnis est error quam.</p><p>Illo sint dolor voluptas est eos ea consequatur odit.</p><p>Voluptates veritatis illum qui omnis quasi voluptatem autem.</p><p>Non modi unde id est tempore dolorem id.</p><p>Adipisci repudiandae in qui.</p>', 'default.png', '2023-06-01 01:08:41', '2023-06-01 01:08:41');

-- ----------------------------
-- Table structure for configs
-- ----------------------------
DROP TABLE IF EXISTS `configs`;
CREATE TABLE `configs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `announcement` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of configs
-- ----------------------------
INSERT INTO `configs` VALUES (1, '2023-05-31 08:00:00', '2023-06-10 17:00:00', '<div>Assumenda consequatur voluptatem mollitia voluptas. Esse pariatur dolor et. Officia et molestias vel ex labore. Earum error libero aliquid porro.<br><br></div><div>Est voluptatem voluptates et occaecati architecto. Et voluptas pariatur aut exercitationem. Voluptate eum tempora omnis id pariatur molestiae.<br><br></div><div>Et ut distinctio earum placeat possimus ad. Voluptatum nam quis quo iusto dolores. Mollitia quasi temporibus laboriosam a veritatis.<br><br></div>', 'Pemilihan Gubernur Hongaria', 'Jr. Babadan No. 777', '2023-06-01 01:08:41', '2023-06-01 08:37:08');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (33, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (34, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (35, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (36, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (37, '2021_09_08_044306_create_admins_table', 1);
INSERT INTO `migrations` VALUES (38, '2021_09_10_204103_create_candidates_table', 1);
INSERT INTO `migrations` VALUES (39, '2021_09_10_210704_create_configs_table', 1);
INSERT INTO `migrations` VALUES (40, '2021_09_10_212125_create_votes_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token` ASC) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type` ASC, `tokenable_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `prodi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '123456789012', 'Umum', 1, '$2y$10$4dQvOI1DyEKy6mDNtzw45ODnzdWqhK1BC2ZwjDPDEAQzjXB3ZFGbK', '2004-01-01', 'Sistem Informatika', NULL, '2023-06-01 01:11:10', '2023-06-01 01:12:00');
INSERT INTO `users` VALUES (2, '12345676578765', 'Alfian', 1, '$2y$10$h.CnrQjTh0D6E2lFjlZCNO3xiE/GfIJ85tZkZgE0oV4siZOR9bFUy', '2004-01-01', 'Sistem Informatika', NULL, '2023-06-01 01:14:08', '2023-06-01 01:14:08');
INSERT INTO `users` VALUES (3, '213214214', 'wdwfrw', 0, '$2y$10$kOPMyjV1hbw5YSgUSToQ6O2xrjUKoC4OYuriuuQpimFBuhnfa73oC', '2004-01-01', 'Sistem Informatika', NULL, '2023-06-01 08:34:46', '2023-06-01 08:34:46');
INSERT INTO `users` VALUES (4, '64646464644', 'Sjekwk', 0, '$2y$10$0DqOaJk82bRoKJ4J2bn2tuXUn32JbcqSz1TfDaVJFO98AaEA.QsxG', '2004-01-01', 'Sistem Informatika', NULL, '2023-06-01 10:02:38', '2023-06-01 10:02:38');
INSERT INTO `users` VALUES (7, 'test123', 'test123', 0, 'test123', '2004-01-01', 'test', NULL, '2023-06-09 19:46:20', '2023-06-09 19:46:20');
INSERT INTO `users` VALUES (18, 'test1234', 'test1234', 0, '$2y$10$a0Rh6PHU76.FTKCYILCJFObxVl1Shoc2zaUdhNOgQh1CCp1rpOjja', '2003-12-31', 'Teknik Informatika', NULL, '2023-06-10 16:17:00', '2023-06-10 16:17:00');
INSERT INTO `users` VALUES (19, 'test', 'test', 1, '$2y$10$Q10bJcQYwZpnh5ubkiQVB.csu3rQ12Hcilwi6HzJIeuKChrd02s.G', '2003-12-31', 'Teknik Informatika', NULL, '2023-06-10 16:19:34', '2023-06-10 16:19:34');

-- ----------------------------
-- Table structure for votes
-- ----------------------------
DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes`  (
  `user_id` bigint UNSIGNED NOT NULL,
  `candidate_id` bigint UNSIGNED NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `votes_candidate_id_foreign`(`candidate_id` ASC) USING BTREE,
  CONSTRAINT `votes_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of votes
-- ----------------------------
INSERT INTO `votes` VALUES (1, 1, 'a', 'a', 'a', NULL, NULL);
INSERT INTO `votes` VALUES (2, 2, NULL, NULL, NULL, '2023-06-10 14:15:16', '2023-06-10 14:15:16');
INSERT INTO `votes` VALUES (19, 1, NULL, NULL, NULL, '2023-06-10 16:33:04', '2023-06-10 16:33:04');

SET FOREIGN_KEY_CHECKS = 1;
