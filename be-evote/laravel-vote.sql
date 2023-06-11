-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2023 at 02:10 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-vote`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_super` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `password`, `is_super`, `created_at`, `updated_at`) VALUES
(1, 'Fikri Omar', 'fikriomar16', '$2y$10$V3JcElIc/Yiv5PEtSj/Fo.M8ykobPcuEstl7Q8ihhhc4OYgdyJR/W', 1, '2023-05-31 18:08:41', '2023-05-31 18:08:41'),
(2, 'Super Admin', 'superadmin', '$2y$10$WhVMSSvwV5Y0.JN1VEwubuol7aldPDtZaTbfWSlJbbC662ajYUbsO', 1, '2023-05-31 18:08:41', '2023-05-31 18:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_calon` bigint(20) NOT NULL,
  `nama_calon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_wakil_calon` bigint(20) NOT NULL,
  `nama_wakil_calon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `misi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `id_calon`, `nama_calon`, `id_wakil_calon`, `nama_wakil_calon`, `visi`, `misi`, `foto`, `created_at`, `updated_at`) VALUES
(1, 6571482602003036, 'Humaira Pratiwi S.H.', 1402296906148719, 'Victoria Fujiati', '<p>Excepturi et inventore possimus et aliquam velit incidunt.</p><p>Consequuntur dolores nihil consequatur sit aut ut dolorum.</p>', '<p>Ipsam ducimus accusamus vitae repellendus vitae voluptate.</p><p>Illum natus sequi perferendis ut.</p><p>Sed quo occaecati dolores magni non provident quasi.</p><p>Et mollitia a possimus magni cum explicabo.</p>', 'default.png', '2023-05-31 18:08:41', '2023-05-31 18:08:41'),
(2, 5105192504156996, 'Siska Mandasari', 7308655902094495, 'Bahuwirya Karsa Irawan', '<p>Non amet tempore accusamus soluta dolorem est id.</p><p>Ipsum voluptatem expedita dignissimos est id ea dolorum esse.</p><p>Tempora fugiat qui aperiam necessitatibus.</p>', '<p>Deleniti eveniet odio saepe in.</p><p>Qui magnam est velit error.</p><p>Quisquam enim amet vel ipsum.</p><p>Earum enim dolore inventore quidem non animi.</p><p>Sed et perspiciatis ut necessitatibus.</p>', 'default.png', '2023-05-31 18:08:41', '2023-05-31 18:08:41'),
(3, 6204611702141569, 'Rahmi Ika Lailasari', 8101982302049939, 'Ajeng Uyainah', '<p>Sed natus non quisquam molestiae.</p><p>At nesciunt aut ex temporibus ut deserunt et aut.</p><p>Autem sapiente quibusdam necessitatibus voluptas facilis.</p>', '<p>Autem eveniet voluptas quo amet.</p><p>Et sequi et omnis est error quam.</p><p>Illo sint dolor voluptas est eos ea consequatur odit.</p><p>Voluptates veritatis illum qui omnis quasi voluptatem autem.</p><p>Non modi unde id est tempore dolorem id.</p><p>Adipisci repudiandae in qui.</p>', 'default.png', '2023-05-31 18:08:41', '2023-05-31 18:08:41');

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `announcement` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `event_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `start`, `end`, `announcement`, `event_name`, `location`, `created_at`, `updated_at`) VALUES
(1, '2023-05-31 08:00:00', '2023-06-10 17:00:00', '<div>Assumenda consequatur voluptatem mollitia voluptas. Esse pariatur dolor et. Officia et molestias vel ex labore. Earum error libero aliquid porro.<br><br></div><div>Est voluptatem voluptates et occaecati architecto. Et voluptas pariatur aut exercitationem. Voluptate eum tempora omnis id pariatur molestiae.<br><br></div><div>Et ut distinctio earum placeat possimus ad. Voluptatum nam quis quo iusto dolores. Mollitia quasi temporibus laboriosam a veritatis.<br><br></div>', 'Pemilihan Gubernur Hongaria', 'Jr. Babadan No. 777', '2023-05-31 18:08:41', '2023-06-01 01:37:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(33, '2014_10_12_000000_create_users_table', 1),
(34, '2014_10_12_100000_create_password_resets_table', 1),
(35, '2019_08_19_000000_create_failed_jobs_table', 1),
(36, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(37, '2021_09_08_044306_create_admins_table', 1),
(38, '2021_09_10_204103_create_candidates_table', 1),
(39, '2021_09_10_210704_create_configs_table', 1),
(40, '2021_09_10_212125_create_votes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `prodi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `active`, `password`, `birth_date`, `prodi`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, '123456789012', 'Umum', 1, '$2y$10$4dQvOI1DyEKy6mDNtzw45ODnzdWqhK1BC2ZwjDPDEAQzjXB3ZFGbK', '2004-01-01', 'Sistem Informatika', NULL, '2023-05-31 18:11:10', '2023-05-31 18:12:00'),
(2, '12345676578765', 'Alfian', 1, '$2y$10$h.CnrQjTh0D6E2lFjlZCNO3xiE/GfIJ85tZkZgE0oV4siZOR9bFUy', '2004-01-01', 'Sistem Informatika', NULL, '2023-05-31 18:14:08', '2023-05-31 18:14:08'),
(3, '213214214', 'wdwfrw', 0, '$2y$10$kOPMyjV1hbw5YSgUSToQ6O2xrjUKoC4OYuriuuQpimFBuhnfa73oC', '2004-01-01', 'Sistem Informatika', NULL, '2023-06-01 01:34:46', '2023-06-01 01:34:46'),
(4, '64646464644', 'Sjekwk', 0, '$2y$10$0DqOaJk82bRoKJ4J2bn2tuXUn32JbcqSz1TfDaVJFO98AaEA.QsxG', '2004-01-01', 'Sistem Informatika', NULL, '2023-06-01 03:02:38', '2023-06-01 03:02:38');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `os` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`user_id`, `candidate_id`, `ip`, `os`, `browser`, `created_at`, `updated_at`) VALUES
(2, 2, '127.0.0.1', 'unknown', 'Default Browser 0', '2023-05-31 18:16:58', '2023-05-31 18:16:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `votes_candidate_id_foreign` (`candidate_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_candidate_id_foreign` FOREIGN KEY (`candidate_id`) REFERENCES `candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `votes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
