-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 26 Mar 2024 pada 13.08
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mathplay`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `daftar_materi_kelas` (IN `nama_kelas` VARCHAR(100))  BEGIN
    SELECT m.id_materi, m.nama_materi, m.deskripsi
    FROM materi m
    INNER JOIN kelas_materi km ON m.id_materi = km.id_materi
    INNER JOIN kelas k ON km.id_kelas = k.id_kelas
    WHERE k.nama_kelas = nama_kelas;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`) VALUES
(1, 'Kelas_1'),
(2, 'Kelas_2'),
(3, 'Kelas_3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas_materi`
--

CREATE TABLE `kelas_materi` (
  `id_kelas` int(11) NOT NULL,
  `id_materi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas_materi`
--

INSERT INTO `kelas_materi` (`id_kelas`, `id_materi`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `materi`
--

CREATE TABLE `materi` (
  `id_materi` int(11) NOT NULL,
  `nama_materi` varchar(100) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `materi`
--

INSERT INTO `materi` (`id_materi`, `nama_materi`, `deskripsi`) VALUES
(1, 'Aljabar', 'Pelajaran tentang aljabar'),
(2, 'Grammar', 'Pelajaran tentang tata bahasa Inggris'),
(3, 'Hukum Newton', 'Pelajaran tentang hukum Newton'),
(4, 'Fisika', 'Pelajaran Fisika'),
(5, 'Biologi', 'Pelajaran mengenai mahluk hidup'),
(6, 'Matematika', 'Pelajaran mengenai hitung hitungan'),
(7, 'Seni', 'Belajar Seni'),
(8, 'TariDaerah', 'Pelajaran mengenai tari daerah');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_03_20_160207_create_users_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 8, 'Personal Access Token', '9849fe001e1ac9dae8ceddd984c826d7d88d5346527cda25ef32246ce79212b8', '[\"*\"]', NULL, NULL, '2024-03-20 20:54:28', '2024-03-20 20:54:28'),
(2, 'App\\Models\\User', 8, 'Personal Access Token', '2919878398b920d6f91ef2812612261b035ccad5d8dd75d8bc9f5a10fe017cce', '[\"*\"]', NULL, NULL, '2024-03-20 21:39:13', '2024-03-20 21:39:13'),
(3, 'App\\Models\\User', 8, 'Personal Access Token', 'f3e536e373d71933e8c16126e2fa17c3643efe365b5988700e60740c9a83e3d5', '[\"*\"]', NULL, NULL, '2024-03-20 21:40:27', '2024-03-20 21:40:27'),
(4, 'App\\Models\\User', 8, 'Personal Access Token', '0114b966e26884ab8ff9487eda133830344cccc704701dcdc388fe3653542349', '[\"*\"]', NULL, NULL, '2024-03-20 21:43:07', '2024-03-20 21:43:07'),
(5, 'App\\Models\\User', 8, 'Personal Access Token', '953016bcb6967ebeb9289a586865149a24e945061b017c262b8145296b7dd90c', '[\"*\"]', NULL, NULL, '2024-03-21 00:34:13', '2024-03-21 00:34:13'),
(6, 'App\\Models\\User', 8, 'Personal Access Token', 'df4d2d6bf0dbe60406e21fff2a21b7aadf9f7902109a5686f45b21d09a5f3e63', '[\"*\"]', NULL, NULL, '2024-03-21 00:38:15', '2024-03-21 00:38:15'),
(7, 'App\\Models\\User', 8, 'Personal Access Token', 'fa26cc55a208658ca27ed54dd2065a11f77914d7bf884ffa366d4b01f8d6ca01', '[\"*\"]', NULL, NULL, '2024-03-21 00:41:12', '2024-03-21 00:41:12'),
(8, 'App\\Models\\User', 8, 'Personal Access Token', '3bcfddc271069aa150d6193d5198cf58a27a095c3409f5d9e0a2950b419e8134', '[\"*\"]', NULL, NULL, '2024-03-21 01:58:51', '2024-03-21 01:58:51'),
(9, 'App\\Models\\User', 8, 'Personal Access Token', '4c26f16843853b2d36e9456d922596f9419d4645067daec3504f2abbaa8bc256', '[\"*\"]', NULL, NULL, '2024-03-21 02:02:58', '2024-03-21 02:02:58'),
(10, 'App\\Models\\User', 8, 'Personal Access Token', '005c38d73f30495382d678486ee6f448d9e9a6e10bff1f615d13f534d14bdcba', '[\"*\"]', NULL, NULL, '2024-03-21 02:03:41', '2024-03-21 02:03:41'),
(11, 'App\\Models\\User', 8, 'Personal Access Token', '3f68c0e8dc4ff0e9a121ed64347de3970e3db08564f8562fa1b19840bad2ee2e', '[\"*\"]', NULL, NULL, '2024-03-21 02:03:54', '2024-03-21 02:03:54'),
(12, 'App\\Models\\User', 8, 'Personal Access Token', 'eb1eb7420a0b3b7ab214cc963eed4c5bcd413f257dafe9283818e510d71f8ed9', '[\"*\"]', NULL, NULL, '2024-03-21 02:03:55', '2024-03-21 02:03:55'),
(13, 'App\\Models\\User', 8, 'Personal Access Token', '985f17a556e99bce834c56be85516456437c646d8f3468f75a40f5ddcbf1757e', '[\"*\"]', NULL, NULL, '2024-03-21 02:06:11', '2024-03-21 02:06:11'),
(14, 'App\\Models\\User', 8, 'Personal Access Token', '0fbd67e953dc7177e46c425230645edd5d34c3ae5abdb8fdd1ffd7bc32f6880a', '[\"*\"]', NULL, NULL, '2024-03-21 02:06:51', '2024-03-21 02:06:51'),
(15, 'App\\Models\\User', 8, 'Personal Access Token', '46877455407f838f6371f11d921926ac02c1aaeff8df6ca3dde18781277d3c72', '[\"*\"]', NULL, NULL, '2024-03-21 20:18:41', '2024-03-21 20:18:41'),
(16, 'App\\Models\\User', 8, 'Personal Access Token', '8425805c272582300318a2c63981e04825424d9f6858efbb011ccc5a416da81f', '[\"*\"]', NULL, NULL, '2024-03-25 05:49:01', '2024-03-25 05:49:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('laki-laki','perempuan','','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `role`, `gender`, `created_at`, `updated_at`) VALUES
(1, 'Hans Agung', 'hansagung11@gmail.com', '$2y$12$ln99754D9xK6ICSUlj1PYub95wLcntEgUiGVYRb2J4i4neC2RUg.K', 'admin', 'laki-laki', '2024-03-20 09:44:08', '2024-03-20 09:44:08'),
(2, 'Anastasya silaen', 'anastasya12@gmail.com', '$2y$12$cDahHenRzl43w9Ijc.gKrekLBc3TYBi4DOq4Ug6pg8Tr6yeowKd26', 'user', 'perempuan', '2024-03-20 09:45:57', '2024-03-20 09:45:57'),
(3, 'Syaloom Manurung', 'syaloom17@gmail.com', '$2y$12$Re4gA5fZhYHbXV.SMKKfjuWNoAl1vuxmCc2OzHvJgi2OAtN2fRhj2', 'user', 'perempuan', '2024-03-20 09:51:21', '2024-03-20 09:51:21'),
(4, 'Abdi', 'adbi11@gmail.com', '$2y$12$AZ8DIrnmWsPbLty6ZkLB1O6n/r2ZKBcpbU510V9hjZt2IUMqlXtWO', 'admin', 'laki-laki', '2024-03-20 09:52:19', '2024-03-20 09:52:19'),
(5, 'Clara', 'clara11@gmail.com', '$2y$12$zavxWaOYZhYuw9rwL8aH2uYPmA3X4.6NO334NuB4.v1C/5J/m92ni', 'admin', 'perempuan', '2024-03-20 19:34:19', '2024-03-20 19:34:19'),
(7, 'Bada', 'budi89@gmail.com', '$2y$12$Xhmyf6crqztHJPiUoeOPCuAV42w.vWxdI4m8cmaaTFQBBQrS9by8.', 'admin', 'laki-laki', '2024-03-20 20:12:47', '2024-03-20 20:29:17'),
(8, 'Hans Ramli', 'hans17@gmail.com', '$2y$12$Ss7laFYHcGpJj3tTGakrueP2gk0FBihzO1n7e8x.Jg6JPgv6/sj1e', 'admin', 'laki-laki', '2024-03-20 20:51:10', '2024-03-20 20:51:10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `kelas_materi`
--
ALTER TABLE `kelas_materi`
  ADD PRIMARY KEY (`id_kelas`,`id_materi`),
  ADD KEY `id_materi` (`id_materi`);

--
-- Indeks untuk tabel `materi`
--
ALTER TABLE `materi`
  ADD PRIMARY KEY (`id_materi`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `materi`
--
ALTER TABLE `materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `kelas_materi`
--
ALTER TABLE `kelas_materi`
  ADD CONSTRAINT `kelas_materi_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `kelas` (`id_kelas`),
  ADD CONSTRAINT `kelas_materi_ibfk_2` FOREIGN KEY (`id_materi`) REFERENCES `materi` (`id_materi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
