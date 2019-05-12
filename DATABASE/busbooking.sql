-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Bulan Mei 2019 pada 11.58
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `busbooking`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `availability`
--

CREATE TABLE `availability` (
  `id` int(10) UNSIGNED NOT NULL,
  `bus` int(10) UNSIGNED DEFAULT NULL,
  `route` int(10) UNSIGNED DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `availability`
--

INSERT INTO `availability` (`id`, `bus`, `route`, `date`, `time`, `amount`, `status`) VALUES
(1, 1, 1, '2018-05-20', '13:00:00', '1', 'available'),
(3, 2, 1, '2019-06-05', '13:00:00', '1', 'available');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_number` int(10) UNSIGNED DEFAULT NULL,
  `fullname` int(10) UNSIGNED DEFAULT NULL,
  `phone` int(10) UNSIGNED DEFAULT NULL,
  `bus` int(10) UNSIGNED DEFAULT NULL,
  `seat` int(10) UNSIGNED DEFAULT NULL,
  `date` int(10) UNSIGNED DEFAULT '1',
  `time` int(10) UNSIGNED DEFAULT NULL,
  `luggage` varchar(40) DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL,
  `date_booked` date DEFAULT NULL,
  `field11` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `id_number`, `fullname`, `phone`, `bus`, `seat`, `date`, `time`, `luggage`, `amount`, `date_booked`, `field11`) VALUES
(8, 4, 4, 4, 3, 2, 3, 3, NULL, '3', '2019-05-12', NULL),
(9, 5, 5, 5, 1, 5, 1, 1, '1', '1', '2019-05-12', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `buses`
--

CREATE TABLE `buses` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `buses`
--

INSERT INTO `buses` (`id`, `number`) VALUES
(1, 'Excecutive bus'),
(2, 'Superior Bus');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `id_number` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `customers`
--

INSERT INTO `customers` (`id`, `fullname`, `phone`, `id_number`) VALUES
(1, 'Davin Louis', '0712345678', '4410109291020'),
(4, 'kiara', '111111', 'kiara 1'),
(5, 'rizki', '1234567890', 'rizki aditia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `membership_grouppermissions`
--

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `groupID` int(11) DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `membership_grouppermissions`
--

INSERT INTO `membership_grouppermissions` (`permissionID`, `groupID`, `tableName`, `allowInsert`, `allowView`, `allowEdit`, `allowDelete`) VALUES
(1, 2, 'buses', 1, 3, 3, 3),
(2, 2, 'seats', 1, 3, 3, 3),
(3, 2, 'availability', 1, 3, 3, 3),
(4, 2, 'bookings', 1, 3, 3, 3),
(5, 2, 'routes', 1, 3, 3, 3),
(6, 2, 'customers', 1, 3, 3, 3),
(19, 3, 'buses', 0, 3, 0, 0),
(20, 3, 'seats', 0, 3, 0, 0),
(21, 3, 'availability', 0, 3, 0, 0),
(22, 3, 'bookings', 1, 1, 1, 1),
(23, 3, 'routes', 0, 3, 0, 0),
(24, 3, 'customers', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `membership_groups`
--

CREATE TABLE `membership_groups` (
  `groupID` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint(4) DEFAULT NULL,
  `needsApproval` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `membership_groups`
--

INSERT INTO `membership_groups` (`groupID`, `name`, `description`, `allowSignup`, `needsApproval`) VALUES
(1, 'anonymous', 'Anonymous group created automatically on 2018-05-20', 0, 0),
(2, 'Admins', 'Admin group created automatically on 2018-05-20', 0, 1),
(3, 'customers', 'contains all customers', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `membership_userpermissions`
--

CREATE TABLE `membership_userpermissions` (
  `permissionID` int(10) UNSIGNED NOT NULL,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint(4) DEFAULT NULL,
  `allowView` tinyint(4) NOT NULL DEFAULT '0',
  `allowEdit` tinyint(4) NOT NULL DEFAULT '0',
  `allowDelete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `membership_userrecords`
--

CREATE TABLE `membership_userrecords` (
  `recID` bigint(20) UNSIGNED NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint(20) UNSIGNED DEFAULT NULL,
  `dateUpdated` bigint(20) UNSIGNED DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `membership_userrecords`
--

INSERT INTO `membership_userrecords` (`recID`, `tableName`, `pkValue`, `memberID`, `dateAdded`, `dateUpdated`, `groupID`) VALUES
(1, 'buses', '1', 'admin', 1526809520, 1557638420, 2),
(2, 'seats', '1', 'admin', 1526809541, 1526809541, 2),
(3, 'seats', '2', 'admin', 1526809550, 1526809550, 2),
(4, 'seats', '3', 'admin', 1526809559, 1526809559, 2),
(5, 'seats', '4', 'admin', 1526809568, 1526809568, 2),
(6, 'seats', '5', 'admin', 1526809577, 1526809577, 2),
(7, 'seats', '6', 'admin', 1526809587, 1526809587, 2),
(8, 'seats', '7', 'admin', 1526809597, 1526809597, 2),
(9, 'seats', '8', 'admin', 1526809605, 1526809605, 2),
(10, 'seats', '9', 'admin', 1526809615, 1526809615, 2),
(11, 'seats', '10', 'admin', 1526809623, 1526809623, 2),
(12, 'routes', '1', 'admin', 1526809669, 1557637394, 2),
(14, 'availability', '1', 'admin', 1526809809, 1526810984, 2),
(16, 'customers', '1', 'admin', 1526810032, 1526810032, 2),
(20, 'buses', '2', 'admin', 1526820828, 1557638443, 2),
(21, 'availability', '3', 'admin', 1526820876, 1557638461, 2),
(28, 'customers', '4', 'putri', 1557636370, 1557636370, 3),
(29, 'bookings', '8', 'admin', 1557637513, 1557637513, 2),
(30, 'customers', '5', 'raka', 1557654983, 1557654983, 3),
(31, 'bookings', '9', 'raka', 1557655015, 1557655015, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `membership_users`
--

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int(10) UNSIGNED DEFAULT NULL,
  `isBanned` tinyint(4) DEFAULT NULL,
  `isApproved` tinyint(4) DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `membership_users`
--

INSERT INTO `membership_users` (`memberID`, `passMD5`, `email`, `signupDate`, `groupID`, `isBanned`, `isApproved`, `custom1`, `custom2`, `custom3`, `custom4`, `comments`, `pass_reset_key`, `pass_reset_expiry`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@admin.com', '2018-05-20', 2, 0, 1, NULL, NULL, NULL, NULL, 'Admin member created automatically on 2018-05-20\nRecord updated automatically on 2018-05-20', NULL, NULL),
('guest', NULL, NULL, '2018-05-20', 1, 0, 1, NULL, NULL, NULL, NULL, 'Anonymous member created automatically on 2018-05-20', NULL, NULL),
('kaddy', '827ccb0eea8a706c4c34a16891f84e7b', 'kaddy@gmail.com', '2018-05-21', 3, 1, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('kevoh', '827ccb0eea8a706c4c34a16891f84e7b', 'kevo@gmail.com', '2018-05-20', 3, 1, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('putri', 'e807f1fcf82d132f9bb018ca6738a19f', 'uti@gmail.com', '2019-05-11', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('putrimu', '2e95185823298a28672b5323436a9774', 'putri@gmail.com', '2019-04-28', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL),
('raka', 'c44a471bd78cc6c2fea32b9fe028d30a', 'raka@gmail.com', '2019-05-12', 3, 0, 1, '', '', '', '', 'member signed up through the registration form.', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `routes`
--

CREATE TABLE `routes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `time` varchar(40) DEFAULT NULL,
  `amount` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `routes`
--

INSERT INTO `routes` (`id`, `name`, `time`, `amount`) VALUES
(1, 'bandung - Surabaya', 'day', '150000'),
(2, 'bandung - Malang', 'day', '120000'),
(3, 'Bandung - Solo', '17.00 - 02.00', '130000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `seats`
--

CREATE TABLE `seats` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `seats`
--

INSERT INTO `seats` (`id`, `name`) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'A3'),
(4, 'A4'),
(5, 'A5'),
(6, 'A6'),
(7, 'A7'),
(8, 'A8'),
(9, 'A9'),
(10, 'A10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `availability`
--
ALTER TABLE `availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bus` (`bus`),
  ADD KEY `route` (`route`);

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_number` (`id_number`),
  ADD KEY `bus` (`bus`),
  ADD KEY `seat` (`seat`);

--
-- Indeks untuk tabel `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indeks untuk tabel `membership_groups`
--
ALTER TABLE `membership_groups`
  ADD PRIMARY KEY (`groupID`);

--
-- Indeks untuk tabel `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  ADD PRIMARY KEY (`permissionID`);

--
-- Indeks untuk tabel `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  ADD PRIMARY KEY (`recID`),
  ADD UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  ADD KEY `pkValue` (`pkValue`),
  ADD KEY `tableName` (`tableName`),
  ADD KEY `memberID` (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indeks untuk tabel `membership_users`
--
ALTER TABLE `membership_users`
  ADD PRIMARY KEY (`memberID`),
  ADD KEY `groupID` (`groupID`);

--
-- Indeks untuk tabel `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `availability`
--
ALTER TABLE `availability`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `buses`
--
ALTER TABLE `buses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `membership_grouppermissions`
--
ALTER TABLE `membership_grouppermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `membership_groups`
--
ALTER TABLE `membership_groups`
  MODIFY `groupID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `membership_userpermissions`
--
ALTER TABLE `membership_userpermissions`
  MODIFY `permissionID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `membership_userrecords`
--
ALTER TABLE `membership_userrecords`
  MODIFY `recID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `seats`
--
ALTER TABLE `seats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
