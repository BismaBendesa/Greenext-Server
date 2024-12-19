-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2024 at 06:54 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greenext`
--

-- --------------------------------------------------------

--
-- Table structure for table `case_study`
--

CREATE TABLE `case_study` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` date NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_study_comments`
--

CREATE TABLE `case_study_comments` (
  `id` int(11) NOT NULL,
  `id_case_study` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `case_study_topics`
--

CREATE TABLE `case_study_topics` (
  `id` int(11) NOT NULL,
  `id_kasus` int(11) NOT NULL,
  `sub-title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificate`
--

CREATE TABLE `certificate` (
  `id` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` date NOT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `difficulty` varchar(50) NOT NULL,
  `status` varchar(100) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `total_hours` decimal(10,0) NOT NULL,
  `image_cover` varchar(150) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`, `description`, `difficulty`, `status`, `price`, `total_hours`, `image_cover`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'Pengenalan Pertanian Dasar', 'Kelas ini adalah kelas yang mengajarkan teknik pertanian dasar yang sering digunakan oleh petani tradisional khususnya di Indonesia.', 'menengah', 'aktif', 0, 8, 'foto1.jpg', '2024-11-25 00:00:00', 1, '2024-11-24 18:30:52', 1),
(3, 'Teknik Pertanian Modern', 'Kelas yang membahas mengenai teknik pertanian modern secara spesisfik', 'tingkat lanjut', 'Aktif', 125000, 20, 'foto2.jpg', '2024-12-02 13:41:52', 2, '2024-12-02 13:41:52', 2),
(4, 'Teknik Pertanian Modern', 'Kelas yang membahas mengenai teknik pertanian modern secara spesisfik', 'tingkat lanjut', 'Aktif', 125000, 20, 'foto3.jpg', '2024-12-02 13:42:34', 2, '2024-12-02 13:42:34', 2),
(5, 'Pengenalan pertanina modern tahap II', 'Pelajari cara mengaplikasikan tekni pertanian modern', 'menegah', 'aktif', 850000, 18, 'foto4.jpg', '2024-12-06 13:28:10', 4, '2024-12-13 16:00:19', 12),
(6, 'Belajar Irigasi Cerdas I', 'Pembelajaran Irigasi Cerdas adalah proses mempelajari cara mengelola sistem irigasi dengan menggunakan teknologi modern. Tujuannya adalah untuk mengoptimalkan penggunaan air, meningkatkan produktivitas pertanian, dan mengurangi dampak negatif terhadap lingkungan.', 'pemula', 'aktif', 0, 10, 'foto5.jpg', '2024-12-15 11:29:15', 12, '2024-12-15 11:29:15', 12),
(7, 'Pemanfaatan IoT untuk Sektor Pertanian', 'IoT dalam pertanian mengacu pada penggunaan sensor, perangkat, dan perangkat lunak yang terhubung ke internet untuk mengumpulkan data tentang berbagai aspek pertanian, seperti kondisi tanah, cuaca, pertumbuhan tanaman, dan kesehatan hewan ternak. Data ini kemudian dianalisis untuk membuat keputusan yang lebih baik dalam mengelola pertanian.', 'menegah', 'aktif', 0, 30, 'iot.png', '2024-12-18 02:20:21', 12, '2024-12-18 02:20:21', 12);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quota` decimal(10,0) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created_at` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` date NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_enrollment`
--

CREATE TABLE `event_enrollment` (
  `id` int(11) NOT NULL,
  `id_event` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_book`
--

CREATE TABLE `e_book` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `publication_year` varchar(10) NOT NULL,
  `writer` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `updated_at` date NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_book_chapter`
--

CREATE TABLE `e_book_chapter` (
  `id` int(11) NOT NULL,
  `id_e_book` int(11) NOT NULL,
  `chapter` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `created_at` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` date NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `e_book_pages`
--

CREATE TABLE `e_book_pages` (
  `id` int(11) NOT NULL,
  `id_e_book_chapter` int(11) NOT NULL,
  `page` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `id_course` int(11) NOT NULL,
  `module_number` int(11) NOT NULL,
  `module_description` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`id`, `id_course`, `module_number`, `module_description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 'Mengenal Dunia Pertanian', '2024-12-15 17:41:33', 12, '2024-12-15 00:00:00', 12),
(2, 1, 2, 'Irigasi Dasar', '2024-12-15 17:42:56', 12, '2024-12-15 17:42:56', 12),
(3, 1, 3, 'Teknik membajak sawah', '2024-12-18 01:49:15', 12, '2024-12-18 01:49:15', 12),
(4, 1, 4, 'Pengendalian hama secara tradisional', '2024-12-18 01:49:15', 12, '2024-12-18 01:49:15', 12),
(5, 7, 1, 'Apa itu IOT?', '2024-12-18 02:25:18', 12, '2024-12-18 02:25:18', 12),
(6, 7, 2, 'Penerapan dasar IoT dalam pertanian', '2024-12-18 02:25:18', 12, '2024-12-18 02:25:18', 12);

-- --------------------------------------------------------

--
-- Table structure for table `module_content`
--

CREATE TABLE `module_content` (
  `id` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `video` varchar(255) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module_content`
--

INSERT INTO `module_content` (`id`, `id_module`, `title`, `text`, `type`, `video`, `file`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 'Pengantar Pertanian', 'Pernahkah kalian membayangkan bagaimana nenek moyang kita bertani? Jauh sebelum ada traktor dan pupuk kimia, mereka telah berhasil menghasilkan pangan yang cukup untuk keluarga. Rahasianya terletak pada pertanian tradisional. Dalam pembelajaran kali ini, kita akan mempelajari berbagai teknik pertanian tradisional yang telah diwariskan turun-temurun. Mulai dari cara memilih bibit unggul, mengolah tanah secara alami, hingga memanen hasil panen dengan bijak. Mari kita belajar bersama bagaimana menjaga kelestarian alam sambil memenuhi kebutuhan pangan.', 'teori', 'https://www.youtube.com/watch?v=0GrdMJJFF2g&pp=ygUPcGVydGFuaWFuIGRhc2Fy', 'pertanian-1.pdf', '2024-12-16 09:32:33', 12, '2024-12-16 09:32:33', 12),
(2, 2, '4 contoh irigasi yang banyak digunakan petani tradisional Indonesia', '1. Irigasi Permukaan\r\nIrigasi permukaan adalah metode pengairan paling sederhana dan paling umum digunakan oleh petani tradisional di Indonesia. Cara kerjanya adalah dengan mengalirkan air dari sumber air (sungai, danau, atau waduk) secara langsung ke lahan pertanian. Air kemudian dialirkan melalui saluran-saluran kecil atau parit menuju tanaman.\r\n\r\nKelebihan:\r\n\r\nSederhana dan mudah diterapkan.\r\nTidak memerlukan peralatan yang rumit.\r\nKekurangan:\r\n\r\nEfisiensi air rendah karena banyak air yang terbuang percuma.\r\nRentan terhadap erosi tanah.\r\n2. Irigasi Subak (Bali)\r\nSistem subak adalah warisan budaya Bali yang unik dan sangat efektif dalam mengelola sumber daya air. Subak merupakan suatu sistem irigasi sawah yang terintegrasi dengan kehidupan sosial dan budaya masyarakat Bali. Air dari sumber mata air atau sungai dialirkan melalui saluran-saluran yang terkelola dengan baik.\r\n\r\nKelebihan:\r\n\r\nEfisiensi air tinggi.\r\nMengurangi konflik antar petani.\r\nMemiliki nilai budaya yang tinggi.\r\nKekurangan:\r\n\r\nMembutuhkan kerjasama yang baik antar anggota subak.\r\n3. Irigasi Ember/Timba\r\nIrigasi ember atau timba merupakan metode tradisional yang masih banyak digunakan di daerah-daerah yang sulit terjangkau oleh sistem irigasi modern. Petani menimba air dari sumber air terdekat menggunakan ember atau timba, kemudian disiramkan ke tanaman secara manual.\r\n\r\nKelebihan:\r\n\r\nSederhana dan tidak memerlukan biaya yang besar.\r\nKekurangan:\r\n\r\nEfisiensi kerja rendah.\r\nMembutuhkan tenaga kerja yang banyak.\r\n4. Irigasi Banjir\r\nIrigasi banjir adalah metode pengairan dengan cara membanjiri seluruh lahan pertanian. Metode ini sering digunakan untuk tanaman padi sawah. Air dialirkan ke sawah hingga mencapai ketinggian tertentu, kemudian dibiarkan menggenang selama beberapa waktu.\r\n\r\nKelebihan:\r\n\r\nCocok untuk tanaman padi sawah.\r\nMembantu menjaga kelembaban tanah.\r\nKekurangan:\r\n\r\nMembutuhkan lahan yang datar.\r\nRentan terhadap serangan hama penyakit.\r\nPenting untuk diperhatikan:\r\n\r\nKondisi Geografis: Pemilihan metode irigasi sangat dipengaruhi oleh kondisi geografis suatu daerah, seperti topografi, ketersediaan sumber air, dan jenis tanah.\r\nJenis Tanaman: Setiap jenis tanaman memiliki kebutuhan air yang berbeda-beda, sehingga metode irigasi yang digunakan pun harus disesuaikan.\r\nPerkembangan Teknologi: Seiring perkembangan zaman, banyak petani tradisional yang mulai mengadopsi teknologi irigasi modern, seperti sistem irigasi tetes dan sprinkler, untuk meningkatkan efisiensi dan produktivitas.', 'teori', 'https://www.youtube.com/watch?v=MWCXYILrW3A&pp=ygURamVuaXMgamVuaXMgc2F3YWg%3D', 'pertanian-1.pdf', '2024-12-16 09:35:05', 12, '2024-12-16 09:35:05', 12),
(3, 3, 'teknik membajak sawah tradisional', 'Membajak dengan Cangkul:\r\nIni adalah metode paling dasar dan sederhana. Petani secara manual mendorong cangkul ke dalam tanah untuk membalik dan menggemburkan tanah. Cangkul didorong maju mundur secara berulang untuk memastikan seluruh lahan terolah dengan baik. Teknik ini membutuhkan tenaga fisik yang cukup besar, namun sangat efektif untuk lahan yang relatif kecil.\r\n\r\nMembajak dengan Bajak yang Ditarik Hewan:\r\nMetode ini lebih efisien dibandingkan dengan menggunakan cangkul. Petani memanfaatkan tenaga hewan seperti kerbau atau sapi untuk menarik bajak. Bajak akan mengiris dan membalik lapisan tanah, sekaligus meratakan permukaan lahan. Teknik ini sangat umum digunakan di daerah pedesaan di Indonesia.\r\n\r\nMembajak dengan Alat Tradisional Lokal:\r\nSetiap daerah di Indonesia memiliki alat bajak tradisional yang unik. Misalnya, di Bali ada alat bajak yang disebut \"metekap\". Alat ini terdiri dari sepasang kayu yang dihubungkan dengan tali dan ditarik oleh sepasang kerbau. Alat ini sangat efektif untuk mengolah tanah yang keras dan berbatu.\r\n\r\nKeunggulan Teknik Membajak Tradisional:\r\n\r\nRamah Lingkungan: Tidak menggunakan bahan bakar fosil sehingga tidak menghasilkan emisi gas buang.\r\nMurah: Alat-alat yang digunakan umumnya terbuat dari bahan alami dan mudah didapatkan.\r\nMelestarikan Budaya: Teknik-teknik ini merupakan warisan budaya yang perlu dilestarikan.\r\nKekurangan Teknik Membajak Tradisional:\r\n\r\nEfisiensi Rendah: Membutuhkan waktu yang lama dan tenaga kerja yang banyak.\r\nProduktivitas Rendah: Hasil olahan tanah kurang optimal dibandingkan dengan menggunakan mesin bajak.\r\nPerkembangan Teknologi:\r\n\r\nMeskipun memiliki banyak kelebihan, teknik membajak tradisional semakin ditinggalkan seiring dengan perkembangan teknologi. Saat ini, banyak petani yang beralih menggunakan traktor untuk mengolah lahan. Traktor lebih efisien dan produktif, namun juga memiliki dampak negatif terhadap lingkungan.\r\n\r\nPenting untuk dicatat:\r\n\r\nPemilihan teknik membajak sangat tergantung pada kondisi lahan, jenis tanaman yang akan ditanam, dan ketersediaan sumber daya. Petani perlu mempertimbangkan semua faktor tersebut sebelum memilih teknik yang tepat.\r\n\r\nApakah Anda ingin mengetahui lebih lanjut tentang alat-alat pertanian tradisional lainnya, atau mungkin Anda ingin membandingkan teknik membajak tradisional dengan teknik modern?', 'teori', 'https://www.youtube.com/watch?v=_RdW02HbIk4&pp=ygUbdGVrbmlrIG1lbWJhamFrIHRyYWRpc2lvbmFs', NULL, '2024-12-18 01:50:34', 12, '2024-12-18 01:50:34', 6),
(4, 4, 'Beberapa contoh pengendalian hama secara tradisional yang telah lama digunakan oleh petani', '1. Pengendalian Hayati:\r\n\r\nMemanfaatkan predator alami: Memelihara atau menarik serangga predator seperti kumbang ladybird, capung, atau laba-laba yang memangsa hama.\r\nRotasi tanaman: Mengganti jenis tanaman yang ditanam secara berkala dapat mengganggu siklus hidup hama dan mengurangi populasi mereka.\r\nTanaman perangkap: Menanam tanaman tertentu yang lebih menarik bagi hama dibandingkan tanaman utama, sehingga hama akan lebih banyak berkumpul di tanaman perangkap.\r\n2. Pengendalian Mekanik:\r\n\r\nPemungutan hama secara manual: Mengumpulkan dan memusnahkan hama secara langsung dari tanaman.\r\nPerangkap: Menggunakan perangkap sederhana seperti perangkap lem atau perangkap cahaya untuk menangkap hama.\r\nSanitasi lingkungan: Membersihkan kebun dari sisa-sisa tanaman yang menjadi tempat persembunyian hama.\r\n3. Pengendalian Kultur Teknik:\r\n\r\nPenanaman serempak: Menanam semua tanaman dalam satu waktu sehingga siklus hidup hama tidak sinkron.\r\nPenjarangan tanaman: Memberikan ruang yang cukup antar tanaman agar sirkulasi udara lancar dan mengurangi kelembaban yang disukai hama.\r\nPemupukan yang seimbang: Pemupukan yang tepat dapat meningkatkan ketahanan tanaman terhadap serangan hama.\r\n4. Pengendalian Kimia Alami:\r\n\r\nEkstrak tanaman: Menggunakan ekstrak tanaman seperti bawang putih, cabai, atau daun sirsak yang memiliki sifat insektisida alami.\r\nSabun insektisida: Menggunakan sabun insektisida yang terbuat dari bahan alami untuk melumpuhkan serangga.\r\nKeuntungan Pengendalian Hama Tradisional:\r\n\r\nRamah lingkungan: Tidak mencemari tanah dan air.\r\nLebih aman: Tidak berbahaya bagi manusia dan hewan.\r\nBiaya murah: Bahan-bahan yang digunakan mudah didapatkan dan harganya terjangkau.\r\nKelemahan Pengendalian Hama Tradisional:\r\n\r\nEfektifitas terbatas: Tidak selalu efektif untuk mengatasi serangan hama yang sangat parah.\r\nMembutuhkan waktu: Pengendalian hama secara tradisional membutuhkan waktu yang lebih lama dibandingkan dengan menggunakan pestisida kimia.\r\nPenting untuk diingat:\r\n\r\nKombinasi metode: Untuk hasil yang optimal, sebaiknya menggabungkan beberapa metode pengendalian hama secara tradisional.\r\nPencegahan: Pencegahan lebih baik daripada pengobatan. Dengan menjaga kebersihan kebun dan menerapkan teknik budidaya yang baik, serangan hama dapat diminimalisir.\r\nPemantauan: Lakukan pemantauan secara rutin untuk mengetahui perkembangan populasi hama dan segera mengambil tindakan jika terjadi serangan.', 'teori', 'https://www.youtube.com/watch?v=EgJ2UO6akbw&pp=ygUkcGVuZ2VuZGFsaWFuIGhhbWEgc2VjYXJhIHRyYWRpc2lvbmFs', NULL, '2024-12-18 01:50:34', 12, '2024-12-18 01:50:35', 12),
(5, 5, 'Mengenal IoT (Internet Of Things)', 'IoT dalam pertanian mengacu pada penggunaan sensor, perangkat, dan perangkat lunak yang terhubung ke internet untuk mengumpulkan data tentang berbagai aspek pertanian, seperti kondisi tanah, cuaca, pertumbuhan tanaman, dan kesehatan hewan ternak. Data ini kemudian dianalisis untuk membuat keputusan yang lebih baik dalam mengelola pertanian.', 'teori', 'https://www.youtube.com/watch?v=pY_9TxAg95M&pp=ygUbcGVuZ2VuYWxhbiBpb3QgZGkgcGVydGFuaWFu', NULL, '2024-12-18 02:27:19', 12, '2024-12-18 02:27:19', 12),
(6, 6, 'Otomisasi penyiraman tanaman menggunakan IoT', 'Tentu, mari kita bahas lebih dalam tentang otomisasi penyiraman tanaman menggunakan IoT.\r\n\r\nApa itu Otomisasi Penyiraman Tanaman Berbasis IoT?\r\n\r\nOtomisasi penyiraman tanaman berbasis IoT adalah sistem yang memanfaatkan teknologi internet untuk mengontrol proses penyiraman tanaman secara otomatis. Sistem ini dilengkapi dengan berbagai sensor yang memantau kondisi tanah, seperti kelembaban, suhu, dan kandungan nutrisi. Data yang diperoleh dari sensor kemudian dikirim ke suatu platform atau aplikasi, yang kemudian akan memproses data tersebut dan memberikan perintah kepada aktuator (misalnya, pompa air) untuk melakukan penyiraman sesuai dengan kebutuhan tanaman.\r\n\r\nKomponen Utama Sistem:\r\n\r\nSensor:\r\nSensor kelembapan tanah: Mengukur tingkat kelembapan tanah.\r\nSensor suhu: Mengukur suhu tanah dan udara sekitar.\r\nSensor cahaya: Mengukur intensitas cahaya matahari.\r\nMikrokontroler: Otak dari sistem yang memproses data dari sensor dan mengendalikan aktuator. Contohnya Arduino, Raspberry Pi.\r\nAktuator: Perangkat yang menjalankan perintah dari mikrokontroler, misalnya pompa air, valve, atau motor.\r\nJaringan internet: Memungkinkan data dari sensor dikirim ke platform atau aplikasi.\r\nPlatform atau aplikasi: Tempat data dikumpulkan, dianalisa, dan perintah kontrol diberikan. Contohnya: Blynk, ThingSpeak, Node-RED.\r\nCara Kerja:\r\n\r\nSensor mengumpulkan data tentang kondisi tanah dan lingkungan sekitar.\r\nData dikirim ke mikrokontroler melalui koneksi tertentu (misalnya, Wi-Fi, Bluetooth).\r\nMikrokontroler memproses data dan membandingkannya dengan nilai ambang batas yang telah ditetapkan.\r\nJika kondisi tanah membutuhkan penyiraman, mikrokontroler akan mengirimkan sinyal ke aktuator untuk mengaktifkan pompa air.\r\nData dan status sistem dapat dipantau melalui platform atau aplikasi yang terhubung ke internet.\r\nManfaat Otomisasi Penyiraman:\r\n\r\nEfisiensi penggunaan air: Penyiraman dilakukan sesuai kebutuhan tanaman, sehingga meminimalkan pemborosan air.\r\nPertumbuhan tanaman optimal: Tanaman mendapatkan pasokan air yang cukup dan tepat waktu.\r\nPenghematan tenaga kerja: Proses penyiraman dapat dilakukan secara otomatis tanpa perlu pengawasan terus-menerus.\r\nPemantauan jarak jauh: Petani dapat memantau kondisi tanaman dan mengontrol sistem penyiraman dari jarak jauh melalui smartphone atau komputer.\r\nContoh Penerapan:\r\n\r\nRumah kaca: Mengontrol kelembaban dan suhu di dalam rumah kaca untuk menciptakan lingkungan yang optimal bagi pertumbuhan tanaman.\r\nKebun sayur: Mengotomatiskan penyiraman tanaman sayur berdasarkan jenis tanaman dan kondisi cuaca.\r\nPerkebunan: Mengelola sistem irigasi pada lahan yang luas dengan lebih efisien.\r\nTantangan dan Pertimbangan:\r\n\r\nBiaya: Biaya awal untuk membangun sistem ini bisa cukup tinggi.\r\nKetersediaan jaringan internet: Kualitas jaringan internet yang stabil sangat penting untuk memastikan kinerja sistem.\r\nPemeliharaan: Sistem perlu dikalibrasi dan dipelihara secara berkala.\r\nPengetahuan teknis: Dibutuhkan pengetahuan dasar tentang elektronika, pemrograman, dan IoT untuk membangun dan mengoperasikan sistem.\r\nKesimpulan\r\n\r\nOtomisasi penyiraman tanaman menggunakan IoT menawarkan banyak manfaat bagi petani. Dengan memanfaatkan teknologi ini, petani dapat meningkatkan produktivitas, efisiensi, dan kualitas hasil panen. Meskipun masih ada beberapa tantangan yang perlu diatasi, potensi pengembangan teknologi ini sangat besar.', 'teori', 'https://www.youtube.com/watch?v=Ix3a3ThsHfA&pp=ygUbcGVuZ2VuYWxhbiBpb3QgZGkgcGVydGFuaWFu', NULL, '2024-12-18 02:27:19', 12, '2024-12-18 02:27:19', 12);

-- --------------------------------------------------------

--
-- Table structure for table `module_reference`
--

CREATE TABLE `module_reference` (
  `id` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `reference` text NOT NULL,
  `link` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module_reference`
--

INSERT INTO `module_reference` (`id`, `id_module`, `reference`, `link`, `created_at`, `updated_at`) VALUES
(1, 1, 'Buku pertanian dasar', 'http://repositori.unsil.ac.id/7291/1/1.%20Buku%20Referensi%20Pengantar%20Ilmu%20Pertanian%20%28Candra%20Wahyu%20Octa%29.pdf', '2024-12-16 10:12:09', '2024-12-16 10:12:09'),
(2, 2, 'Jurnal Pertanian Nasional', 'https://ojs.unik-kediri.ac.id/index.php/jintan/article/view/5697/3664', '2024-12-17 09:32:19', '2024-12-17 09:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `tech_catalog`
--

CREATE TABLE `tech_catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `created_at` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` date NOT NULL,
  `updated_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tech_catalog`
--

INSERT INTO `tech_catalog` (`id`, `name`, `description`, `image`, `video`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'sensor ph tanah dengan IOT', 'Digunakan untuk mengukur kadar air, pH, dan Nutrisi tanah.Sensor tanah adalah alat elektronik yang dirancang khusus untuk mengukur dan memantau berbagai kondisi tanah. Alat ini seperti indera tambahan bagi kita untuk \"merasakan\" apa yang terjadi di dalam tanah.Kelembaban: Mengukur kadar air dalam tanah, sangat penting untuk menentukan jadwal penyiraman yang tepat.\r\nSuhu: Mengukur suhu tanah, mempengaruhi aktivitas mikroorganisme dan pertumbuhan akar tanaman.\r\npH: Mengukur tingkat keasaman atau kebasaan tanah, mempengaruhi ketersediaan nutrisi bagi tanaman.\r\nKadar nutrisi: Mengukur jumlah nutrisi tertentu (misalnya nitrogen, fosfor, kalium) dalam tanah.\r\nKonduktivitas listrik: Mengukur kemampuan tanah menghantarkan listrik, dapat digunakan untuk memperkirakan kandungan garam atau kelembaban tanah.', 'sensor tanah.jpg', 'https://www.youtube.com/watch?v=s2gW2jUM_tU&pp=ygUMc2Vuc29yIHRhbmFo', '2024-12-02', 1, '2024-12-02', 1),
(2, 'lampu grow led', 'Lampu grow LED adalah jenis pencahayaan khusus yang dirancang untuk meniru spektrum cahaya matahari yang dibutuhkan tanaman untuk tumbuh. Lampu ini menggunakan teknologi LED (Light Emitting Diode) yang efisien dan hemat energi.\r\n\r\nMengapa tanaman membutuhkan lampu grow LED?\r\n\r\nCahaya matahari buatan: Tanaman membutuhkan cahaya untuk melakukan fotosintesis, proses mengubah cahaya matahari menjadi energi yang digunakan untuk tumbuh. Ketika tanaman ditanam di dalam ruangan atau di tempat yang kurang cahaya matahari, lampu grow LED dapat menjadi sumber cahaya alternatif.\r\nSpektrum cahaya yang disesuaikan: Lampu grow LED dapat memancarkan spektrum cahaya tertentu yang dibutuhkan tanaman pada tahap pertumbuhan yang berbeda. Misalnya, cahaya biru merangsang pertumbuhan vegetatif (daun dan batang), sedangkan cahaya merah merangsang pembungaan dan produksi buah.', 'lampu grow led.jpg', 'https://www.youtube.com/watch?v=_aWdGUvFsag&pp=ygUObGFtcHUgZ3JvdyBsZWQ%3D', '2024-12-02', 1, '2024-12-02', 1),
(3, 'penyiram tanaman cerdas (smart sprinkler)', 'Smart sprinkler atau penyemprot pintar adalah sistem penyiraman tanaman otomatis yang menggunakan teknologi untuk mengoptimalkan penggunaan air. Berbeda dengan sistem penyiraman konvensional yang memiliki jadwal tetap, smart sprinkler dapat menyesuaikan pola penyiraman berdasarkan kondisi cuaca, jenis tanaman, dan kelembaban tanah. Bagaimana cara kerja smart sprinkler? Sensor: Smart sprinkler dilengkapi dengan berbagai sensor, seperti sensor hujan, sensor kelembaban tanah, dan sensor suhu. Sensor-sensor ini akan mengumpulkan data tentang kondisi lingkungan sekitar. Kontroler: Data yang terkumpul oleh sensor akan diolah oleh sebuah kontroler. Kontroler ini akan menganalisis data dan menentukan jadwal penyiraman yang paling efisien. Aktuator: Berdasarkan perintah dari kontroler, aktuator (misalnya katup air) akan membuka atau menutup aliran air ke nozel penyemprot. Keunggulan smart sprinkler:Efisiensi penggunaan air: Dengan menyesuaikan jadwal penyiraman berdasarkan kebutuhan tanaman, smart sprinkler dapat menghemat penggunaan air hingga 50%. Pelestarian lingkungan: Mengurangi pemborosan air berarti turut berkontribusi dalam pelestarian lingkungan.Kemudahan penggunaan: Pengguna dapat mengatur dan memantau sistem penyiraman melalui aplikasi smartphone atau perangkat lain. Kustomisasi: Sistem dapat disesuaikan dengan jenis tanaman, iklim, dan preferensi pengguna. Komponen utama smart sprinkler: Kontroler: Otak dari sistem, mengolah data dan mengatur jadwal penyiraman. Sensor: Mengumpulkan data tentang kondisi lingkungan. Nozel: Menyemprotkan air ke tanaman. Pipa dan selang: Saluran air dari sumber air ke nozel. Katup: Mengontrol aliran air. Aplikasi: Digunakan untuk mengontrol dan memantau sistem dari jarak jauh.', 'smart sprinklee.jpg', 'https://www.youtube.com/watch?v=Lyk6ilfMvD4&pp=ygUPc21hcnQgc3ByaW5rbGVy', '2024-12-02', 2, '2024-12-02', 2),
(5, 'Traktor Mini Elektrik', 'Traktor Mini Elektrik: Masa Depan Pertanian yang Ramah Lingkungan\r\n\r\nTraktor mini elektrik adalah inovasi terbaru dalam dunia pertanian yang menggabungkan kekuatan mesin dengan efisiensi energi. Dengan mengandalkan tenaga listrik, traktor ini menawarkan solusi yang lebih ramah lingkungan dibandingkan dengan traktor konvensional yang menggunakan bahan bakar fosil.', 'traktor mini elektrik.jpg', 'https://www.youtube.com/watch?v=_JQAYqujoqw&pp=ygUVdHJha3RvciBtaW5pIGVsZWt0cmlr', '2024-12-18', 12, '2024-12-18', 12),
(6, 'drone pertanian', 'Drone Pertanian: Mata Langit untuk Pertanian Modern\r\n\r\nDrone pertanian, atau sering disebut juga dengan drone agrikultur, adalah pesawat tanpa awak yang dirancang khusus untuk mendukung berbagai aktivitas pertanian. Dengan teknologi yang semakin canggih, drone pertanian kini menjadi alat yang sangat berguna bagi para petani untuk meningkatkan efisiensi dan produktivitas.', 'drone pertanian.jpg', 'https://www.youtube.com/watch?v=BjoQqJIBECM&pp=ygUPZHJvbmUgcGVydGFuaWFu', '2024-12-18', 12, '2024-12-18', 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `role` enum('user','admin') NOT NULL,
  `occupation` varchar(150) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `phone`, `role`, `occupation`, `education`, `major`, `date_of_birth`, `gender`, `city`, `province`, `updated_at`, `created_at`) VALUES
(1, 'JohnDoe', '$2b$10$UjjGJtGVwa.tcGRIdyRGteFDP4.G0acK9rYQly7PSSKWcYsUrqxUe', 'johndoe@example.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-11-25 00:00:00', '2024-11-25 22:21:37'),
(2, 'mamamia', '$2b$10$KqJ30xcuNX8maPpn7E2ypOXcWkOnaRFgnRfKUlcN7OrRmOmFoPld6', 'mamamia@example.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-11-26 00:00:00', '2024-11-26 00:05:52'),
(3, 'bisma', '$2b$10$aknE5PzVl8R1qy8I5w9uWe9j8w/1hD26vEU7NVlNgNe9G6ZvTqoAq', 'bisma@example.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-11-26 00:00:00', '2024-11-26 10:55:58'),
(4, 'Man Parang', '$2b$10$UPliSlJ7SQCD2MsGK.Ccc.5B5lJcf8PISE9E.YpSQYJT0GN9AabBO', 'manparang@gmail.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-03 00:00:00', '2024-12-03 11:38:34'),
(5, 'test', '$2b$10$0xRje/x73q4UP/46QucFz.xM1ztBSN/ArR0wa4QuH0EAoEa6hoABm', 'test@gmail.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-03 00:00:00', '2024-12-03 21:08:22'),
(6, 'mamang', '$2b$10$ya40ZwRYEwEPRGzFlK2HBupcmblAG5YL/HaTbXSuG14AQe37T5rJS', 'mamang@gmail.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-04 00:00:00', '2024-12-04 10:32:26'),
(7, 'sarah kang', '$2b$10$XwABaVzCOqmAlGfosWx41ufQV9ONGj445R0BQEjoLursTTjuurKTm', 'sarahkang@gmail.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-04 00:00:00', '2024-12-04 10:33:58'),
(8, 'Katsuhiro Harada', '$2b$10$t0GP7nUK2ly3H0YpuQQogO5hIhctl1mTKXjoCtXCyzlDM6XEGnj8W', 'katsuhiro@gmail.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-04 00:00:00', '2024-12-04 10:39:50'),
(9, 'Monju', '$2b$10$qK9kv9moAKc2aj9Z/npqjOBcT5gv7QK0j8LRSJDwxLNZqHAWVIvdu', 'monju@gmail.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-04 00:00:00', '2024-12-04 11:41:24'),
(10, 'annie', '$2b$10$AYthsyvEtzjJK5A/eCzZ.uTiPkTYpffu8LzcmgGK1IFukYv5RDfTG', 'annie@gmail.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-04 00:00:00', '2024-12-04 11:42:00'),
(11, 'Bisma', '$2b$10$0NSjyN0d0M4z.4CJmMCNnOGjI3ab4Rgg5ruDHcsSDXfz9DQqYcXBW', 'bismabendesajaya@gmail.com', NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-08 11:23:40', '2024-12-08 11:23:40'),
(12, 'bisma ', '$2b$10$qWjBP/4YYz.UR7HccSVCY.nYphKAOrhzM71HVc3b85PbXuRJluVQW', 'blabla@gmail.blabla', NULL, 'admin', NULL, NULL, NULL, NULL, NULL, NULL, '', '2024-12-08 11:32:07', '2024-12-08 11:32:07');

-- --------------------------------------------------------

--
-- Table structure for table `user_socials`
--

CREATE TABLE `user_socials` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `links` varchar(100) NOT NULL,
  `social_media` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `case_study`
--
ALTER TABLE `case_study`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `case_study_comments`
--
ALTER TABLE `case_study_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_case_study` (`id_case_study`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `case_study_topics`
--
ALTER TABLE `case_study_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_kasus` (`id_kasus`);

--
-- Indexes for table `certificate`
--
ALTER TABLE `certificate`
  ADD KEY `id_course` (`id_course`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `event_enrollment`
--
ALTER TABLE `event_enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `event_enrollment_ibfk_2` (`id_user`);

--
-- Indexes for table `e_book`
--
ALTER TABLE `e_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `e_book_chapter`
--
ALTER TABLE `e_book_chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e-book_e-book-pages` (`id_e_book`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `e_book_pages`
--
ALTER TABLE `e_book_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `e-book-chapter_e-book-pages` (`id_e_book_chapter`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_course` (`id_course`) USING BTREE,
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `module_content`
--
ALTER TABLE `module_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_module-content` (`id_module`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `module_reference`
--
ALTER TABLE `module_reference`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_module` (`id_module`);

--
-- Indexes for table `tech_catalog`
--
ALTER TABLE `tech_catalog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_socials`
--
ALTER TABLE `user_socials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_user-socials` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `case_study`
--
ALTER TABLE `case_study`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_study_comments`
--
ALTER TABLE `case_study_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `case_study_topics`
--
ALTER TABLE `case_study_topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_enrollment`
--
ALTER TABLE `event_enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_book`
--
ALTER TABLE `e_book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `e_book_chapter`
--
ALTER TABLE `e_book_chapter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `module_content`
--
ALTER TABLE `module_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `module_reference`
--
ALTER TABLE `module_reference`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tech_catalog`
--
ALTER TABLE `tech_catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_socials`
--
ALTER TABLE `user_socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `case_study`
--
ALTER TABLE `case_study`
  ADD CONSTRAINT `case_study_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `case_study_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `case_study_comments`
--
ALTER TABLE `case_study_comments`
  ADD CONSTRAINT `case_study_comments_ibfk_1` FOREIGN KEY (`id_case_study`) REFERENCES `case_study` (`id`),
  ADD CONSTRAINT `case_study_comments_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `case_study_topics`
--
ALTER TABLE `case_study_topics`
  ADD CONSTRAINT `case_study_topics_ibfk_1` FOREIGN KEY (`id_kasus`) REFERENCES `case_study` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificate`
--
ALTER TABLE `certificate`
  ADD CONSTRAINT `certificate_ibfk_1` FOREIGN KEY (`id_course`) REFERENCES `course` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificate_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `certificate_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `event_enrollment`
--
ALTER TABLE `event_enrollment`
  ADD CONSTRAINT `event_enrollment_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_enrollment_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `e_book`
--
ALTER TABLE `e_book`
  ADD CONSTRAINT `e_book_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `e_book_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `e_book_chapter`
--
ALTER TABLE `e_book_chapter`
  ADD CONSTRAINT `e-book_e-book-pages` FOREIGN KEY (`id_e_book`) REFERENCES `e_book` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `e_book_chapter_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `e_book_chapter_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `e_book_pages`
--
ALTER TABLE `e_book_pages`
  ADD CONSTRAINT `e-book-chapter_e-book-pages` FOREIGN KEY (`id_e_book_chapter`) REFERENCES `e_book_chapter` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `course_module` FOREIGN KEY (`id_course`) REFERENCES `course` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `module_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION;

--
-- Constraints for table `module_content`
--
ALTER TABLE `module_content`
  ADD CONSTRAINT `module_content_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `module_content_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `module_module-content` FOREIGN KEY (`id_module`) REFERENCES `module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `module_reference`
--
ALTER TABLE `module_reference`
  ADD CONSTRAINT `module_reference_ibfk_1` FOREIGN KEY (`id_module`) REFERENCES `module` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tech_catalog`
--
ALTER TABLE `tech_catalog`
  ADD CONSTRAINT `tech_catalog_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tech_catalog_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_socials`
--
ALTER TABLE `user_socials`
  ADD CONSTRAINT `user_user-socials` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
