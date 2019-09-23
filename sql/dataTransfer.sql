-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 12, 2019 at 08:55 AM
-- Server version: 5.7.25
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `tds1`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
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
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `nb_items` int(11) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `commentaire` varchar(255) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prix_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `command`
--

INSERT INTO `command` (`id`, `date`, `nb_items`, `statut`, `commentaire`, `nom`, `prix_total`) VALUES
(1, '2019-05-10 00:00:00', 1, 0, 'fghj', '1', 100),
(2, '2019-05-23 00:00:00', 1, 1, 'rt', '2', 200),
(3, '2019-05-08 00:00:00', 123, 0, 'okokokokok', '?????', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `commande_has_Designation`
--

CREATE TABLE `commande_has_Designation` (
  `commande_id_commande` int(11) NOT NULL,
  `Designation_id` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `commission`
--

CREATE TABLE `commission` (
  `id` int(11) NOT NULL,
  `nom_commission` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `commission`
--

INSERT INTO `commission` (`id`, `nom_commission`) VALUES
(1, 'ABC'),
(2, 'ZA');

-- --------------------------------------------------------

--
-- Table structure for table `Designation`
--

CREATE TABLE `Designation` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `prix` int(11) NOT NULL,
  `sous_categories_id` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `fournisseur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Designation`
--

INSERT INTO `Designation` (`id`, `nom`, `unit`, `prix`, `sous_categories_id`, `stock`, `fournisseur_id`) VALUES
(1, 'Café en grain', 'kg', 2, 1, 0, 2),
(2, 'marque1', 'piece', 4, 1, 1, 2),
(3, 'frigo', 'piece', 100, 2, 0, 3),
(5, 'Café Moulu', 'gr', 4, 1, 1, 2),
(6, 'Eau', 'Litre', 100, 1, 1, 3),
(7, 'Sirop De Citron', 'Litre', 100, 1, 1, 3),
(8, 'Baguette', 'piece', 100, 2, 1, 3),
(9, 'Bagel', 'piece', 100, 2, 1, 3),
(10, 'Croissant', 'piece', 100, 2, 0, 3),
(11, 'Bouteille cola', 'litre', 4, 3, 1, 2),
(12, 'Schtroumpfs', 'kg', 100, 3, 0, 3),
(13, 'Fraise tagada', 'kg', 100, 3, 0, 3),
(14, 'Dragibus', 'kg', 100, 3, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `adresse` varchar(45) NOT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `tel` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `nom`, `adresse`, `cp`, `ville`, `email`, `tel`) VALUES
(1, 'Auchan', '23 rue de la f', '37', 'Tours', NULL, '654343'),
(2, 'Express', '22 rue jean moulin', '37', 'Tours', NULL, NULL),
(3, 'conforma', '33 rue jean Francois', '37', 'Tours', NULL, '08799');

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
-- Table structure for table `quantite`
--

CREATE TABLE `quantite` (
  `id` int(11) NOT NULL,
  `unit` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Role_utilisateur`
--

CREATE TABLE `Role_utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Role_utilisateur`
--

INSERT INTO `Role_utilisateur` (`id`, `nom`) VALUES
(1, 'RC'),
(2, 'RA'),
(3, 'Gestionnaire');

-- --------------------------------------------------------

--
-- Table structure for table `sous_categories`
--

CREATE TABLE `sous_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` text NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sous_categories`
--

INSERT INTO `sous_categories` (`id`, `title`, `description`, `imageUrl`, `categories_id`) VALUES
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
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `password` varchar(300) NOT NULL,
  `valid` tinyint(1) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `Role_utilisateur_id` int(11) DEFAULT NULL,
  `date_ajout` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `password`, `valid`, `email`, `admin`, `budget`, `Role_utilisateur_id`, `date_ajout`) VALUES
(1, 'Theo', '123', 1, 'theo@gmail.com', NULL, NULL, 1, '2019-05-14 10:02:04'),
(2, 'gerg', '1233', 1, 'gerg@gmail.com', NULL, NULL, 2, '2019-05-14 10:02:04'),
(3, 'Maxime', '1234', 1, 'maxime@gmail.com', NULL, NULL, 3, '2019-05-14 10:02:04'),
(4, 'manar', '1234', 1, 'manar@gmail.com', NULL, NULL, 3, '2019-05-14 10:02:04'),
(5, 'paul', '0', 1, 'qdsfghj', NULL, NULL, 1, '2019-05-14 10:02:04'),
(6, 'sam', '88888', 1, 'dfygjhk', NULL, NULL, 2, '2019-05-14 10:02:04'),
(7, 'lili', '789', 1, 'dfthgjk', NULL, NULL, 3, '2019-05-14 10:02:04'),
(8, 'soso', '890', 1, 'rtgyhu', NULL, NULL, 1, '2019-05-14 10:02:04'),
(9, 'toto', '888', 1, 'fdghhj', NULL, NULL, 1, '2019-05-14 10:02:04'),
(11, 'New', 'User', NULL, 'New@test.com', NULL, NULL, 2, '2019-05-14 10:02:04'),
(12, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-14 10:02:04'),
(13, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-14 10:03:17'),
(14, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-15 07:39:13'),
(15, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-15 07:43:12'),
(16, 'New2', '123456', NULL, 'New2@test.com', NULL, NULL, 3, '2019-05-16 11:18:32'),
(17, 'oui', 'non', NULL, 'qwewqe@qwe.fr', NULL, NULL, 1, '2019-05-23 12:26:15'),
(23, 'aaaaa', '$2y$10$BgIOLyUpKIkz92vnZxXQ/ud/Vh7YvqLXVK5xWj/GRtPUeDFVOTHr6', NULL, 'New2@test.com', NULL, NULL, 1, '2019-05-23 12:36:51'),
(24, 'Nouvel Utilisateur', '$2y$10$dUqSD7Z1yfAK/moBHgOJ6eV02V.plIp6THeC2BQhGAPf2vdC6qG5O', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 13:11:34'),
(25, '', '$2y$10$Uh5eGcw/OXfkUHXIL0mTee3SYsF432kBdwGNe1RED9oCx77AWswTa', NULL, '', NULL, NULL, NULL, '2019-05-23 13:27:25'),
(26, 'Nouvel Utilisateur', '$2y$10$YSC00y3ibkEaHXDVWHiisun4uW7KBvToTm6AHBwvNEKdWN/i77xSO', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 13:27:26'),
(27, 'Nouvel Utilisateur', '$2y$10$Tpa.mqASyLIicQ1O.Svx3uYvlvH8VKihUALmznGWtWyZUdiw.OZFy', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:10:52'),
(28, '', '$2y$10$KF0Byj2x/vMft6XbmdI.xetezd9H6mSNeboPKTYiwp0hpruqz233a', NULL, '', NULL, NULL, NULL, '2019-05-23 14:46:59'),
(29, 'Nouvel Utilisateur', '$2y$10$hirIQ4C.FUcgQxSRM65Pw..NMNo4STeG6pQaTigAccxhr.UcRJh2i', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:46:59'),
(30, 'Nouvel Utilisateur', '$2y$10$dyAb6nnXvEv/by3brpHAJ.5/yb24mYzSHzYhjvl22EnD8HWhzRQaa', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:47:37'),
(31, 'Nouvel Utilisateur', '$2y$10$b5UhDtXBvZVdVQxj4o4qMuDZcmqE0J85Pcj5T3i.tDCyt0hJmt2UG', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:50:26'),
(32, 'Nouvel Utilisateur', '$2y$10$PIPI/Ck8xv1/CuqAARYqTeg5HyDCWqV5sP31hasOGeMF3.yAvmub2', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 14:52:28'),
(33, '', '$2y$10$IBvaEUsT0mncQ1rh2zz3cOLovKFvxcfKWVXvTdtL7PufyzdUVvUW6', NULL, '', NULL, NULL, NULL, '2019-05-23 15:16:23'),
(34, '', '$2y$10$4Wf9QDLdz/QXEkxpJDl3ie0zsfkBUS9pJ6fRKh9MmrVRJtQOfVcli', NULL, '', NULL, NULL, NULL, '2019-05-23 15:17:15'),
(35, '', '$2y$10$A4WOdzJjS8LwO5cyjXiYhOAYMzmp2TaH/repp9782KobVqx/lLOxS', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:38'),
(36, '', '$2y$10$oaOdDiaChRQ2Z6OKcxIcZebWx98SnIJdr2KgzgqcCE7s16lF9Raje', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:39'),
(37, '', '$2y$10$jn5Rigpho/TrJsw1X2IxmOjfN4NstoPOU01vc6O2AnRr1pjQbpnqm', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:40'),
(38, '', '$2y$10$BydIeLx.9BCtncNk6.m91.XDpfGCQRah1gwuZ6saGYKA49aoFyUv2', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:43'),
(39, '', '$2y$10$jZ6uMYEBAAuRki8Gd3IjpuGrL5V8zIcjW.DZqz6pIJUb7YWDlRoWW', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:48'),
(40, '', '$2y$10$/h3w9tkaQvFUvY7Q6Eoshe0oSweRUC2wF1iPG71rV2OwsOLnVg5DC', NULL, '', NULL, NULL, NULL, '2019-05-23 15:19:49'),
(41, '', '$2y$10$iAYUBHouHUJOTP4EtZyY/eQ69MQIzsfxhJ10VG7rx46jMKl75Gezm', NULL, '', NULL, NULL, NULL, '2019-05-23 15:21:57'),
(42, '', '$2y$10$A0m0XNheKdX9AcXFOD/wzO6ZVXhmQ98NKaENGGg70QGtPnc3Jh5Ym', NULL, '', NULL, NULL, NULL, '2019-05-23 15:22:04'),
(43, '', '$2y$10$uwK12tDRo/b4hO4ubHK5KeLYFqlZ3TRvdM5KOgUBHTc3MLNBHQ/fa', NULL, '', NULL, NULL, NULL, '2019-05-23 15:22:10'),
(44, '', '$2y$10$tUXN3wWrj1FdHSW//faSz.62yUAr4rkpRXyWPGRwov8B3zT5UFu9u', NULL, '', NULL, NULL, NULL, '2019-05-23 15:22:50'),
(45, '', '$2y$10$eubpEUJdo5j8qsVVRy7Tp.kyGRhztsX6415oZWzgCrWcpJIVzLJ8q', NULL, '', NULL, NULL, NULL, '2019-05-23 15:24:28'),
(46, '', '$2y$10$XxViwUG2nd/4BEUCStBK/e1uh1Jn/YTiDl3PBLbYHGvtvb4ggCEnm', NULL, '', NULL, NULL, NULL, '2019-05-23 15:24:45'),
(47, '', '$2y$10$pb/IOcXcEUTC8LW8Nx7MmeaDeS0qVfwOELXZni2SFKU3fMqH8xJcu', NULL, '', NULL, NULL, NULL, '2019-05-23 15:24:45'),
(48, '', '$2y$10$zVrv5Xjdj2NuJugf4xX9EO3o.RqIabrYgL4DPXoUq2m4YTGF24b3y', NULL, '', NULL, NULL, NULL, '2019-05-23 15:24:57'),
(49, 'Hello', '$2y$10$SbzMW22zU4PUNOBk3eL8LuGYjZRbN8O6jVD.0HvJ4/f35qGWSzVzq', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 15:24:57'),
(50, 'AA', '$2y$10$ASGDI7JD7df7pJtPKy8EF.zEi0v6UnSpv1p0eP8U/KiR7wtXbnG96', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 15:26:04'),
(51, 'AA', '$2y$10$AxSL8yM6OT.fsT4AnqVzcu8KKczPl7b7/teo4ZW5TRND0Y4feaE.e', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-23 15:26:43'),
(52, '', '$2y$10$wWyGrb/A5KDXjgvL94QTT.UjpUC2u0anzgJ9/Qy5PicLDnDXIqLce', NULL, '', NULL, NULL, NULL, '2019-05-24 07:54:27'),
(53, 'AA', '$2y$10$lrLNvdBAUYLqo1aowCUjg.GxOEQrF3QoZ2Wiw.aqthr3ktDcJCZTy', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-24 07:54:27'),
(54, 'AA', '$2y$10$LjWDcs/rdna2UR06Jjv99.sWDFmCxQMeA9MnQla45VgaiYp8qleha', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-24 09:17:19'),
(55, 'AA', '$2y$10$qCkAyLXozb7CnsYiCQ2xoOEC8S7eb08CjNNHUBgMwL/Hwpwh01/m6', NULL, 'adresse@test.com', NULL, NULL, 1, '2019-05-24 09:18:03'),
(56, 'azert', '$2y$10$ZfFH8.k1AJ06pOQ0MbsZWO1LBXJFmr0rVMRxcT8PoCJlrqG97CbNW', NULL, '', NULL, NULL, 1, '2019-05-24 09:29:52'),
(57, '', '$2y$10$Lb0sEUQvWCN3jw.Yrkekve3rlP7ibkUK2TNmiRnRiSxr6XYs9K4hy', NULL, '', NULL, NULL, NULL, '2019-05-24 09:35:08'),
(58, '', '$2y$10$ae.hQXcKT33Z1ehiAqMzCO7dSEBWOOK62oxnL4I/Neceisx5SyL0W', NULL, '', NULL, NULL, NULL, '2019-05-24 09:38:15'),
(59, 'Doe Jhon', '$2y$10$k/bCHDMeGDNIzxLXmsVxR.cgoDgOIpsA89H8h5D9nQWzvaLRvf4ei', NULL, 'jhon@doe.com', NULL, NULL, 1, '2019-05-24 09:38:16'),
(60, 'Mike', '$2y$10$lnzjBjNRAfSGlj6hMwynoua40sg.ijJ5baPd4HlwCbJ9J9I2qgcii', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 09:55:34'),
(61, '', '$2y$10$g7dc/u8.tJmESyaQ.UTGKeKjp4XgsbSpYX2XhadkFPx8eZP3cUYya', NULL, '', NULL, NULL, NULL, '2019-05-24 09:57:46'),
(62, 'Mike', '$2y$10$uDNwf2GGx9j5/VjHbw2z9edGy7.THWmpthWrd/ppdkvO8rDngcPZK', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 09:59:27'),
(63, 'Mike', '$2y$10$R1xhRJmlX4KwnxXz.bZ9jek1fECbUu8RoxUIaohSveWUqa5XiA9eC', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 09:59:52'),
(64, 'Clark Emilie', '$2y$10$TRazOc.btSyYhmlk4SyXJOeNyzE2gJlTC2THCiQBs2VLaa2UKB9ZK', NULL, 'emilie@clark.com', NULL, NULL, 1, '2019-05-24 10:00:07'),
(65, 'Mike', '$2y$10$leISEAoiQY0HuFUnN8VtfuTWFIilYflqkXDIgQK6yiEEhPzAv9H9a', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 10:00:31'),
(66, 'Mikeokok', '$2y$10$Ff6zc4EytVzQYLjKTBI4se5GMaIJU.0rTGXksmmEe.Tl0XxDftpoa', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 10:00:37'),
(67, '', '$2y$10$FV3onA5Ocroc8aPBNd..yOnjuVtq/xxogTOJJKNJUjvpiesNb0JBG', NULL, '', NULL, NULL, NULL, '2019-05-24 10:00:43'),
(68, 'Mikeokok', '$2y$10$HDZnlJfBQ0NRXd629RbkI.HeLPLIJ.aQASDH5bsCfstlXQKegIkDK', NULL, 'mike@codeofaninja.com', NULL, NULL, NULL, '2019-05-24 10:02:30'),
(69, 'Mikeokok', '$2y$10$2jHm0htBT5aGf5bZTDZ09.POLGq/JMsxlFuj1HmyL9vUtLbcsqHF.', NULL, 'mike@codeofaninja.com', NULL, NULL, 1, '2019-05-24 10:02:50'),
(70, 'Mikeokok', '$2y$10$xXa9Z58Wj8cnYe57tgKSpO3gQ0G5EtZNcBgvRG/bQ5FvRomV0bwzK', NULL, 'mike@codeofaninja.com', NULL, NULL, 1, '2019-05-24 10:03:46'),
(71, 'hello', '$2y$10$FqXvz2f3TyKxO8cM4iM49uWQMo2v58WyMpl7AChR1um6/PtNi5FGK', NULL, 'hello@world.com', NULL, NULL, NULL, '2019-05-24 10:04:11'),
(72, 'hhhh', '$2y$10$O0M1EwwMeqiCH9kIZfpU5ueV6lcvpDUXNa3uf7L/I1SerDM/Rl5Lm', NULL, 'email@zae.fr', NULL, NULL, 2, '2019-05-24 10:15:40'),
(73, 'Mikeokok', '$2y$10$vs72.nFk36aBJP4qWl7so.43bNm0GRrEGAD1bB1DUwL6DJiNcMZpS', NULL, 'mike@codeofaninja.com', NULL, NULL, 1, '2019-05-24 10:18:54'),
(74, 'Mikeokok', '$2y$10$oHKxUTSuYM1zV6CU0IXKlOqFVZdlkzi3p1vr89eDTAPSs.qU3kkW6', NULL, 'mike@codeofaninja.com', NULL, NULL, 1, '2019-05-24 10:19:43'),
(75, 'Hello', '$2y$10$eOCLSud.jaH83ZLr3o53ieL5JR39IT/mX/UrBLo1r1Hkk295c/p.y', NULL, 'hello@theo.com', NULL, NULL, 3, '2019-05-24 10:20:25'),
(76, 'Testpoourtheo', '$2y$10$XkkaUyVmUWq7Q3lVMFswzeNSjAsyIhICApt0hQpYR0ZWGtjN6//TG', NULL, 'test@theo.com', NULL, NULL, 3, '2019-05-24 10:21:58'),
(77, 'Deuxiemetestpourtheo', '$2y$10$MYL5TBba3SSHN6dSbzg3tuTTs5D1e.lU8STAFPpbXcbgZSs4e1sQO', NULL, 'deuxieme@test.com', NULL, NULL, 2, '2019-05-24 10:22:38'),
(78, 'Deuxiemetestpourtheo', '$2y$10$zLsJrEhmPFX8nue1jhN4rOmWgm5nA2CaI0YCXrF8Oh3DW2N.JA9RK', NULL, 'deuxieme@test.com', NULL, NULL, 2, '2019-05-24 10:25:43'),
(79, '', '$2y$10$Q5/J0cRka.PHuIGFcg7xS.VqQkvId4QdRGmrrOjud3AuJqB1gUE5O', NULL, '', NULL, NULL, NULL, '2019-05-24 12:21:43'),
(80, '', '$2y$10$jpxurLaaYSj7fHu66v04iu229iECrV3/e99zINnAzuS3SSWPJ4WWO', NULL, '', NULL, NULL, NULL, '2019-05-24 12:21:51'),
(81, '', '$2y$10$Lb9uknck/HspxlPVALgtGOUG3wNJfuvAamUhpYs1S7ylixu5jX6J6', NULL, '', NULL, NULL, NULL, '2019-05-24 12:21:52'),
(82, '', '$2y$10$IGEieQ/bgUWTtjCJLqH6guhznW1XcTRq8y8XYI8iIYvll0OEJbrRa', NULL, '', NULL, NULL, NULL, '2019-07-08 09:36:17'),
(83, '', '$2y$10$GNsFIRo59GIM5xDguq24K./rX02FeZoMuZx6gGBdShBb7Jv40d2CS', NULL, '', NULL, NULL, NULL, '2019-07-08 12:39:58'),
(84, 'Test Test 02', '$2y$10$0dCFWPTtqFjhuijxrkUrPOupgdTDotsmu6m1ZmpWTRhfNjgfHyTFa', NULL, 'Test@02.com', NULL, NULL, 2, '2019-07-08 12:39:58'),
(85, '', '$2y$10$xW18TUZVrDBfAB21lMejpe5lxrVhCwGGZvhOsOx1R4AQ04K0D8ub6', NULL, '', NULL, NULL, NULL, '2019-07-09 09:22:21'),
(86, 'Database test', '$2y$10$kkIjS5xyPNWaVCtwRhjxueqF.Evgc.wUFd2ugV9xZVD9qtkdle3Se', NULL, 'data@base.com', NULL, NULL, 1, '2019-07-09 09:22:22'),
(87, '', '$2y$10$WP65TPS3n0/6KM8J6aLf6OtImk7zXb3kgWLfrwN4Z5SH4szLxW2QG', NULL, '', NULL, NULL, NULL, '2019-07-11 15:16:12'),
(88, 'php', '$2y$10$0nczaEKYIRr2CKBcAuo4Wu.iJqnPNLIbypfbVA5EqOAdoGJTaFXGO', NULL, 'php', NULL, NULL, 2, '2019-07-11 15:28:11');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_has_categories`
--

CREATE TABLE `utilisateur_has_categories` (
  `utilisateur_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur_has_categories`
--

INSERT INTO `utilisateur_has_categories` (`utilisateur_id`, `categories_id`) VALUES
(4, 1),
(7, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_has_commande`
--

CREATE TABLE `utilisateur_has_commande` (
  `utilisateur_id` int(11) NOT NULL,
  `commande_id_commande` int(11) NOT NULL,
  `valid` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur_has_commande`
--

INSERT INTO `utilisateur_has_commande` (`utilisateur_id`, `commande_id_commande`, `valid`) VALUES
(1, 2, 0),
(4, 3, 0),
(5, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_has_Designation`
--

CREATE TABLE `utilisateur_has_Designation` (
  `utilisateur_id` int(11) NOT NULL,
  `Designation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_has_utilisateur`
--

CREATE TABLE `utilisateur_has_utilisateur` (
  `utilisateur_id` int(11) NOT NULL,
  `utilisateur_id1` int(11) NOT NULL,
  `commission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilisateur_has_utilisateur`
--

INSERT INTO `utilisateur_has_utilisateur` (`utilisateur_id`, `utilisateur_id1`, `commission_id`) VALUES
(2, 5, 1),
(2, 8, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `command`
--
ALTER TABLE `command`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commande_has_Designation`
--
ALTER TABLE `commande_has_Designation`
  ADD PRIMARY KEY (`commande_id_commande`,`Designation_id`),
  ADD KEY `fk_commande_has_Designation_Designation1_idx` (`Designation_id`),
  ADD KEY `fk_commande_has_Designation_commande1_idx` (`commande_id_commande`);

--
-- Indexes for table `commission`
--
ALTER TABLE `commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Designation`
--
ALTER TABLE `Designation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Designation_sous-categories1_idx` (`sous_categories_id`),
  ADD KEY `fk_Designation_fournisseur1_idx` (`fournisseur_id`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `quantite`
--
ALTER TABLE `quantite`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Role_utilisateur`
--
ALTER TABLE `Role_utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sous_categories`
--
ALTER TABLE `sous_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sous-categories_categories_idx` (`categories_id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_utilisateur_nom-utilisateur1_idx` (`Role_utilisateur_id`);

--
-- Indexes for table `utilisateur_has_categories`
--
ALTER TABLE `utilisateur_has_categories`
  ADD PRIMARY KEY (`utilisateur_id`,`categories_id`),
  ADD KEY `fk_utilisateur_has_categories_categories1_idx` (`categories_id`),
  ADD KEY `fk_utilisateur_has_categories_utilisateur1_idx` (`utilisateur_id`);

--
-- Indexes for table `utilisateur_has_commande`
--
ALTER TABLE `utilisateur_has_commande`
  ADD PRIMARY KEY (`utilisateur_id`,`commande_id_commande`),
  ADD KEY `fk_utilisateur_has_commande_commande1_idx` (`commande_id_commande`),
  ADD KEY `fk_utilisateur_has_commande_utilisateur1_idx` (`utilisateur_id`);

--
-- Indexes for table `utilisateur_has_Designation`
--
ALTER TABLE `utilisateur_has_Designation`
  ADD PRIMARY KEY (`utilisateur_id`,`Designation_id`),
  ADD KEY `fk_utilisateur_has_Designation_Designation1_idx` (`Designation_id`),
  ADD KEY `fk_utilisateur_has_Designation_utilisateur1_idx` (`utilisateur_id`);

--
-- Indexes for table `utilisateur_has_utilisateur`
--
ALTER TABLE `utilisateur_has_utilisateur`
  ADD PRIMARY KEY (`utilisateur_id`,`utilisateur_id1`),
  ADD KEY `fk_utilisateur_has_utilisateur_utilisateur2_idx` (`utilisateur_id1`),
  ADD KEY `fk_utilisateur_has_utilisateur_utilisateur1_idx` (`utilisateur_id`),
  ADD KEY `fk_utilisateur_has_utilisateur_commission1_idx` (`commission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `command`
--
ALTER TABLE `command`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commission`
--
ALTER TABLE `commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Designation`
--
ALTER TABLE `Designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quantite`
--
ALTER TABLE `quantite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Role_utilisateur`
--
ALTER TABLE `Role_utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sous_categories`
--
ALTER TABLE `sous_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande_has_Designation`
--
ALTER TABLE `commande_has_Designation`
  ADD CONSTRAINT `fk_commande_has_Designation_Designation1` FOREIGN KEY (`Designation_id`) REFERENCES `Designation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_has_Designation_commande1` FOREIGN KEY (`commande_id_commande`) REFERENCES `command` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Designation`
--
ALTER TABLE `Designation`
  ADD CONSTRAINT `fk_Designation_sous-categories1` FOREIGN KEY (`sous_categories_id`) REFERENCES `sous_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `utilisateur_has_categories`
--
ALTER TABLE `utilisateur_has_categories`
  ADD CONSTRAINT `fk_utilisateur_has_categories_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `utilisateur_has_commande`
--
ALTER TABLE `utilisateur_has_commande`
  ADD CONSTRAINT `fk_utilisateur_has_commande_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `utilisateur_has_Designation`
--
ALTER TABLE `utilisateur_has_Designation`
  ADD CONSTRAINT `fk_utilisateur_has_Designation_Designation1` FOREIGN KEY (`Designation_id`) REFERENCES `Designation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_utilisateur_has_Designation_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `utilisateur_has_utilisateur`
--
ALTER TABLE `utilisateur_has_utilisateur`
  ADD CONSTRAINT `fk_utilisateur_has_utilisateur_commission1` FOREIGN KEY (`commission_id`) REFERENCES `commission` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
