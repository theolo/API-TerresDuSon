-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 23, 2019 at 10:00 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `tds2`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `imageUrl` varchar(255) DEFAULT NULL,
  `deadline` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`, `description`, `imageUrl`, `deadline`) VALUES
(1, 'Alimentation', 'Boisson, boulangerie, cremerie, ...', '/images/category/diet.svg', NULL),
(2, 'Cuisine/Vaiselle', 'Cuisine, vaiselle, bio-compostable, ...', '/images/category/kitchen.svg', NULL),
(3, 'Hygiène et droguerie', 'Hygiène, pharmacie, droguerie, ...', '/images/category/hand-wash.svg', NULL),
(4, 'Papeterie & Bureautique', 'Fourniture de bureau, papeteries, piles, ...', '/images/category/stationery.svg', NULL),
(5, 'Petit matériels', 'Bazar, electroménager, jeux, ...', '/images/category/stock.svg', NULL),
(6, 'Aménagements', 'Aménagement, chapiteaux, tentes, ...', '/images/category/wooden.svg', NULL),
(7, 'Mobilier', 'Table, chaise, ...', '/images/category/furniture.svg', NULL),
(8, 'Plomberie', 'Eviers, pompes, tuyaux, ...', '/images/category/plumbing.svg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `command`
--

CREATE TABLE `command` (
  `id` int(10) UNSIGNED NOT NULL,
  `command_nb` int(11) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `nb_item` int(11) DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `id_commission` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`id`, `command_nb`, `creation_date`, `nb_item`, `total_price`, `comment`, `status`, `id_commission`) VALUES
(1, 1, '2019-05-10 00:00:00', 10, 100, 'fghj', 0, NULL),
(2, 2, '2019-05-23 00:00:00', 50, 200, 'rtlol', 1, NULL),
(3, 3, '2019-05-08 00:00:00', 123, 1000, 'okokokokok', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_commission` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commission`
--

INSERT INTO `commission` (`id`, `name_commission`) VALUES
(1, 'Com1'),
(2, 'Com2'),
(3, 'Com3');

-- --------------------------------------------------------

--
-- Table structure for table `link_command_product`
--

CREATE TABLE `link_command_product` (
  `id_command` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_command_product`
--

INSERT INTO `link_command_product` (`id_command`, `id_product`, `quantity`) VALUES
(1, 1, 1),
(1, 5, 7),
(1, 6, 2),
(1, 9, 3),
(2, 7, 1),
(2, 11, 1),
(2, 14, 3),
(3, 6, 1),
(3, 10, 4),
(3, 12, 100),
(3, 13, 10);

-- --------------------------------------------------------

--
-- Table structure for table `link_member_category`
--

CREATE TABLE `link_member_category` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `id_category` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_member_category`
--

INSERT INTO `link_member_category` (`id_member`, `id_category`) VALUES
(1, 1),
(2, 1),
(3, 1),
(1, 2),
(3, 2),
(2, 3),
(4, 3),
(2, 5),
(1, 6),
(2, 6),
(3, 7),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `link_member_command`
--

CREATE TABLE `link_member_command` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `id_command` int(10) UNSIGNED NOT NULL,
  `valid` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_member_command`
--

INSERT INTO `link_member_command` (`id_member`, `id_command`, `valid`) VALUES
(2, 1, NULL),
(3, 2, NULL),
(4, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `link_member_member`
--

CREATE TABLE `link_member_member` (
  `id_member1` int(10) UNSIGNED NOT NULL,
  `id_commission` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_member_member`
--

INSERT INTO `link_member_member` (`id_member1`, `id_commission`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `link_member_product`
--

CREATE TABLE `link_member_product` (
  `id_member` int(10) UNSIGNED NOT NULL,
  `id_product` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `link_member_product`
--

INSERT INTO `link_member_product` (`id_member`, `id_product`) VALUES
(2, 8),
(2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_member` varchar(255) DEFAULT NULL,
  `email` varchar(64) NOT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `id_role` int(10) UNSIGNED DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `name_member`, `email`, `pass`, `valid`, `admin`, `budget`, `id_role`, `creation_date`) VALUES
(1, 'Theo', 'theo@gmail.com', '123', 1, 0, NULL, 1, '2019-05-14 10:02:04'),
(2, 'gerg', 'gerg@gmail.com', '1233', 1, 0, NULL, 2, '2019-05-14 10:02:04'),
(3, 'Maxime', 'maxime@gmail.com', '1234', 1, 1, NULL, 3, '2019-05-14 10:02:04'),
(4, 'manar', 'manar@gmail.com', '1234', 1, 1, NULL, 3, '2019-05-14 10:02:04'),
(5, 'paul', 'qdsfghj', '0', 1, 0, NULL, 1, '2019-05-14 10:02:04'),
(6, 'sam', 'dfygjhk', '88888', 1, 0, NULL, 2, '2019-05-14 10:02:04'),
(7, 'lili', 'dfthgjk', '789', 1, 0, NULL, 3, '2019-05-14 10:02:04'),
(8, 'soso', 'rtgyhu', '890', 1, 0, NULL, 1, '2019-05-14 10:02:04'),
(9, 'toto', 'fdghhj', '888', 1, 0, NULL, 1, '2019-05-14 10:02:04'),
(11, 'New', 'New@test.com', 'User', 1, 0, NULL, 2, '2019-05-14 10:02:04'),
(12, 'New2', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-14 10:02:04'),
(13, 'New2', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-14 10:03:17'),
(14, 'New2', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-15 07:39:13'),
(15, '', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-15 07:43:12'),
(16, 'New2', 'New2@test.com', '123456', 1, 0, NULL, 3, '2019-05-16 11:18:32'),
(17, 'oui', 'qwewqe@qwe.fr', 'non', 1, 0, NULL, 1, '2019-05-23 12:26:15'),
(23, 'aaaaa', 'New2@test.com', '$2y$10$BgIOLyUpKIkz92vnZxXQ/ud/Vh7YvqLXVK5xWj/GRtPUeDFVOTHr6', 1, 0, NULL, 1, '2019-05-23 12:36:51'),
(24, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$dUqSD7Z1yfAK/moBHgOJ6eV02V.plIp6THeC2BQhGAPf2vdC6qG5O', 1, 0, NULL, 1, '2019-05-23 13:11:34'),
(26, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$YSC00y3ibkEaHXDVWHiisun4uW7KBvToTm6AHBwvNEKdWN/i77xSO', 1, 0, NULL, 1, '2019-05-23 13:27:26'),
(27, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$Tpa.mqASyLIicQ1O.Svx3uYvlvH8VKihUALmznGWtWyZUdiw.OZFy', 1, 0, NULL, 1, '2019-05-23 14:10:52'),
(29, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$hirIQ4C.FUcgQxSRM65Pw..NMNo4STeG6pQaTigAccxhr.UcRJh2i', 1, 0, NULL, 1, '2019-05-23 14:46:59'),
(30, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$dyAb6nnXvEv/by3brpHAJ.5/yb24mYzSHzYhjvl22EnD8HWhzRQaa', 1, 0, NULL, 1, '2019-05-23 14:47:37'),
(31, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$b5UhDtXBvZVdVQxj4o4qMuDZcmqE0J85Pcj5T3i.tDCyt0hJmt2UG', 1, 0, NULL, 1, '2019-05-23 14:50:26'),
(32, 'Nouvel Utilisateur', 'adresse@test.com', '$2y$10$PIPI/Ck8xv1/CuqAARYqTeg5HyDCWqV5sP31hasOGeMF3.yAvmub2', 1, 0, NULL, 1, '2019-05-23 14:52:28'),
(49, 'Hello', 'adresse@test.com', '$2y$10$SbzMW22zU4PUNOBk3eL8LuGYjZRbN8O6jVD.0HvJ4/f35qGWSzVzq', 1, 0, NULL, 1, '2019-05-23 15:24:57'),
(50, 'AA', 'adresse@test.com', '$2y$10$ASGDI7JD7df7pJtPKy8EF.zEi0v6UnSpv1p0eP8U/KiR7wtXbnG96', 1, 0, NULL, 1, '2019-05-23 15:26:04'),
(51, 'AA', 'adresse@test.com', '$2y$10$AxSL8yM6OT.fsT4AnqVzcu8KKczPl7b7/teo4ZW5TRND0Y4feaE.e', 1, 0, NULL, 1, '2019-05-23 15:26:43'),
(53, 'AA', 'adresse@test.com', '$2y$10$lrLNvdBAUYLqo1aowCUjg.GxOEQrF3QoZ2Wiw.aqthr3ktDcJCZTy', 1, 0, NULL, 1, '2019-05-24 07:54:27'),
(54, 'AA', 'adresse@test.com', '$2y$10$LjWDcs/rdna2UR06Jjv99.sWDFmCxQMeA9MnQla45VgaiYp8qleha', 1, 0, NULL, 1, '2019-05-24 09:17:19'),
(55, 'AA', 'adresse@test.com', '$2y$10$qCkAyLXozb7CnsYiCQ2xoOEC8S7eb08CjNNHUBgMwL/Hwpwh01/m6', 1, 0, NULL, 1, '2019-05-24 09:18:03'),
(56, 'azert', '', '$2y$10$ZfFH8.k1AJ06pOQ0MbsZWO1LBXJFmr0rVMRxcT8PoCJlrqG97CbNW', 1, 0, NULL, 1, '2019-05-24 09:29:52'),
(59, 'Doe Jhon', 'jhon@doe.com', '$2y$10$k/bCHDMeGDNIzxLXmsVxR.cgoDgOIpsA89H8h5D9nQWzvaLRvf4ei', 1, 0, NULL, 1, '2019-05-24 09:38:16'),
(64, 'Clark Emilie', 'emilie@clark.com', '$2y$10$TRazOc.btSyYhmlk4SyXJOeNyzE2gJlTC2THCiQBs2VLaa2UKB9ZK', 1, 0, NULL, 1, '2019-05-24 10:00:07'),
(69, 'Mikeokok', 'mike@codeofaninja.com', '$2y$10$2jHm0htBT5aGf5bZTDZ09.POLGq/JMsxlFuj1HmyL9vUtLbcsqHF.', 1, 0, NULL, 1, '2019-05-24 10:02:50'),
(70, 'Mikeokok', 'mike@codeofaninja.com', '$2y$10$xXa9Z58Wj8cnYe57tgKSpO3gQ0G5EtZNcBgvRG/bQ5FvRomV0bwzK', 1, 0, NULL, 1, '2019-05-24 10:03:46'),
(72, 'hhhh', 'email@zae.fr', '$2y$10$O0M1EwwMeqiCH9kIZfpU5ueV6lcvpDUXNa3uf7L/I1SerDM/Rl5Lm', 1, 0, NULL, 2, '2019-05-24 10:15:40'),
(73, 'Mikeokok', 'mike@codeofaninja.com', '$2y$10$vs72.nFk36aBJP4qWl7so.43bNm0GRrEGAD1bB1DUwL6DJiNcMZpS', 1, 0, NULL, 1, '2019-05-24 10:18:54'),
(74, 'Mikeokok', 'mike@codeofaninja.com', '$2y$10$oHKxUTSuYM1zV6CU0IXKlOqFVZdlkzi3p1vr89eDTAPSs.qU3kkW6', 1, 0, NULL, 1, '2019-05-24 10:19:43'),
(75, 'Hello', 'hello@theo.com', '$2y$10$eOCLSud.jaH83ZLr3o53ieL5JR39IT/mX/UrBLo1r1Hkk295c/p.y', 1, 0, NULL, 3, '2019-05-24 10:20:25'),
(76, 'Testpoourtheo', 'test@theo.com', '$2y$10$XkkaUyVmUWq7Q3lVMFswzeNSjAsyIhICApt0hQpYR0ZWGtjN6//TG', 1, 0, NULL, 3, '2019-05-24 10:21:58'),
(77, 'Deuxiemetestpourtheo', 'deuxieme@test.com', '$2y$10$MYL5TBba3SSHN6dSbzg3tuTTs5D1e.lU8STAFPpbXcbgZSs4e1sQO', 1, 0, NULL, 2, '2019-05-24 10:22:38'),
(78, 'Deuxiemetestpourtheo', 'deuxieme@test.com', '$2y$10$zLsJrEhmPFX8nue1jhN4rOmWgm5nA2CaI0YCXrF8Oh3DW2N.JA9RK', 1, 0, NULL, 2, '2019-05-24 10:25:43'),
(84, 'Test Test 02', 'Test@02.com', '$2y$10$0dCFWPTtqFjhuijxrkUrPOupgdTDotsmu6m1ZmpWTRhfNjgfHyTFa', 1, 0, NULL, 2, '2019-07-08 12:39:58'),
(86, 'Database test', 'data@base.com', '$2y$10$kkIjS5xyPNWaVCtwRhjxueqF.Evgc.wUFd2ugV9xZVD9qtkdle3Se', 1, 0, NULL, 1, '2019-07-09 09:22:22'),
(88, 'php', 'php', '$2y$10$0nczaEKYIRr2CKBcAuo4Wu.iJqnPNLIbypfbVA5EqOAdoGJTaFXGO', 1, 1, NULL, 2, '2019-07-11 15:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `notification` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `id_sub_category` int(10) UNSIGNED DEFAULT NULL,
  `id_provider` int(10) UNSIGNED DEFAULT NULL,
  `valid` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name_product`, `unit`, `price`, `stock`, `id_sub_category`, `id_provider`, `valid`) VALUES
(1, 'Café en grain', 'kg', 2, 0, 1, 2, NULL),
(2, 'marque1', 'piece', 4, 1, 1, 2, NULL),
(3, 'frigo', 'piece', 100, 0, 2, 3, NULL),
(5, 'Café Moulu', 'gr', 4, 1, 1, 2, NULL),
(6, 'Eau', 'Litre', 100, 1, 1, 3, NULL),
(7, 'Sirop De Citron', 'Litre', 100, 1, 1, 3, NULL),
(8, 'Baguette', 'piece', 100, 1, 2, 3, NULL),
(9, 'Bagel', 'piece', 100, 1, 2, 3, NULL),
(10, 'Croissant', 'piece', 100, 0, 2, 3, NULL),
(11, 'Bouteille cola', 'litre', 4, 1, 3, 2, NULL),
(12, 'Schtroumpfs', 'kg', 100, 0, 3, 3, NULL),
(13, 'Fraise tagada', 'kg', 100, 0, 3, 3, NULL),
(14, 'Dragibus', 'kg', 100, 0, 3, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_provider` varchar(255) NOT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `zip_code` varchar(45) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`id`, `name_provider`, `adress`, `zip_code`, `town`, `email`, `phone`) VALUES
(1, 'Auchan', '23 rue de la f', '37', 'Tours', NULL, '654343'),
(2, 'Express', '22 rue jean moulin', '37', 'Tours', NULL, NULL),
(3, 'conforma', '33 rue jean Francois', '37', 'Tours', NULL, '08799');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name_role`) VALUES
(1, 'RC'),
(2, 'RA'),
(3, 'Gestionnaire');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text,
  `imageUrl` varchar(255) DEFAULT NULL,
  `id_category` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`id`, `title`, `description`, `imageUrl`, `id_category`) VALUES
(1, 'Boisson', 'Café, infusion, sirop...', '/images/subcategory/sake.svg', 1),
(2, 'Boulangerie', 'Bagel, Baguette, Croissant...', '/images/subcategory/bread.svg', 1),
(3, 'Confiserie', 'Dragibus, Fraises Tagada, Softi Fruits...', '/images/subcategory/candy.svg', 1),
(4, 'Epicerie Salée', 'Cacahuète, Houmous, Semoule de Blé...', '/images/subcategory/chips.svg', 1),
(5, 'Epicerie Sucrée', 'Chocolat en poudre, confiture d\\\'abricot, Galette au beurre...', '/images/subcategory/jam.svg', 1),
(6, 'Fruits et légumes frais', 'Abricot, Aneth, Cerise...', '/images/subcategory/harvest.svg', 1),
(7, 'Fruits sec', 'Abricot sec, Amandes, Dates sèches...', '/images/subcategory/almond.svg', 1),
(8, 'Sauces et condiments', 'Cornichons, Gros Sel, Poivre...', '/images/subcategory/salt-and-pepper.svg', 1),
(9, 'Surgelés', 'Pains Burger, Cornet de frites...', '/images/subcategory/snowflake.svg', 1),
(10, 'Viandes et Poissons', 'Jambon, Rillettes, Saindoux...', '/images/subcategory/meat.svg', 1),
(43, 'Cuisine', 'Bouilloire, cafetiere, film alimentaire...', '/images/subcategory/coffee-machine.svg', 2),
(44, 'Vaiselle', 'Corbeilles, couteaux, saladier...', '/images/subcategory/plate.svg', 2),
(45, 'Vaiselle bio-compostable', 'Assiettes en pulpe, couteaux en bois...', '/images/subcategory/bio.svg', 2),
(46, 'Hygiène', 'Diffuseur, essuie-tout, savon...', '/images/subcategory/snowflake.svg', 3),
(47, 'Droguerie', 'Bougie, pelotte de ficelle, film de palettisation transparent...', '/images/subcategory/aromatic-candle.svg', 3),
(48, 'Ménage', 'Balayette, brosse, désinfectant...', '/images/subcategory/broom.svg', 3),
(49, 'Pharmacie', 'Bombe anti-moustique, pince à tiques, Spay...', '/images/subcategory/pharma.svg', 3),
(50, 'Fournitures de bureau', 'Adhésif, colle, ciseaux...', '/images/subcategory/tape.svg', 4),
(51, 'Papeterie', 'Bloc Post-it, cahiers, chemise...', '/images/subcategory/post-it.svg', 4),
(52, 'Piles', 'Pile LR03 Alcaline, Pile LR6 Alcaline... ', '/images/subcategory/battery.svg', 4),
(53, 'Bazar', 'Cadenas, cintres, fil de peche...', '/images/subcategory/design.svg', 5),
(54, 'Électroménager et électricité', 'Aspirateur, fer à repasser, multi-prise...', '/images/subcategory/vacuum.svg', 5),
(55, 'Jeux', 'Ballon de football, boules de campagne, jeu de molky...', '/images/subcategory/ball.svg', 5),
(56, 'Luminaires', 'Halogènes, lampes de chevet, lampes sur pied...', '/images/subcategory/lighting.svg', 5),
(57, 'Aménagements', 'Abreuvoir, bacs plastique, barrières...', '/images/subcategory/water-trough.svg', 6),
(58, 'Chapiteaux-Tentes-Structures', 'Cabanes, chalets, ponts alu 2m...', '/images/subcategory/camping-tent.svg', 6);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_unit` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `FK_command_commission_idx` (`id_commission`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `link_command_product`
--
ALTER TABLE `link_command_product`
  ADD PRIMARY KEY (`id_command`,`id_product`),
  ADD KEY `fk_link_product3_idx` (`id_product`);

--
-- Indexes for table `link_member_category`
--
ALTER TABLE `link_member_category`
  ADD PRIMARY KEY (`id_member`,`id_category`),
  ADD KEY `fk_link_category1_idx` (`id_category`);

--
-- Indexes for table `link_member_command`
--
ALTER TABLE `link_member_command`
  ADD PRIMARY KEY (`id_member`,`id_command`),
  ADD KEY `fk_link_command4_idx` (`id_command`);

--
-- Indexes for table `link_member_member`
--
ALTER TABLE `link_member_member`
  ADD PRIMARY KEY (`id_member1`,`id_commission`),
  ADD KEY `fk_link_commission5_idx` (`id_commission`);

--
-- Indexes for table `link_member_product`
--
ALTER TABLE `link_member_product`
  ADD PRIMARY KEY (`id_member`,`id_product`),
  ADD KEY `fk_link_product2_idx` (`id_product`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_member_role_idx` (`id_role`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_product_sub_category_idx` (`id_sub_category`),
  ADD KEY `fk_product_provider_idx` (`id_provider`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_sub_category_category_idx` (`id_category`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `command`
--
ALTER TABLE `command`
  ADD CONSTRAINT `FK_command_commission` FOREIGN KEY (`id_commission`) REFERENCES `commission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_command_product`
--
ALTER TABLE `link_command_product`
  ADD CONSTRAINT `fk_link_command3` FOREIGN KEY (`id_command`) REFERENCES `command` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_product3` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_member_category`
--
ALTER TABLE `link_member_category`
  ADD CONSTRAINT `fk_link_category1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_member1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_member_command`
--
ALTER TABLE `link_member_command`
  ADD CONSTRAINT `fk_link_command4` FOREIGN KEY (`id_command`) REFERENCES `command` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_member4` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_member_member`
--
ALTER TABLE `link_member_member`
  ADD CONSTRAINT `fk_link_commission5` FOREIGN KEY (`id_commission`) REFERENCES `commission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_member5` FOREIGN KEY (`id_member1`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `link_member_product`
--
ALTER TABLE `link_member_product`
  ADD CONSTRAINT `fk_link_member2` FOREIGN KEY (`id_member`) REFERENCES `member` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_link_product2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `fk_member_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_provider` FOREIGN KEY (`id_provider`) REFERENCES `provider` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_product_sub_category` FOREIGN KEY (`id_sub_category`) REFERENCES `sub_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `fk_sub_category_category` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
