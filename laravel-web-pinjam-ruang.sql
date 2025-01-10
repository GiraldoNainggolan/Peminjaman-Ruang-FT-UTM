-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jan 2025 pada 06.55
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-web-pinjam-ruang`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buildings`
--

CREATE TABLE `buildings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `faculty_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `buildings`
--

INSERT INTO `buildings` (`id`, `code`, `name`, `faculty_id`, `created_at`, `updated_at`) VALUES
(1, 'ged-a', 'Gedung A', 2, '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(2, 'RKB-F', 'RKB-F', 1, '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(3, 'ged-ict', 'Gedung ICT', 4, '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(4, 'ged-b', 'Gedung B', 3, '2024-12-18 16:16:39', '2024-12-18 16:16:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `faculties`
--

CREATE TABLE `faculties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `faculties`
--

INSERT INTO `faculties` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
(1, 'FTIK', 'Fakultas Teknik dan Ilmu Komputer', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(2, 'FEB', 'Fakultas Ekonomi Bisnis', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(3, 'FSIP', 'Fakultas Sastra dan Ilmu Pendidikan', '2024-12-18 16:16:39', '2024-12-18 16:16:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_21_021606_room', 1),
(6, '2022_05_21_022039_create_rooms_table', 1),
(7, '2022_05_21_022436_create_faculties_table', 1),
(8, '2022_05_21_022459_create_buildings_table', 1),
(9, '2022_05_21_031209_create_rents_table', 1),
(10, '2022_05_21_075939_create_admins_table', 1),
(11, '2022_05_21_082546_create_roles_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rents`
--

CREATE TABLE `rents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `time_start_use` datetime NOT NULL,
  `time_end_use` datetime NOT NULL,
  `purpose` text NOT NULL,
  `transaction_start` datetime NOT NULL,
  `transaction_end` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rents`
--

INSERT INTO `rents` (`id`, `room_id`, `user_id`, `time_start_use`, `time_end_use`, `purpose`, `transaction_start`, `transaction_end`, `status`, `created_at`, `updated_at`) VALUES
(7, 50, 5, '2025-01-06 13:30:00', '2025-01-06 15:00:00', 'Kelas pengganti PST', '2025-01-06 13:17:25', NULL, 'dipinjam', '2025-01-06 06:17:25', '2025-01-06 06:18:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(2, 'mahasiswa', '2024-12-18 16:16:39', '2024-12-18 16:16:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `floor` int(11) NOT NULL,
  `building_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `capacity` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `rooms`
--

INSERT INTO `rooms` (`id`, `code`, `name`, `img`, `floor`, `building_id`, `status`, `capacity`, `type`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Lab 1 GSG', 'Lab 1 GSG', 'assets/images/ruang/Lab2A.jpeg', 2, 2, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(2, 'Lab 2 GSG', 'Lab 2 GSG', 'assets/images/ruang/LabICT.jpeg', 2, 2, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(3, 'Lab 3 GSG', 'Lab 3 GSG', 'assets/images/ruang/LabDigital.jpeg', 3, 2, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(4, 'Lab 4 GSG', 'Lab 4 GSG', 'assets/images/ruang/LabICT.jpeg', 3, 2, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(5, 'Lab 1 A', 'Lab 1 A', 'assets/images/ruang/Lab2A.jpeg', 3, 1, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(8, 'Lab Bahasa', 'Lab Bahasa', 'assets/images/ruang/Lab2A.jpeg', 2, 1, 0, 40, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(10, '401 A', '401 A', 'assets/images/ruang/LabDigital.jpeg', 4, 1, 0, 80, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(11, '402 A', '402 A', 'assets/images/ruang/LabDigital.jpeg', 4, 1, 0, 80, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(12, '209', '209', 'assets/images/ruang/Lab2A.jpeg', 2, 1, 0, 45, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(13, '201 B', '201 B', 'assets/images/ruang/201b.jpeg', 2, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(14, '202 B', '202 B', 'assets/images/ruang/202b.jpeg', 2, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(15, '203 B', '203 B', 'assets/images/ruang/201b.jpeg', 2, 4, 0, 40, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(16, '204 B', '204 B', 'assets/images/ruang/203b.jpeg', 2, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(17, '301 B', '301 B', 'assets/images/ruang/301b.jpeg', 3, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(18, '302 B', '302 B', 'assets/images/ruang/201b.jpeg', 3, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(19, '303 B', '303 B', 'assets/images/ruang/202b.jpeg', 3, 4, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(20, '304 B', '304 B', 'assets/images/ruang/203b.jpeg', 3, 4, 0, 40, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(21, 'Lab Software', 'Lab Software', 'assets/images/ruang/LabICT.jpeg', 2, 3, 0, 50, 'Lab Komputer', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(22, 'Lab Gambar', 'Lab Gambar', 'assets/images/ruang/LabGambar.jpeg', 1, 3, 0, 50, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(23, '301 ICT B', '301 ICT B', 'assets/images/ruang/301ICT.jpeg', 3, 3, 0, 100, 'Ruang Kelas', 'Laboratorium kampus adalah fasilitas vital dalam lingkungan pendidikan tinggi, menyediakan lingkungan yang didedikasikan untuk eksperimen, riset, dan kegiatan praktis di berbagai bidang studi.', '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(29, '205', 'Ruang Baca FT', 'assets/images/ruang/LabDigital.jpeg', 2, 2, 0, 24, 'Ruang Umum', 'Ruang baca ini memiliki koleksi buku teknik yang lengkap, suasana tenang, serta papan tulis.', '2024-12-21 00:53:04', '2024-12-21 00:53:04'),
(30, '401', 'Ruang Kuliah Umum', 'assets/images/ruang/Lab2A.jpeg', 4, 2, 0, 41, 'Ruang Umum', 'Ruangan multifungsi yang sering digunakan untuk seminar, kuliah umum, atau pelatihan mahasiswa, dilengkapi dengan papan tulis, proyektor, dan LCD TV.', '2024-12-21 00:56:41', '2024-12-21 00:56:41'),
(31, '404', 'Ruang Kuliah Teknik Mesin', 'assets/images/ruang/LabDigital.jpeg', 4, 2, 0, 46, 'Ruang Umum', 'Ruang ini sering digunakan untuk simulasi mekanik dan diskusi proyek teknik mesin dengan dukungan papan tulis, proyektor, dan LCD TV.', '2024-12-21 01:03:47', '2024-12-21 01:03:47'),
(32, '403', 'Ruang Kuliah Teknik Mesin', 'assets/images/ruang/201b.jpeg', 4, 2, 0, 42, 'Ruang Kelas', 'Dilengkapi dengan perangkat multimedia, papan tulis, proyektor, dan LCD TV untuk pengajaran teori mekanika.', '2024-12-21 02:57:49', '2024-12-21 02:57:49'),
(33, '402', 'Ruang Kuliah Teknik Mesin', 'assets/images/ruang/302b.jpeg', 4, 2, 0, 49, 'Ruang Kelas', 'Ruangan luas dengan alat peraga mesin, papan tulis, proyektor, dan LCD TV untuk praktik desain mekanik.', '2024-12-21 03:00:58', '2024-12-21 03:00:58'),
(34, '207', 'Ruang Kuliah Mekatronika', 'assets/images/ruang/Lab2A.jpeg', 2, 2, 0, 49, 'Ruang Kelas', 'Ruang ini memiliki fasilitas robotik dasar, papan tulis, proyektor, dan LCD TV untuk pembelajaran pengembangan sistem otomatis.', '2024-12-21 03:07:02', '2024-12-21 03:07:02'),
(35, '405', 'Ruang Kuliah Teknik Elektro', 'assets/images/ruang/203b.jpeg', 4, 2, 0, 45, 'Ruang Kelas', 'Ideal untuk pembelajaran jaringan listrik dengan papan tulis, proyektor, LCD TV, dan perangkat demonstrasi.', '2024-12-21 03:17:26', '2024-12-21 03:17:26'),
(36, '301', 'Ruang Kuliah Teknik Elektro', 'assets/images/ruang/301b.jpeg', 3, 2, 0, 46, 'Ruang Kelas', 'Memiliki fasilitas alat peraga, papan tulis, proyektor, dan LCD TV untuk mendukung kuliah berbasis praktik.Memiliki fasilitas alat peraga, papan tulis, proyektor, dan LCD TV untuk mendukung kuliah berbasis praktik.', '2024-12-21 03:20:17', '2024-12-21 03:20:17'),
(37, '206', 'Ruang Kuliah Teknik Elektro', 'assets/images/ruang/LabICT.jpeg', 2, 2, 0, 44, 'Ruang Kelas', 'Ruangan ini dilengkapi dengan perangkat simulasi elektronik, papan tulis, proyektor, dan LCD TV untuk mendukung pembelajaran praktis.', '2024-12-21 03:22:19', '2024-12-21 03:22:19'),
(38, '408', 'Ruang Kuliah SI', 'assets/images/ruang/202b.jpeg', 4, 2, 0, 48, 'Ruang Kelas', 'Dirancang dengan dekorasi modern, ruangan ini memiliki papan tulis, proyektor, dan LCD TV untuk pembelajaran pengembangan sistem ERP.', '2024-12-21 03:25:18', '2024-12-21 03:25:18'),
(39, '308', 'Ruang Kuliah SI', 'assets/images/ruang/default-room-image.jpeg', 3, 2, 0, 44, 'Ruang Kelas', 'Memiliki tempat duduk ergonomis, papan tulis, proyektor, dan LCD TV untuk memastikan kenyamanan selama jam kuliah panjang.', '2024-12-21 03:57:21', '2024-12-21 03:57:21'),
(40, '307', 'Ruang Kuliah SI', 'assets/images/ruang/tkt21.jpg', 3, 2, 0, 43, 'Ruang Kelas', 'Suasana tenang membuatnya cocok untuk pembelajaran analisis sistem, didukung oleh papan tulis, proyektor, dan LCD TV.', '2024-12-21 04:00:14', '2024-12-21 04:00:14'),
(41, '407', 'Ruang Kuliah Informatika', 'assets/images/ruang/Lab2A.jpeg', 4, 2, 0, 50, 'Ruang Kelas', 'Ruang ini sering digunakan untuk pengembangan web dengan akses internet cepat, papan tulis, proyektor, dan LCD TV.', '2024-12-21 04:33:09', '2024-12-21 04:33:09'),
(42, '406', 'Ruang Kuliah Informatika', 'assets/images/ruang/301ICT.jpeg', 4, 2, 0, 44, 'Ruang Kelas', 'Dilengkapi dengan perangkat komputer, papan tulis, proyektor, dan LCD TV untuk pelatihan praktis dalam pemrograman aplikasi.', '2024-12-21 04:35:18', '2024-12-21 04:35:18'),
(43, '306', 'Ruang Kuliah Informatika', 'assets/images/ruang/LabICT.jpeg', 3, 2, 0, 45, 'Ruang Kelas', 'Dirancang untuk seminar kecil, ruangan ini memiliki meja fleksibel, papan tulis, proyektor, dan LCD TV.', '2024-12-21 04:37:29', '2024-12-21 04:37:29'),
(44, '203', 'Ruang Kuliah Informatika', 'assets/images/ruang/203b.jpeg', 2, 2, 0, 47, 'Ruang Kelas', 'Fasilitas lengkap untuk coding dan simulasi perangkat lunak, ruangan ini dilengkapi dengan papan tulis, proyektor, dan LCD TV.', '2024-12-21 04:39:36', '2024-12-21 04:39:36'),
(45, '305', 'Ruang Kuliah Teknik Industri', 'assets/images/ruang/LabDigital.jpeg', 3, 2, 0, 48, 'Ruang Kelas', 'Ruang ini memiliki suasana kondusif dengan pencahayaan alami, pendingin ruangan, serta papan tulis, proyektor, dan LCD TV', '2024-12-21 04:42:01', '2024-12-21 04:42:01'),
(46, '303', 'Ruang Kuliah Teknik Industri', 'assets/images/ruang/Lab2A.jpeg', 3, 2, 0, 53, 'Ruang Kelas', 'Memiliki meja berbentuk U yang cocok untuk diskusi kelompok, didukung oleh papan tulis, proyektor, dan LCD TV.', '2024-12-21 05:02:51', '2024-12-21 05:02:51'),
(47, '302', 'Ruang Kuliah Teknik Industri', 'assets/images/ruang/302b.jpeg', 3, 2, 0, 49, 'Ruang Kelas', 'Dilengkapi dengan perangkat audio-visual canggih, papan tulis, proyektor, dan LCD TV untuk mendukung pembelajaran teknik operasional industri.', '2024-12-21 05:05:09', '2024-12-21 05:05:09'),
(48, '208', 'Ruang Kuliah Teknik Industri', 'assets/images/ruang/default-room-image.jpeg', 2, 2, 0, 52, 'Ruang Kelas', 'Dirancang untuk kenyamanan belajar, ruang ini memiliki ventilasi yang baik, tata kursi fleksibel, serta papan tulis, proyektor, dan LCD TV.', '2024-12-21 05:08:09', '2024-12-21 05:08:09'),
(49, '202', 'Ruang Kuliah Teknik Industri', 'assets/images/ruang/202b.jpeg', 2, 2, 0, 50, 'Ruang Kelas', 'Ruangan modern dengan kapasitas besar, sering digunakan untuk kelas diskusi dan presentasi proyek kelompok.', '2024-12-21 05:10:21', '2024-12-21 05:10:21'),
(50, '201', 'Ruang Kuliah Teknik Industri', 'assets\\images\\ruang\\201b.jpeg', 2, 2, 0, 43, 'Ruang Kelas', 'Ruang kuliah ini dilengkapi dengan papan tulis, proyektor, dan LCD TV untuk mendukung pembelajaran teknik produksi dan manajemen industri.', '2024-12-21 05:12:01', '2024-12-21 05:12:01');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `nomor_induk` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `nomor_induk`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '21312131', 'admin@gmail.com', NULL, '$2y$10$MIFmiYJPsk.STvMR.UvHS.CgQ4u4Ni1JXfv4vddISpbAC9vjEUAC2', 1, NULL, '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(2, 'Mahasiswa', '21312109', 'mahasiswa@gmail.com', NULL, '$2y$10$uTpFxi0MYTLKtsBKNEj8VubLZ2MxsYRgqq.ZmiXj.J1JYeII1A1Uu', 2, NULL, '2024-12-18 16:16:39', '2024-12-18 16:16:39'),
(4, 'Giraldo', '220441100064', 'giraldonainggolan@gmail.com', NULL, '$2y$10$EQeBbPK4xzUaH9wba4lCxeF97r0LDMqrzMuiaHemhmhwpU8Z5v/nK', 2, NULL, '2025-01-05 16:05:18', '2025-01-05 16:05:18'),
(5, 'Juan Fernando Christian Sinaga', '210421100004', 'Juansinaga455@gmail.com', NULL, '$2y$10$dW6sLbNA4obMc2Kjw7cbhexNCT50MANcZ7tdmgkl3MXIAj1hVMohu', 2, NULL, '2025-01-05 16:14:11', '2025-01-05 16:14:11');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indeks untuk tabel `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `buildings_code_unique` (`code`),
  ADD UNIQUE KEY `buildings_name_unique` (`name`);

--
-- Indeks untuk tabel `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `faculties_code_unique` (`code`),
  ADD UNIQUE KEY `faculties_name_unique` (`name`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `rents`
--
ALTER TABLE `rents`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rooms_code_unique` (`code`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_nomor_induk_unique` (`nomor_induk`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rents`
--
ALTER TABLE `rents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
