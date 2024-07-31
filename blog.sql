-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 30 juil. 2024 à 14:06
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `title`, `description`) VALUES
(1, 'pfe', 'description categorie pfe'),
(3, 'Art', 'Back to art again'),
(4, 'Scince and technologie', 'Descripion for Science and technologie added successfuly'),
(5, 'Uncategorizerd', 'this is the description of the uncategorized category'),
(6, 'Food', 'this a food category');

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int UNSIGNED DEFAULT NULL,
  `author_id` int UNSIGNED NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_blog_category` (`category_id`),
  KEY `FK_blog_author` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `thumbnail`, `date_time`, `category_id`, `author_id`, `is_featured`) VALUES
(2, 'test post', 'body of the test post heheheheh', '1722005025halie-west-25xggax4bSA-unsplash.jpg', '2024-07-26 14:43:45', 1, 10, 0),
(4, 'A normal blog about economy', 'This is the body of a wbesite blogs ', '1722084000blog85.jpg', '2024-07-27 12:40:00', 3, 5, 0),
(6, 'The Magic of Morning Routines', 'Starting your day with a routine can transform your mornings from chaotic to calm. Begin with a gentle stretch to awaken your muscles, followed by a mindful meditation session to clear your mind. A healthy breakfast fuels your body for the day ahead, and a quick read of your favorite book or news article sets the tone for your intellectual pursuits. By carving out this time for yourself, you&#039;re not only preparing for a productive day but also nurturing your well-being.', '1722087746blog31.jpg', '2024-07-27 13:42:26', 1, 5, 0),
(7, 'The Art of Decluttering', 'Decluttering is more than just tidying up; it&#039;s a journey towards simplicity and mindfulness. Start by identifying items that no longer serve a purpose or bring joy. Donate or recycle these items to give them a new life. As you clear physical clutter, you&#039;ll notice a mental clarity that wasn&#039;t there before. Each item you keep should have a designated space, fostering an environment of order and ease.', '1722087775blog19.jpg', '2024-07-27 13:42:56', 3, 5, 0),
(8, 'Exploring Culinary Delights', 'Food is not just sustenance; it&#039;s a cultural expression and a source of joy. Experimenting with new recipes can be an adventure for the senses. Try incorporating exotic spices, experimenting with cooking techniques, or even growing your own herbs. Each bite becomes a story, a memory, and a connection to the world around you.', '1722087799blog6.jpg', '2024-07-27 13:43:19', 6, 5, 1),
(9, 'The Power of Positive Thinking', 'Positive thinking isn&#039;t about ignoring life&#039;s challenges; it&#039;s about approaching them with optimism and resilience. Cultivate gratitude by focusing on the good in your life, no matter how small. Surround yourself with positive influences, whether it&#039;s uplifting books, motivational podcasts, or supportive friends. Over time, this mindset shift can lead to greater happiness and success.', '1722087824blog9.jpg', '2024-07-27 13:43:44', 1, 5, 0),
(10, 'The Joys of Solo Travel', 'Solo travel offers a unique opportunity for self-discovery and growth. It challenges you to step out of your comfort zone, navigate unfamiliar environments, and rely solely on yourself. Each journey becomes a personal adventure, filled with unexpected encounters and lessons that shape your perspective.', '1722087855blog8.jpg', '2024-07-27 13:44:15', 4, 5, 0),
(11, 'The Importance of Lifelong Learning', 'Learning doesn&#039;t end with graduation; it&#039;s a lifelong pursuit. Embrace curiosity and seek out new knowledge in areas that interest you. Whether it&#039;s through online courses, workshops, or simply reading, continuous learning keeps your mind sharp and opens doors to new opportunities.', '1722087879blog11.jpg', '2024-07-27 13:44:39', 1, 5, 0),
(12, 'The Benefits of Regular Exercise', 'Regular exercise is a cornerstone of good health. It boosts your energy levels, improves your mood, and strengthens your body. Find an activity you enjoy, whether it&#039;s running, yoga, or dancing, and make it a part of your daily routine. The benefits extend beyond physical health, contributing to mental well-being and overall quality of life.', '1722087902blog44.jpg', '2024-07-27 13:45:02', 4, 5, 0),
(13, 'The Beauty of Nature', 'Spending time in nature is a powerful way to recharge and reconnect with the world. Whether it&#039;s a hike through the woods, a walk along the beach, or simply sitting in a park, nature offers a sense of peace and tranquility. It&#039;s a reminder of the beauty and resilience of the natural world, inspiring us to live in harmony with our environment.', '1722087935blog7.jpg', '2024-07-27 13:45:35', 3, 5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `password`, `avatar`, `is_admin`) VALUES
(5, 'Abdellah', 'Raissouni', 'abdellah', 'abdlh@ensate-hub.com', '$2y$10$ZMB6BV0KqORztMCF6e.K.Olcxh64gJ98XyUXE/5iUrgbBbOn7uzzq', '1721759108WhatsApp Image 2024-05-31 at 21.05.51.jpeg', 1),
(9, 'Abdellah', 'Raissouni', 'abdellahRAISSOUNI', 'abdellah@gmail.com', '$2y$10$LzKE1ybjZxkz3sv34Y3CXeAUsjeAbg4ZS.po1roBxrEhFVOeFKj4y', '1721910969cropped_image.png', 1),
(10, 'test', 'test', 'test', 'test@gmail.com', '$2y$10$S29Nbxx1/NpBMIyzPnOQDOqjStEhxmHAHi9LERveD5flpTm5YdcVq', '1721946535odin-lined.png', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK_blog_author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_blog_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
