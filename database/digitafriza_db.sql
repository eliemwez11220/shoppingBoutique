-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mar. 15 sep. 2020 à 19:55
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `digitafriza_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_assets`
--

CREATE TABLE `tb_ca_assets` (
  `asset_id` int(11) NOT NULL,
  `asset_fullname` varchar(75) NOT NULL,
  `asset_login` varchar(75) DEFAULT NULL,
  `asset_password` varchar(75) NOT NULL,
  `asset_type` varchar(75) NOT NULL,
  `group_sid` int(11) DEFAULT NULL,
  `asset_email` varchar(75) NOT NULL,
  `asset_phone` varchar(75) NOT NULL,
  `asset_theme_default` varchar(75) NOT NULL,
  `asset_theme_session` varchar(75) NOT NULL,
  `asset_statut` enum('online','offline') DEFAULT 'online',
  `asset_date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  `asset_last_login` datetime DEFAULT NULL,
  `asset_last_update` datetime DEFAULT NULL,
  `asset_biography` text,
  `asset_avatar` varchar(75) DEFAULT NULL,
  `asset_role` enum('super','admin','simple') DEFAULT 'simple',
  `asset_profession` varchar(200) DEFAULT NULL,
  `asset_genre` varchar(20) DEFAULT NULL,
  `asset_civilite` varchar(75) DEFAULT NULL,
  `session_ouverte` enum('oui','non') NOT NULL DEFAULT 'non',
  `asset_password_saved` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_ca_assets`
--

INSERT INTO `tb_ca_assets` (`asset_id`, `asset_fullname`, `asset_login`, `asset_password`, `asset_type`, `group_sid`, `asset_email`, `asset_phone`, `asset_theme_default`, `asset_theme_session`, `asset_statut`, `asset_date_created`, `asset_last_login`, `asset_last_update`, `asset_biography`, `asset_avatar`, `asset_role`, `asset_profession`, `asset_genre`, `asset_civilite`, `session_ouverte`, `asset_password_saved`) VALUES
(3, 'dano lwakanda', 'danolwakanda', '$2y$12$Pr6wHqVN5dgoCTU0DFANfOUCsuCOr8IucfWm4inZjsCzhWzQxwtau', 'utilisateur', 3, 'danolwakanda74@gmail.com', '', '', '', 'online', '2020-06-30 21:56:37', '2020-09-15 19:09:53', NULL, NULL, NULL, 'simple', NULL, NULL, NULL, 'non', '$2y$12$AZ6Cp0qzqGstdW5UQYUDHe1XSt7feDZSaYxqa0RvTLMTx7yzLQPO6'),
(6, 'admin', 'admin', '$2y$12$4Tc5zm758S.2Jg.zo0LXC.QL7tgODZ8cmHDKjMQ2r9OFWhH4Z6O/.', 'administrateur', NULL, 'admin@danoshop.com', '', '', '', 'online', '2020-09-15 19:50:11', '2020-09-15 19:33:53', NULL, NULL, NULL, 'simple', NULL, NULL, NULL, 'non', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_avis_clients`
--

CREATE TABLE `tb_ca_avis_clients` (
  `avis_id` int(11) NOT NULL,
  `client_name` varchar(200) NOT NULL,
  `client_email` varchar(200) DEFAULT NULL,
  `avis_content` text NOT NULL,
  `avis_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_categories`
--

CREATE TABLE `tb_ca_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(75) NOT NULL,
  `category_image` varchar(75) DEFAULT NULL,
  `category_comments` text,
  `category_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_ca_categories`
--

INSERT INTO `tb_ca_categories` (`category_id`, `category_name`, `category_image`, `category_comments`, `category_date_created`, `category_date_update`) VALUES
(1, 'Sociale', '34bf1-eliemwez.png', '<blockquote>\n	<h3 style=\"text-align: center;\">\n		<strong>Cette categorie contient toutes les emissions en rapport avec les hommes.</strong></h3>\n</blockquote>\n', '2020-06-23 00:23:49', '2020-07-06 13:55:04'),
(2, 'Politique', NULL, '<p>\n	cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc</p>\n', '2020-07-06 10:59:02', NULL),
(3, 'societe', NULL, '<p>\n	Cette categorie contient tous les articles ayant trait a la societe civile</p>\n', '2020-07-12 20:54:08', NULL),
(4, 'sante', NULL, '<p>\n	Tous les articles de sante seront rattaches dans cette categorie</p>\n', '2020-07-12 20:55:26', NULL),
(5, 'sport', NULL, '<p>\n	Les articles de sports seront rattaches ici</p>\n', '2020-07-12 20:56:20', NULL),
(6, 'Sciences', NULL, '<p>\n	Les articles pour la science</p>\n', '2020-07-12 21:09:42', NULL),
(7, 'Technologie', NULL, '<p>\n	Tous les articles de la technologie</p>\n', '2020-07-12 21:10:13', NULL),
(8, 'Culture', NULL, '<p>\n	Tous les articles de la culture</p>\n', '2020-07-12 21:10:52', NULL),
(9, 'Economie', NULL, NULL, '2020-07-12 21:11:26', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_comments`
--

CREATE TABLE `tb_ca_comments` (
  `comment_id` int(11) NOT NULL,
  `comment_content` text NOT NULL,
  `post_sid` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `comment_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_communications`
--

CREATE TABLE `tb_ca_communications` (
  `com_id` int(11) NOT NULL,
  `com_title` varchar(200) NOT NULL,
  `com_content` text NOT NULL,
  `com_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `com_date_update` datetime DEFAULT NULL,
  `user_name_posted` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_contacts`
--

CREATE TABLE `tb_ca_contacts` (
  `contact_id` int(11) NOT NULL,
  `client_name` varchar(200) NOT NULL,
  `client_phone` varchar(50) NOT NULL,
  `client_email` varchar(200) NOT NULL,
  `client_address` text NOT NULL,
  `contact_object` varchar(250) NOT NULL,
  `contact_message` text NOT NULL,
  `contact_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_ca_contacts`
--

INSERT INTO `tb_ca_contacts` (`contact_id`, `client_name`, `client_phone`, `client_email`, `client_address`, `contact_object`, `contact_message`, `contact_created`) VALUES
(1, 'test contact', '0245550022', 'eliem2020@gmail.com', '<p>\n	Lubumbashi</p>\n', 'contact title', '<p>\n	contatc message</p>\n', '2020-06-22 23:04:06');

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_galeries`
--

CREATE TABLE `tb_ca_galeries` (
  `galerie_id` int(11) NOT NULL,
  `galerie_image` varchar(75) NOT NULL,
  `galerie_description` text,
  `galerie_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_ca_galeries`
--

INSERT INTO `tb_ca_galeries` (`galerie_id`, `galerie_image`, `galerie_description`, `galerie_date`) VALUES
(1, 'c360-9.jpg', 'first image', '2020-06-23 10:45:16'),
(2, 'c360-9.jpg', 'second image', '2020-06-23 10:45:16'),
(3, 'ac84-52.jpg', 'third', '2020-06-23 10:53:46'),
(4, 'ac84-52.jpg', 'three', '2020-06-23 10:53:46'),
(5, '8cc03-img-20200715-wa0022.jpg', NULL, '2020-07-15 17:20:06'),
(6, '5f097-img-20200715-wa0023.jpg', NULL, '2020-07-15 17:21:11');

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_groups`
--

CREATE TABLE `tb_ca_groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(75) DEFAULT NULL,
  `group_privilege` varchar(75) DEFAULT NULL,
  `group_comments` text,
  `group_date_created` datetime DEFAULT NULL,
  `group_date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_ca_groups`
--

INSERT INTO `tb_ca_groups` (`group_id`, `group_name`, `group_privilege`, `group_comments`, `group_date_created`, `group_date_update`) VALUES
(1, 'administrateur', 'All', NULL, NULL, NULL),
(2, 'Redacteurs', 'Create, Delete, Update', '<p>\n	Les redacteurs des articles et de commentaires</p>\n', '2020-06-30 21:40:14', NULL),
(3, 'Manager', 'Management all activities BackOffice', '<p>\n	Gestion de toutes les publications. Articles, Categories, Abonnements, Temoignages et Commentaires</p>\n', '2020-06-30 21:41:59', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_helps`
--

CREATE TABLE `tb_ca_helps` (
  `help_id` int(11) NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `help_subject` varchar(255) DEFAULT NULL,
  `help_issue` text,
  `date_logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_logs`
--

CREATE TABLE `tb_ca_logs` (
  `log_id` int(11) NOT NULL,
  `log_content` text,
  `log_status` varchar(75) NOT NULL DEFAULT 'online',
  `log_logged` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_natures_posts`
--

CREATE TABLE `tb_ca_natures_posts` (
  `nature_id` int(11) NOT NULL,
  `nature_name` varchar(75) NOT NULL,
  `nature_description` text NOT NULL,
  `nature_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_ca_natures_posts`
--

INSERT INTO `tb_ca_natures_posts` (`nature_id`, `nature_name`, `nature_description`, `nature_date_created`) VALUES
(1, 'informationelle', 'Cette nature contient des articles a carateres informationnelles seulement.', '2020-07-06 14:13:38'),
(2, 'petites annonces', 'Dans cette nature, vous trouverai des articles qui font des annonces de produits ou de services ou des publicites', '2020-07-06 14:13:38'),
(3, 'magazine', '<p>\n	Cette nature d&#39;articles contient tous les articles et les activites en rapport avec le magazine.&nbsp;</p>\n', '2020-07-12 20:46:05'),
(4, 'dossiers et debats', '<p>\n	Tous les dossiers /&nbsp; focus ainsi que les debats seront notees dans cette categories</p>\n', '2020-07-12 20:47:40'),
(5, 'echo des entreprises', '<p>\n	Vous trouverez les echo des entreprises dans cette nature</p>\n', '2020-07-12 20:48:57'),
(6, 'styles et beaute', '<p>\n	Dans cette nature des articles, on stock des informations sur le style et le mode</p>\n', '2020-07-12 20:50:56'),
(7, 'internet', '<p>\n	Coup d&#39;oeil sur le net. Cette nature contient des informations sur intenet.&nbsp;</p>\n', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_newsletters`
--

CREATE TABLE `tb_ca_newsletters` (
  `newsletter_id` int(11) NOT NULL,
  `user_email` varchar(75) NOT NULL,
  `user_name` varchar(75) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_passswords`
--

CREATE TABLE `tb_ca_passswords` (
  `pass_id` int(11) NOT NULL,
  `pass_email` varchar(255) NOT NULL,
  `pass_token` text NOT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_posts`
--

CREATE TABLE `tb_ca_posts` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(200) NOT NULL,
  `post_content` text NOT NULL,
  `post_image` varchar(75) DEFAULT NULL,
  `post_file` varchar(75) DEFAULT NULL,
  `post_video` varchar(75) DEFAULT NULL,
  `post_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_date_update` datetime DEFAULT NULL,
  `category_sid` int(11) NOT NULL,
  `nature_post_sid` int(11) DEFAULT NULL,
  `user_name_posted` varchar(200) DEFAULT NULL,
  `post_source_info` varchar(75) DEFAULT NULL,
  `post_lien_source_info` varchar(75) DEFAULT NULL,
  `post_statut` enum('public','brouillon') DEFAULT NULL,
  `total_views` int(11) DEFAULT NULL,
  `total_likes` int(11) DEFAULT NULL,
  `total_shared` int(11) DEFAULT NULL,
  `post_region` enum('provinciale','afrique','monde') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_ca_posts`
--

INSERT INTO `tb_ca_posts` (`post_id`, `post_title`, `post_content`, `post_image`, `post_file`, `post_video`, `post_date_created`, `post_date_update`, `category_sid`, `nature_post_sid`, `user_name_posted`, `post_source_info`, `post_lien_source_info`, `post_statut`, `total_views`, `total_likes`, `total_shared`, `post_region`) VALUES
(1, 'Premiere emission en rapport avec les activites sociales', '<h5 style=\"text-align: center;\">\n	<span style=\"text-align: justify; font-size: 12px;\">Le&nbsp;</span><strong style=\"text-align: justify; font-size: 12px;\">Lorem Ipsum</strong><span style=\"text-align: justify; font-size: 12px;\">&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles&nbsp;</span></h5>\n<h3 style=\"color: red; text-align: justify;\">\n	<small><q>Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.&nbsp;<span style=\"font-size: 12px;\">Le&nbsp;</span><strong style=\"text-align: justify; font-size: 12px;\">Lorem Ipsum</strong><span style=\"text-align: justify; font-size: 12px;\">&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression.</span></q></small></h3>\n<p style=\"text-align: right;\">\n	<strong><em>Pourquoi l&#39;utiliser?</em></strong></p>\n<p>\n	&nbsp;</p>\n', '1086f-femme_homme.png', NULL, NULL, '2020-07-06 00:29:20', '2020-07-06 13:51:50', 2, 1, 'Elie Mwez', 'Site Actualite', 'www.actualite.cd', 'public', 0, 0, 0, 'provinciale'),
(2, 'Deuxieme activite de developpement economique', '<h5 style=\"text-align: center;\">\n	Deuxieme activite de developpement economique.&nbsp;</h5>\n<p style=\"text-align: justify;\">\n	Le&nbsp;<strong>Lorem Ipsum</strong>&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</p>\n<blockquote>\n	<p style=\"text-align: justify;\">\n		Le&nbsp;<strong>Lorem Ipsum</strong>&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression.</p>\n</blockquote>\n<p style=\"text-align: right;\">\n	<strong><em>Pourquoi l&#39;utiliser?</em></strong></p>\n<p>\n	&nbsp;</p>\n', 'eliemwez.jpg', NULL, NULL, '2020-07-06 00:29:20', '2020-06-23 00:29:26', 1, 1, 'Elie Rubuz', 'Site Actualite', 'www.digitsys.com', 'public', 0, 0, 0, 'provinciale'),
(3, 'Troisieme activite de science et l\'environnement', '<h5 style=\"text-align: center;\">\n	<span style=\"text-align: justify; font-size: 12px;\">Le&nbsp;</span><strong style=\"text-align: justify; font-size: 12px;\">Lorem Ipsum</strong><span style=\"text-align: justify; font-size: 12px;\">&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</span></h5>\n<blockquote>\n	<p style=\"text-align: justify;\">\n		Le&nbsp;<strong>Lorem Ipsum</strong>&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression.</p>\n</blockquote>\n<p style=\"text-align: right;\">\n	<strong><em>Pourquoi l&#39;utiliser?</em></strong></p>\n<p>\n	&nbsp;</p>\n', '8865b-services_all.png', NULL, NULL, '2020-07-06 00:29:20', '2020-07-06 13:54:13', 1, 1, 'Elie Rubuz', 'Site Source Actualite', 'www.digitsys.com', 'public', 0, 0, 0, 'provinciale'),
(4, 'Test pub post Test pub post Test pub post', '<h3 style=\"text-align: justify;\">\n	<strong>Test pub post</strong></h3>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<h3 style=\"text-align: justify;\">\n	<strong>Test pub post</strong></h3>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	&nbsp;</p>\n<h3 style=\"text-align: right;\">\n	<strong><em>Test pub post</em></strong></h3>\n', '368a8-teams_shooting.png', '3a869-1_-_cv_elie-mwez-rubuz_2020-copy.pdf', NULL, '2020-07-06 11:02:19', NULL, 2, 5, 'Elie Mwez', NULL, NULL, 'public', NULL, NULL, NULL, 'provinciale'),
(5, 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. ', '<p>\n	Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo. Quisque sit amet est et sapien ullamcorper pharetra. Vestibulum erat wisi, condimentum sed, commodo vitae, ornare sit amet, wisi. Aenean fermentum, elit eget tincidunt condimentum, eros ipsum rutrum orci, sagittis tempus lacus enim ac dui. Donec non enim in turpis pulvinar facilisis. Ut felis. Praesent dapibus, neque id cursus faucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus</p>\n<p style=\"text-align: right;\">\n	affffffffffffffffffffffffffffffffffffffffff</p>\n', '539e4-our_team.png', NULL, NULL, '2020-07-07 00:06:56', NULL, 2, 1, 'Elie Mwez', 'Site Actualite', 'www.actualite.cd', 'public', 0, 0, 0, 'provinciale'),
(6, 'Internet des objects', '<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<blockquote>\n	<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n		<em><strong style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; margin: 0px; padding: 0px;\">Lorem Ipsum</strong><span style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></em></h2>\n</blockquote>\n<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<p>\n	&nbsp;</p>\n<ol>\n	<li>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n</ol>\n<p>\n	&nbsp;</p>\n', 'bc31c-pc2.jpg', NULL, NULL, '2020-07-12 21:07:04', NULL, 3, 7, 'Anonyme', 'Congo Agile News', 'congoagile.com', 'public', NULL, NULL, NULL, 'monde'),
(7, 'Techonologie de la telephonie', '<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<blockquote>\n	<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n		<em><strong style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; margin: 0px; padding: 0px;\">Lorem Ipsum</strong><span style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></em></h2>\n</blockquote>\n<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<p>\n	&nbsp;</p>\n<ol>\n	<li>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n</ol>\n<p>\n	&nbsp;</p>\n', '8768f-pc1.jpg', NULL, NULL, '2020-07-12 21:07:04', NULL, 6, 1, 'Anonyme', 'Congo Agile News', 'congoagile.com', 'public', NULL, NULL, NULL, 'monde'),
(8, 'Les appareils connectes', '<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<blockquote>\n	<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n		<em><strong style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; margin: 0px; padding: 0px;\">Lorem Ipsum</strong><span style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></em></h2>\n</blockquote>\n<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<p>\n	&nbsp;</p>\n<ol>\n	<li>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n</ol>\n<p>\n	&nbsp;</p>\n', '8768f-pc1.jpg', NULL, NULL, '2020-07-12 21:07:04', NULL, 7, 5, 'Anonyme', 'Congo Agile News', 'congoagile.com', 'public', NULL, NULL, NULL, 'provinciale'),
(9, 'Les appareils connectes deuxieme article', '<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<blockquote>\n	<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n		<em><strong style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; margin: 0px; padding: 0px;\">Lorem Ipsum</strong><span style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></em></h2>\n</blockquote>\n<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<p>\n	&nbsp;</p>\n<ol>\n	<li>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n</ol>\n<p>\n	&nbsp;</p>\n', '8768f-pc1.jpg', NULL, NULL, '2020-07-12 21:07:04', NULL, 7, 7, 'Anonyme', 'Congo Agile News', 'congoagile.com', 'public', NULL, NULL, NULL, 'monde'),
(10, 'Les appareils connectes troisieme article', '<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \" text-align:=\"\">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \" text-align:=\"\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<blockquote>\n	<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n		<em><strong style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px; margin: 0px; padding: 0px;\">Lorem Ipsum</strong><span style=\"color: rgb(34, 34, 34); font-family: Arial, Verdana, sans-serif; font-size: 12px;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></em></h2>\n</blockquote>\n<h2 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0); text-align: justify;\">\n	<strong font-size:=\"\" margin:=\"\" open=\"\" padding:=\"\" style=\"font-family: \">Lorem Ipsum</strong><span font-size:=\"\" open=\"\" style=\"font-family: \">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></h2>\n<p>\n	&nbsp;</p>\n<ol>\n	<li>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n	<li>\n		<h5>\n			&nbsp;</h5>\n		<h5 style=\"margin: 0px 0px 10px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\">\n			<strong>What is Lorem Ipsum?</strong></h5>\n	</li>\n</ol>\n<p>\n	&nbsp;</p>\n', '8768f-pc1.jpg', NULL, NULL, '2020-07-12 21:07:04', NULL, 7, 3, 'Anonyme', 'Congo Agile News', 'congoagile.com', 'public', NULL, NULL, NULL, 'monde'),
(11, 'Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor ', '<h3 style=\"text-align: justify;\">\n	<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc massa orci, mattis non sapien vitae, faucibus ullamcorper erat. Nullam volutpat mattis lectus, at hendrerit massa vehicula id. Integer ultricies nulla ut arcu vehicula, sit amet accumsan tortor mattis. Pellentesque dolor turpis, cursus vel turpis id, varius posuere dui. Cras eget metus a turpis efficitur aliquam vel hendrerit arcu. Quisque aliquet dolor erat, ac vestibulum ligula elementum vel. Cras sagittis faucibus velit id placerat. Donec tincidunt lacus et metus tincidunt, in mattis neque dictum.</span></h3>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<h3 style=\"text-align: justify;\">\n	<strong>Test pub post</strong></h3>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	&nbsp;</p>\n<h3 style=\"text-align: right;\">\n	<strong><em>Test pub post</em></strong></h3>\n', '368a8-teams_shooting.png', '3a869-1_-_cv_elie-mwez-rubuz_2020-copy.pdf', NULL, '2020-07-06 11:02:19', '2020-07-12 22:59:25', 2, 4, 'Elie Mwez', 'Congo Agile News', 'congoagile.com', 'public', NULL, NULL, NULL, 'provinciale'),
(12, 'Deuxieme Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor ', '<h3 style=\"text-align: justify;\">\n	<span font-size:=\"\" open=\"\" style=\"color: rgb(0, 0, 0); font-family: \">Deuxieme Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor . Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc massa orci, mattis non sapien vitae, faucibus ullamcorper erat. Nullam volutpat mattis lectus, at hendrerit massa vehicula id. Integer ultricies nulla ut arcu vehicula, sit amet accumsan tortor mattis. Pellentesque dolor turpis, cursus vel turpis id, varius posuere dui. Cras eget metus a turpis efficitur aliquam vel hendrerit arcu. Quisque aliquet dolor erat, ac vestibulum ligula elementum vel. Cras sagittis faucibus velit id placerat. Donec tincidunt lacus et metus tincidunt, in mattis neque dictum.</span></h3>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<h3 style=\"text-align: justify;\">\n	<strong>Test pub post</strong></h3>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	Test pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub postTest pub post</p>\n<p style=\"text-align: justify;\">\n	&nbsp;</p>\n<h3 style=\"text-align: right;\">\n	<strong><em>Test pub post</em></strong></h3>\n', '368a8-teams_shooting.png', '3a869-1_-_cv_elie-mwez-rubuz_2020-copy.pdf', NULL, '2020-07-06 11:02:19', '2020-07-12 22:59:25', 2, 4, 'Elie Mwez', 'Congo Agile News', 'congoagile.com', 'public', NULL, NULL, NULL, 'provinciale'),
(13, 'Activite de developpement economique', '<h5 style=\"text-align: justify;\">\n	<span style=\"text-align: justify; font-size: 12px;\">Le&nbsp;</span><strong style=\"text-align: justify; font-size: 12px;\">Lorem Ipsum</strong><span style=\"text-align: justify; font-size: 12px;\">&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</span></h5>\n<blockquote>\n	<p style=\"text-align: justify;\">\n		Le&nbsp;<strong>Lorem Ipsum</strong>&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression.</p>\n</blockquote>\n<p style=\"text-align: right;\">\n	<strong><em>Pourquoi l&#39;utiliser?</em></strong></p>\n<p>\n	&nbsp;</p>\n', 'eliemwez.jpg', NULL, NULL, '2020-07-06 00:29:20', '2020-06-23 00:29:26', 8, 6, 'Elie Rubuz', 'Site Actualite', 'www.digitsys.com', 'public', 0, 0, 0, 'provinciale'),
(14, 'Activite de science et l\'environnement', '<h5 style=\"text-align: justify;\">\n	<span style=\"text-align: justify; font-size: 12px;\">Le&nbsp;</span><strong style=\"text-align: justify; font-size: 12px;\">Lorem Ipsum</strong><span style=\"text-align: justify; font-size: 12px;\">&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</span></h5>\n<h5 style=\"text-align: justify;\">\n	<span style=\"font-size: 12px;\">Le&nbsp;</span><strong style=\"font-size: 12px;\">Lorem Ipsum</strong><span style=\"font-size: 12px;\">&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</span></h5>\n<h5 style=\"text-align: justify;\">\n	<span style=\"font-size: 12px;\">Le&nbsp;</span><strong style=\"font-size: 12px;\">Lorem Ipsum</strong><span style=\"font-size: 12px;\">&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</span></h5>\n<h5 style=\"text-align: justify;\">\n	<span style=\"font-size: 12px;\">Le&nbsp;</span><strong style=\"font-size: 12px;\">Lorem Ipsum</strong><span style=\"font-size: 12px;\">&nbsp;est simplement du faux texte employ&eacute; dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l&#39;imprimerie depuis les ann&eacute;es 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour r&eacute;aliser un livre sp&eacute;cimen de polices de texte. Il n&#39;a pas fait que survivre cinq si&egrave;cles, mais s&#39;est aussi adapt&eacute; &agrave; la bureautique informatique, sans que son contenu n&#39;en soit modifi&eacute;. Il a &eacute;t&eacute; popularis&eacute; dans les ann&eacute;es 1960 gr&acirc;ce &agrave; la vente de feuilles Letraset contenant des passages du Lorem Ipsum, et, plus r&eacute;cemment, par son inclusion dans des applications de mise en page de texte, comme Aldus PageMaker.</span></h5>\n<p>\n	&nbsp;</p>\n', '8865b-services_all.png', NULL, NULL, '2020-07-06 00:29:20', '2020-07-06 13:54:13', 6, 6, 'Elie Rubuz', 'Site Source Actualite', 'www.digitsys.com', 'public', 0, 0, 0, 'provinciale'),
(20, 'R1ddddddddddddignissim augue consequat commodo. Vestibulum in nibh tellus.', 'Aenean efficitur felis sed nibh ullamcorper varius. In cursus lectus nec condimentum tempus. Proin bibendum libero sapien, in ullamcorper odio scelerisque ut. Nunc porttitor leo molestie dui aliquam rutrum. Suspendisse egestas ante posuere vulputate luctus. Quisque non est lectus. Fusce fermentum efficitur tristique. Etiam commodo tristique suscipit.\r\n\r\nNullam nibh quam, venenatis at leo sed, molestie fermentum lectus. Aliquam sollicitudin porta enim, bibendum pretium ex dictum finibus. Nunc faucibus et felis in malesuada. Phasellus euismod, sem et consequat euismod, dolor nisi sodales libero, ut accumsan nulla urna id tortor. Etiam sem lacus, ornare ut mi vitae, gravida tincidunt leo. Quisque elementum, elit vitae feugiat hendrerit, quam mauris mattis nibh, ac sagittis purus turpis ac purus. Pellentesque massa velit, mattis nec sem id, ullamcorper efficitur augue. Morbi dapibus vestibulum orci, quis dignissim augue consequat commodo. Vestibulum in nibh tellus.\r\n\r\nCurabitur lacinia nunc et elit mollis maximus. Nulla vulputate quam massa. Etiam non diam feugiat, gravida ligula quis, varius odio. Donec ligula tellus, vehicula et feugiat vel, dignissim sit amet orci. Mauris nec nisi a nisi accumsan egestas. Nullam sed metus metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas suscipit augue sed posuere euismod. Donec porttitor, massa in auctor interdum, augue dui tristique felis, vel feugiat purus purus ultrices metus. Vivamus congue nunc et dolor sollicitudin, non dictum metus tincidunt. Vestibulum ligula justo, imperdiet vitae eleifend et, consequat ut ipsum. Ut bibendum maximus ipsum, at commodo metus luctus ut. Morbi porttitor nisl nec ipsum pulvinar sagittis. Nunc quis venenatis mi. Phasellus et suscipit nisi, at suscipit nisi. Pellentesque sed accumsan velit.', 'FlyerMaker_05072020_04254418.png', NULL, NULL, '2020-07-13 18:39:10', NULL, 7, 1, NULL, NULL, NULL, 'public', NULL, NULL, NULL, ''),
(21, 'Quisque non est lectus. Fusce fermentum efficitur tristique. Etiam commodo tristique suscipit.', 'Aenean efficitur felis sed nibh ullamcorper varius. In cursus lectus nec condimentum tempus. Proin bibendum libero sapien, in ullamcorper odio scelerisque ut. Nunc porttitor leo molestie dui aliquam rutrum. Suspendisse egestas ante posuere vulputate luctus. Quisque non est lectus. Fusce fermentum efficitur tristique. Etiam commodo tristique suscipit.\r\n\r\nNullam nibh quam, venenatis at leo sed, molestie fermentum lectus. Aliquam sollicitudin porta enim, bibendum pretium ex dictum finibus. Nunc faucibus et felis in malesuada. Phasellus euismod, sem et consequat euismod, dolor nisi sodales libero, ut accumsan nulla urna id tortor. Etiam sem lacus, ornare ut mi vitae, gravida tincidunt leo. Quisque elementum, elit vitae feugiat hendrerit, quam mauris mattis nibh, ac sagittis purus turpis ac purus. Pellentesque massa velit, mattis nec sem id, ullamcorper efficitur augue. Morbi dapibus vestibulum orci, quis dignissim augue consequat commodo. Vestibulum in nibh tellus.\r\n\r\nCurabitur lacinia nunc et elit mollis maximus. Nulla vulputate quam massa. Etiam non diam feugiat, gravida ligula quis, varius odio. Donec ligula tellus, vehicula et feugiat vel, dignissim sit amet orci. Mauris nec nisi a nisi accumsan egestas. Nullam sed metus metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas suscipit augue sed posuere euismod. Donec porttitor, massa in auctor interdum, augue dui tristique felis, vel feugiat purus purus ultrices metus. Vivamus congue nunc et dolor sollicitudin, non dictum metus tincidunt. Vestibulum ligula justo, imperdiet vitae eleifend et, consequat ut ipsum. Ut bibendum maximus ipsum, at commodo metus luctus ut. Morbi porttitor nisl nec ipsum pulvinar sagittis. Nunc quis venenatis mi. Phasellus et suscipit nisi, at suscipit nisi. Pellentesque sed accumsan velit.', 'noimage.jpg', NULL, NULL, '2020-07-13 18:50:58', NULL, 1, 4, NULL, NULL, NULL, 'public', NULL, NULL, NULL, 'monde');
INSERT INTO `tb_ca_posts` (`post_id`, `post_title`, `post_content`, `post_image`, `post_file`, `post_video`, `post_date_created`, `post_date_update`, `category_sid`, `nature_post_sid`, `user_name_posted`, `post_source_info`, `post_lien_source_info`, `post_statut`, `total_views`, `total_likes`, `total_shared`, `post_region`) VALUES
(22, 'mod ut. Nullam pharetra arcu eu porttitor condimentum. Nulla in nibh nibh. Sed eget mauris erat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultrices scelerisque lectus ac malesuada. Donec vel egestas urna. Curabitur mollis dolor at nisi hendrerit, in aliquet lectus rhoncus. Integer ac scelerisque orci, eu eleifend ante. Sed dapibus cursus urna, in efficitur ante euismod ut. Nullam pharetra arcu eu porttitor condimentum. Nulla in nibh nibh. Sed eget mauris erat.\r\n\r\nFusce vitae erat nulla. Sed eget leo sem. Duis at faucibus lorem. Cras eleifend, mi ac gravida suscipit, tellus neque feugiat mauris, a volutpat diam massa quis lacus. Mauris magna est, porttitor nec rhoncus sed, varius non nisl. Quisque luctus in libero et pretium. Vestibulum eros ipsum, consequat sit amet ultricies fringilla, placerat a ante. Fusce quis dolor tortor. Proin aliquam tellus in lacus finibus elementum.\r\n\r\nAenean efficitur felis sed nibh ullamcorper varius. In cursus lectus nec condimentum tempus. Proin bibendum libero sapien, in ullamcorper odio scelerisque ut. Nunc porttitor leo molestie dui aliquam rutrum. Suspendisse egestas ante posuere vulputate luctus. Quisque non est lectus. Fusce fermentum efficitur tristique. Etiam commodo tristique suscipit.\r\n\r\nNullam nibh quam, venenatis at leo sed, molestie fermentum lectus. Aliquam sollicitudin porta enim, bibendum pretium ex dictum finibus. Nunc faucibus et felis in malesuada. Phasellus euismod, sem et consequat euismod, dolor nisi sodales libero, ut accumsan nulla urna id tortor. Etiam sem lacus, ornare ut mi vitae, gravida tincidunt leo. Quisque elementum, elit vitae feugiat hendrerit, quam mauris mattis nibh, ac sagittis purus turpis ac purus. Pellentesque massa velit, mattis nec sem id, ullamcorper efficitur augue. Morbi dapibus vestibulum orci, quis dignissim augue consequat commodo. Vestibulum in nibh tellus.\r\n\r\nCurabitur lacinia nunc et elit mollis maximus. Nulla vulputate quam massa. Etiam non diam feugiat, gravida ligula quis, varius odio. Donec ligula tellus, vehicula et feugiat vel, dignissim sit amet orci. Mauris nec nisi a nisi accumsan egestas. Nullam sed metus metus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas suscipit augue sed posuere euismod. Donec porttitor, massa in auctor interdum, augue dui tristique felis, vel feugiat purus purus ultrices metus. Vivamus congue nunc et dolor sollicitudin, non dictum metus tincidunt. Vestibulum ligula justo, imperdiet vitae eleifend et, consequat ut ipsum. Ut bibendum maximus ipsum, at commodo metus luctus ut. Morbi porttitor nisl nec ipsum pulvinar sagittis. Nunc quis venenatis mi. Phasellus et suscipit nisi, at suscipit nisi. Pellentesque', 'noimage.jpg', NULL, NULL, '2020-07-13 19:00:20', NULL, 6, 5, NULL, NULL, NULL, 'public', NULL, NULL, NULL, ''),
(23, 'ghgh555555fffffffffffffffffffffffffffffffffffffffff', 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh', 'flutter_portfolio_Elie_Mwez.PNG', NULL, NULL, '2020-07-13 19:04:11', NULL, 4, 2, NULL, NULL, NULL, 'public', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Structure de la table `tb_ca_services`
--

CREATE TABLE `tb_ca_services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(75) NOT NULL,
  `service_image` varchar(75) DEFAULT NULL,
  `service_content` text,
  `service_date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `service_date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_zad_achats`
--

CREATE TABLE `tb_zad_achats` (
  `achat_id` int(11) NOT NULL,
  `order_sid` int(11) NOT NULL,
  `product_sid` int(11) NOT NULL,
  `achat_quantity` int(11) NOT NULL,
  `achat_subtotal` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_zad_achats`
--

INSERT INTO `tb_zad_achats` (`achat_id`, `order_sid`, `product_sid`, `achat_quantity`, `achat_subtotal`) VALUES
(4, 8, 10, 2, 40.00),
(5, 8, 6, 3, 60.00),
(6, 8, 9, 1, 50.00),
(7, 9, 6, 5, 100.00),
(8, 9, 10, 2, 40.00),
(9, 11, 9, 3, 150.00),
(10, 11, 10, 2, 40.00),
(11, 12, 6, 1, 20.00),
(12, 12, 9, 1, 50.00);

-- --------------------------------------------------------

--
-- Structure de la table `tb_zad_clients`
--

CREATE TABLE `tb_zad_clients` (
  `client_id` int(11) NOT NULL,
  `client_name` varchar(75) NOT NULL,
  `client_phone` varchar(75) NOT NULL,
  `client_email` varchar(75) NOT NULL,
  `client_address` varchar(255) NOT NULL,
  `client_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_update` datetime NOT NULL,
  `client_status` enum('online','offline') NOT NULL,
  `client_type` varchar(75) NOT NULL,
  `client_city` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_zad_clients`
--

INSERT INTO `tb_zad_clients` (`client_id`, `client_name`, `client_phone`, `client_email`, `client_address`, `client_created`, `client_update`, `client_status`, `client_type`, `client_city`) VALUES
(15, 'Elie  - Mwez', '0858533285', 'eliemwez2014@gmail.com', '25, des rosiers, bel-air', '2020-08-11 20:18:55', '0000-00-00 00:00:00', 'online', '', 'lubumbashi'),
(16, 'Francois - Chipeng', '0821733331', 'francois@gmail.com', '05, Lubumbashi, RDC', '2020-08-11 21:51:15', '0000-00-00 00:00:00', 'online', '', 'Lubumbashi'),
(18, 'ddd - ddfffff', '0821733358', 'jacques@gmail.com', '05, Lubumbashi, RDC', '2020-08-15 09:52:30', '0000-00-00 00:00:00', 'online', '', 'Lubumbashi'),
(21, 'Dano - Luakanda', '0821733330', 'contact@congoagile.com', '25 des rosiers, bel-air, kampemba, haut-katanga', '2020-09-15 19:10:13', '0000-00-00 00:00:00', 'online', '', 'lubumbashi');

-- --------------------------------------------------------

--
-- Structure de la table `tb_zad_commandes`
--

CREATE TABLE `tb_zad_commandes` (
  `order_id` int(11) NOT NULL,
  `order_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_update` datetime NOT NULL,
  `order_status` enum('1','0') NOT NULL,
  `order_total` float(10,2) NOT NULL,
  `client_sid` int(11) NOT NULL,
  `order_observation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_zad_commandes`
--

INSERT INTO `tb_zad_commandes` (`order_id`, `order_created`, `order_update`, `order_status`, `order_total`, `client_sid`, `order_observation`) VALUES
(8, '2020-08-11 20:18:55', '0000-00-00 00:00:00', '1', 150.00, 15, NULL),
(9, '2020-08-11 21:51:15', '0000-00-00 00:00:00', '1', 140.00, 16, 'Comment vous faites pour une livraison a domicile ?\r\nIl y a pas de reduction quand une personne achete en gros ?'),
(10, '2020-08-11 21:52:10', '0000-00-00 00:00:00', '1', 140.00, 16, 'Comment vous faites pour une livraison a domicile ?\r\nIl y a pas de reduction quand une personne achete en gros ?'),
(11, '2020-08-15 09:52:30', '0000-00-00 00:00:00', '1', 190.00, 18, 'Paiement par virement bancaire'),
(12, '2020-09-15 19:10:13', '0000-00-00 00:00:00', '1', 70.00, 21, 'Besoin d\'un numero de compte bancaire');

-- --------------------------------------------------------

--
-- Structure de la table `tb_zad_factures`
--

CREATE TABLE `tb_zad_factures` (
  `facture_id` int(11) NOT NULL,
  `facture_numero` int(5) NOT NULL,
  `facture_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `facture_montant` float(10,2) NOT NULL,
  `facture_tva` float(10,2) DEFAULT '0.00',
  `mode_paiement` varchar(250) DEFAULT NULL,
  `client_sid` int(11) NOT NULL,
  `order_sid` int(11) NOT NULL,
  `facture_ttc` float(10,2) NOT NULL,
  `facture_update` datetime NOT NULL,
  `facture_status` enum('1','0') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_zad_factures`
--

INSERT INTO `tb_zad_factures` (`facture_id`, `facture_numero`, `facture_created`, `facture_montant`, `facture_tva`, `mode_paiement`, `client_sid`, `order_sid`, `facture_ttc`, `facture_update`, `facture_status`) VALUES
(1, 64797, '2020-08-11 21:52:10', 140.00, 22.40, 'Cash', 16, 9, 162.40, '0000-00-00 00:00:00', '1'),
(2, 24974, '2020-08-15 09:52:30', 190.00, 30.40, 'Cash', 18, 11, 220.40, '0000-00-00 00:00:00', '1'),
(3, 96394, '2020-09-15 19:10:13', 70.00, 11.20, 'Cash', 21, 12, 81.20, '2020-09-15 19:19:41', '1');

-- --------------------------------------------------------

--
-- Structure de la table `tb_zad_marques`
--

CREATE TABLE `tb_zad_marques` (
  `mark_id` int(11) NOT NULL,
  `mark_name` varchar(75) NOT NULL,
  `mark_image` varchar(255) NOT NULL,
  `mark_description` text NOT NULL,
  `mark_created` datetime NOT NULL,
  `mark_update` datetime NOT NULL,
  `mark_status` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_zad_marques`
--

INSERT INTO `tb_zad_marques` (`mark_id`, `mark_name`, `mark_image`, `mark_description`, `mark_created`, `mark_update`, `mark_status`) VALUES
(1, 'habillement', '', '<p>\n	cette categorie ou marque contient tous les articles d&#39;habillement. Chemises, pentalons, costumes...</p>\n', '2020-08-06 02:01:33', '0000-00-00 00:00:00', '1'),
(2, 'Cosmetiques', '', '<p>\n	Tous les produits cosmetiques</p>\n', '2020-08-06 02:02:26', '0000-00-00 00:00:00', '1'),
(3, 'Electricite', '', '<p>\n	Mon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveau</p>\n', '2020-09-15 19:34:20', '0000-00-00 00:00:00', '1');

-- --------------------------------------------------------

--
-- Structure de la table `tb_zad_products`
--

CREATE TABLE `tb_zad_products` (
  `product_id` int(11) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_image` varchar(75) NOT NULL,
  `product_price` varchar(75) NOT NULL,
  `product_description` text NOT NULL,
  `image_deux` varchar(75) DEFAULT NULL,
  `image_trois` varchar(75) DEFAULT NULL,
  `product_nature` enum('Shopiza','Serviza','Egliza','Educaza','Santeza','Agencyza','Musicaza','Enviroza','Divers') NOT NULL,
  `product_type` enum('MobileAndroid','MobileIOS','WebApps','Websites','Desktops','Divers') NOT NULL,
  `product_old_price` varchar(75) NOT NULL,
  `product_status` enum('1','0') NOT NULL,
  `product_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_update` datetime NOT NULL,
  `mark_sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_zad_products`
--

INSERT INTO `tb_zad_products` (`product_id`, `product_code`, `product_title`, `product_image`, `product_price`, `product_description`, `image_deux`, `image_trois`, `product_nature`, `product_type`, `product_old_price`, `product_status`, `product_created`, `product_update`, `mark_sid`) VALUES
(2, 'P001', 'Chemise gucci', 'p001.jpg', '20000.00', '<p style=\"text-align: justify;\">\n	<span style=\"color: rgb(123, 136, 152); font-family: &quot;Mercury SSm A&quot;, &quot;Mercury SSm B&quot;, Georgia, Times, &quot;Times New Roman&quot;, &quot;Microsoft YaHei New&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, 宋体, SimSun, STXihei, 华文细黑, serif; font-size: 26px; background-color: rgb(85, 98, 113);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\n', NULL, NULL, 'Shopiza', 'Divers', '25000.00', '1', '2020-08-06 02:19:17', '0000-00-00 00:00:00', 1),
(3, 'P002', 'Chemise Homme Givenchy', 'p003.jpg', '15000.00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'p001.jpg', 'p002.jpg', 'Shopiza', 'Divers', '22000.00', '1', '2020-08-06 02:19:17', '0000-00-00 00:00:00', 1),
(4, 'P003', 'troisieme produit', 'p004.jpg', '20000.00', '<p style=\"text-align: justify;\">\r\n	<span style=\"color: rgb(123, 136, 152); font-family: &quot;Mercury SSm A&quot;, &quot;Mercury SSm B&quot;, Georgia, Times, &quot;Times New Roman&quot;, &quot;Microsoft YaHei New&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, 宋体, SimSun, STXihei, 华文细黑, serif; font-size: 26px; background-color: rgb(85, 98, 113);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\r\n', 'p003.jpg', 'p002.jpg', 'Shopiza', 'Divers', '10000.00', '1', '2020-08-06 02:19:17', '0000-00-00 00:00:00', 1),
(5, 'P004', 'Chemise Homme Givenchy', 'p002.jpg', '5000.00', '<p style=\"text-align: justify;\">\r\n	&lt;span style=&quot;color: rgb(123, 136, 152); font-family: &quot; mercury=&quot;&quot; ssm=&quot;&quot; a&quot;,=&quot;&quot; &quot;mercury=&quot;&quot; b&quot;,=&quot;&quot; georgia,=&quot;&quot; times,=&quot;&quot; &quot;times=&quot;&quot; new=&quot;&quot; roman&quot;,=&quot;&quot; &quot;microsoft=&quot;&quot; yahei=&quot;&quot; new&quot;,=&quot;&quot; yahei&quot;,=&quot;&quot; 微软雅黑,=&quot;&quot; 宋体,=&quot;&quot; simsun,=&quot;&quot; stxihei,=&quot;&quot; 华文细黑,=&quot;&quot; serif;=&quot;&quot; font-size:=&quot;&quot; 26px;=&quot;&quot; background-color:=&quot;&quot; rgb(85,=&quot;&quot; 98,=&quot;&quot; 113);&quot;=&quot;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', NULL, NULL, 'Shopiza', 'Divers', '8000.00', '1', '2020-08-06 02:19:17', '0000-00-00 00:00:00', 1),
(6, 'P005', 'Polos hommes', 'f0ed1-img-20200810-wa0034.jpg', '20.00', ' do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\n', 'b2dec-img-20200810-wa0003.jpg', 'd6810-img-20200810-wa0030.jpg', 'Shopiza', 'Divers', '30.00', '1', '2020-08-06 02:19:17', '2020-08-10 19:27:02', 1),
(7, 'P006', 'Paysage maison', 'p010.jpg', '12.00', '<p style=\"text-align: justify;\">\n	&lt;span style=&quot;color: rgb(123, 136, 152); font-family: &quot; mercury=&quot;&quot; ssm=&quot;&quot; a&quot;,=&quot;&quot; &quot;mercury=&quot;&quot; b&quot;,=&quot;&quot; georgia,=&quot;&quot; times,=&quot;&quot; &quot;times=&quot;&quot; new=&quot;&quot; roman&quot;,=&quot;&quot; &quot;microsoft=&quot;&quot; yahei=&quot;&quot; new&quot;,=&quot;&quot; yahei&quot;,=&quot;&quot; 微软雅黑,=&quot;&quot; 宋体,=&quot;&quot; simsun,=&quot;&quot; stxihei,=&quot;&quot; 华文细黑,=&quot;&quot; serif;=&quot;&quot; font-size:=&quot;&quot; 26px;=&quot;&quot; background-color:=&quot;&quot; rgb(85,=&quot;&quot; 98,=&quot;&quot; 113);&quot;=&quot;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n', '42e59-1.jpg', '40889-bg-3.jpg', 'Shopiza', 'Divers', '15.00', '1', '2020-08-06 02:19:17', '2020-09-15 19:27:52', 1),
(8, 'P007', 'septieme produit', 'p007.jpg', '30000.00', '<p style=\"text-align: justify;\">\r\n	<span style=\"color: rgb(123, 136, 152); font-family: &quot;Mercury SSm A&quot;, &quot;Mercury SSm B&quot;, Georgia, Times, &quot;Times New Roman&quot;, &quot;Microsoft YaHei New&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, 宋体, SimSun, STXihei, 华文细黑, serif; font-size: 26px; background-color: rgb(85, 98, 113);\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></p>\r\n', NULL, NULL, 'Shopiza', 'Divers', '30000.00', '1', '2020-08-06 02:19:17', '0000-00-00 00:00:00', 1),
(9, 'P008', 'Chemise Homme Givenchy', 'b5175-img-20200810-wa0032.jpg', '50.00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n', 'e2329-img-20200810-wa0028.jpg', NULL, 'Shopiza', 'Divers', '80000.00', '1', '2020-08-06 02:19:17', '0000-00-00 00:00:00', 1),
(10, 'P015', 'Pentalon Training', '56ea8-img-20200810-wa0016.jpg', '20.00', 'Gixitwitdyixiyxyixoyxiyxyiditdyvxhkxhkxitxitw', '9bfe4-img-20200810-wa0015.jpg', '860a5-img-20200810-wa0017.jpg', 'Shopiza', 'Divers', '22.00', '1', '2020-08-10 19:32:25', '0000-00-00 00:00:00', 1),
(11, 'PSSS', 'Mon article nouveau', 'b9bfa-3.jpg', '6.00', '<p>\n	Mon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveauMon article nouveau</p>\n', 'b7ded-bg-2.jpg', '71d01-2.jpg', 'Divers', 'Divers', '9.00', '1', '2020-09-15 19:32:46', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Structure de la table `vue_groupes_users`
--

CREATE TABLE `vue_groupes_users` (
  `asset_id` int(11) DEFAULT NULL,
  `asset_fullname` varchar(75) DEFAULT NULL,
  `asset_login` varchar(75) DEFAULT NULL,
  `asset_password` varchar(75) DEFAULT NULL,
  `asset_type` varchar(75) DEFAULT NULL,
  `group_sid` int(11) DEFAULT NULL,
  `asset_email` varchar(75) DEFAULT NULL,
  `asset_phone` varchar(75) DEFAULT NULL,
  `asset_theme_default` varchar(75) DEFAULT NULL,
  `asset_theme_session` varchar(75) DEFAULT NULL,
  `asset_statut` enum('online','offline') DEFAULT NULL,
  `asset_date_created` datetime DEFAULT NULL,
  `asset_last_login` datetime DEFAULT NULL,
  `asset_last_update` datetime DEFAULT NULL,
  `asset_comments` text,
  `asset_avatar` varchar(75) DEFAULT NULL,
  `asset_role` enum('super','admin','simple') DEFAULT NULL,
  `asset_profession` varchar(200) DEFAULT NULL,
  `asset_genre` varchar(20) DEFAULT NULL,
  `asset_civilite` varchar(75) DEFAULT NULL,
  `session_ouverte` enum('oui','non') DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `group_name` varchar(75) DEFAULT NULL,
  `group_privilege` varchar(75) DEFAULT NULL,
  `group_comments` text,
  `group_date_created` datetime DEFAULT NULL,
  `group_date_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tb_ca_assets`
--
ALTER TABLE `tb_ca_assets`
  ADD PRIMARY KEY (`asset_id`),
  ADD UNIQUE KEY `user_email` (`asset_email`,`asset_phone`),
  ADD UNIQUE KEY `user_login` (`asset_login`),
  ADD KEY `group_sid` (`group_sid`);

--
-- Index pour la table `tb_ca_avis_clients`
--
ALTER TABLE `tb_ca_avis_clients`
  ADD PRIMARY KEY (`avis_id`);

--
-- Index pour la table `tb_ca_categories`
--
ALTER TABLE `tb_ca_categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Index pour la table `tb_ca_comments`
--
ALTER TABLE `tb_ca_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `post_sid` (`post_sid`);

--
-- Index pour la table `tb_ca_communications`
--
ALTER TABLE `tb_ca_communications`
  ADD PRIMARY KEY (`com_id`);

--
-- Index pour la table `tb_ca_contacts`
--
ALTER TABLE `tb_ca_contacts`
  ADD PRIMARY KEY (`contact_id`);

--
-- Index pour la table `tb_ca_galeries`
--
ALTER TABLE `tb_ca_galeries`
  ADD PRIMARY KEY (`galerie_id`);

--
-- Index pour la table `tb_ca_groups`
--
ALTER TABLE `tb_ca_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Index pour la table `tb_ca_helps`
--
ALTER TABLE `tb_ca_helps`
  ADD PRIMARY KEY (`help_id`);

--
-- Index pour la table `tb_ca_logs`
--
ALTER TABLE `tb_ca_logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Index pour la table `tb_ca_natures_posts`
--
ALTER TABLE `tb_ca_natures_posts`
  ADD PRIMARY KEY (`nature_id`);

--
-- Index pour la table `tb_ca_newsletters`
--
ALTER TABLE `tb_ca_newsletters`
  ADD PRIMARY KEY (`newsletter_id`);

--
-- Index pour la table `tb_ca_passswords`
--
ALTER TABLE `tb_ca_passswords`
  ADD PRIMARY KEY (`pass_id`);

--
-- Index pour la table `tb_ca_posts`
--
ALTER TABLE `tb_ca_posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `category_sid` (`category_sid`),
  ADD KEY `nature_post_sid` (`nature_post_sid`),
  ADD KEY `post_region` (`post_region`);

--
-- Index pour la table `tb_ca_services`
--
ALTER TABLE `tb_ca_services`
  ADD PRIMARY KEY (`service_id`);

--
-- Index pour la table `tb_zad_achats`
--
ALTER TABLE `tb_zad_achats`
  ADD PRIMARY KEY (`achat_id`),
  ADD KEY `product_id` (`product_sid`),
  ADD KEY `order_id` (`order_sid`);

--
-- Index pour la table `tb_zad_clients`
--
ALTER TABLE `tb_zad_clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `client_phone` (`client_phone`),
  ADD UNIQUE KEY `email` (`client_email`);

--
-- Index pour la table `tb_zad_commandes`
--
ALTER TABLE `tb_zad_commandes`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_id` (`client_sid`);

--
-- Index pour la table `tb_zad_factures`
--
ALTER TABLE `tb_zad_factures`
  ADD PRIMARY KEY (`facture_id`);

--
-- Index pour la table `tb_zad_marques`
--
ALTER TABLE `tb_zad_marques`
  ADD PRIMARY KEY (`mark_id`),
  ADD KEY `mark_name` (`mark_name`);

--
-- Index pour la table `tb_zad_products`
--
ALTER TABLE `tb_zad_products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `mark_sid` (`mark_sid`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tb_ca_assets`
--
ALTER TABLE `tb_ca_assets`
  MODIFY `asset_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `tb_ca_avis_clients`
--
ALTER TABLE `tb_ca_avis_clients`
  MODIFY `avis_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_ca_categories`
--
ALTER TABLE `tb_ca_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `tb_ca_comments`
--
ALTER TABLE `tb_ca_comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_ca_communications`
--
ALTER TABLE `tb_ca_communications`
  MODIFY `com_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_ca_contacts`
--
ALTER TABLE `tb_ca_contacts`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `tb_ca_galeries`
--
ALTER TABLE `tb_ca_galeries`
  MODIFY `galerie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `tb_ca_groups`
--
ALTER TABLE `tb_ca_groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tb_ca_helps`
--
ALTER TABLE `tb_ca_helps`
  MODIFY `help_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_ca_logs`
--
ALTER TABLE `tb_ca_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_ca_natures_posts`
--
ALTER TABLE `tb_ca_natures_posts`
  MODIFY `nature_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `tb_ca_newsletters`
--
ALTER TABLE `tb_ca_newsletters`
  MODIFY `newsletter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_ca_passswords`
--
ALTER TABLE `tb_ca_passswords`
  MODIFY `pass_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_ca_posts`
--
ALTER TABLE `tb_ca_posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `tb_ca_services`
--
ALTER TABLE `tb_ca_services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_zad_achats`
--
ALTER TABLE `tb_zad_achats`
  MODIFY `achat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `tb_zad_clients`
--
ALTER TABLE `tb_zad_clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `tb_zad_commandes`
--
ALTER TABLE `tb_zad_commandes`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `tb_zad_factures`
--
ALTER TABLE `tb_zad_factures`
  MODIFY `facture_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tb_zad_marques`
--
ALTER TABLE `tb_zad_marques`
  MODIFY `mark_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `tb_zad_products`
--
ALTER TABLE `tb_zad_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tb_ca_assets`
--
ALTER TABLE `tb_ca_assets`
  ADD CONSTRAINT `tb_ca_assets_ibfk_1` FOREIGN KEY (`group_sid`) REFERENCES `tb_ca_groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tb_ca_comments`
--
ALTER TABLE `tb_ca_comments`
  ADD CONSTRAINT `tb_ca_comments_ibfk_1` FOREIGN KEY (`post_sid`) REFERENCES `tb_ca_posts` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tb_ca_posts`
--
ALTER TABLE `tb_ca_posts`
  ADD CONSTRAINT `tb_ca_posts_ibfk_1` FOREIGN KEY (`category_sid`) REFERENCES `tb_ca_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_ca_posts_ibfk_2` FOREIGN KEY (`nature_post_sid`) REFERENCES `tb_ca_natures_posts` (`nature_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tb_zad_achats`
--
ALTER TABLE `tb_zad_achats`
  ADD CONSTRAINT `tb_zad_achats_ibfk_1` FOREIGN KEY (`product_sid`) REFERENCES `tb_zad_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_zad_achats_ibfk_2` FOREIGN KEY (`order_sid`) REFERENCES `tb_zad_commandes` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tb_zad_commandes`
--
ALTER TABLE `tb_zad_commandes`
  ADD CONSTRAINT `tb_zad_commandes_ibfk_1` FOREIGN KEY (`client_sid`) REFERENCES `tb_zad_clients` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `tb_zad_products`
--
ALTER TABLE `tb_zad_products`
  ADD CONSTRAINT `tb_zad_products_ibfk_1` FOREIGN KEY (`mark_sid`) REFERENCES `tb_zad_marques` (`mark_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
