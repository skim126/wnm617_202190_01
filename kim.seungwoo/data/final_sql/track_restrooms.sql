-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2021 at 08:47 PM
-- Server version: 5.6.51-cll-lve
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seungwoo_wnm608`
--

-- --------------------------------------------------------

--
-- Table structure for table `track_restrooms`
--

CREATE TABLE `track_restrooms` (
  `id` int(13) NOT NULL,
  `user_id` int(13) NOT NULL,
  `store` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL,
  `needs` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `img` varchar(256) NOT NULL,
  `password` varchar(32) NOT NULL,
  `date_create` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `track_restrooms`
--

INSERT INTO `track_restrooms` (`id`, `user_id`, `store`, `type`, `needs`, `description`, `img`, `password`, `date_create`) VALUES
(1, 3, 'Tripsch', 'unisex', 'toothbrush', 'Voluptate labore occaecat culpa reprehenderit aliquip veniam excepteur culpa nulla consectetur laboris dolor. Amet deserunt et consequat incididunt eiusmod enim anim ad amet.', 'https://via.placeholder.com/400/777/fff/?text=Tripsch', '12345', '2020-10-19 08:47:59'),
(2, 6, 'Shepard', 'male', 'paper', 'Ullamco ad minim voluptate eu sit excepteur ipsum. Esse nostrud nisi quis adipisicing proident consectetur ut ipsum.', 'https://via.placeholder.com/400/991/fff/?text=Shepard', '12345', '2021-06-07 10:40:03'),
(3, 10, 'Combogen', 'unisex', 'music', 'Est quis sunt pariatur dolor et incididunt Lorem. Lorem cillum esse fugiat do excepteur ipsum aliqua irure ut.', 'https://via.placeholder.com/400/788/fff/?text=Combogen', '12345', '2020-08-19 02:55:56'),
(4, 7, 'Exotechno', 'male', 'toilet', 'Aliquip proident voluptate quis mollit enim. Consequat quis consectetur occaecat proident.', 'https://via.placeholder.com/400/807/fff/?text=Exotechno', '12345', '2020-10-26 08:24:32'),
(5, 9, 'Zytrex', 'female', 'sanitiser', 'Est in eu laboris dolore. Reprehenderit quis minim aliqua mollit voluptate magna culpa ex.', 'https://via.placeholder.com/400/851/fff/?text=Zytrex', '12345', '2021-04-07 06:29:49'),
(6, 10, 'Undertap', 'female', 'baby toilet', 'Exercitation eiusmod amet eiusmod magna laborum nisi nulla. Duis aute pariatur eu magna duis est magna aliqua cupidatat id anim nostrud.', 'https://via.placeholder.com/400/770/fff/?text=Undertap', '12345', '2020-07-03 10:26:56'),
(7, 4, 'Permadyne', 'female', 'soap', 'Ex exercitation dolore ex elit voluptate ea amet exercitation pariatur irure ullamco tempor. Aliquip aliqua irure non enim Lorem cupidatat dolore ipsum exercitation dolore occaecat laboris.', 'https://via.placeholder.com/400/788/fff/?text=Permadyne', '12345', '2021-02-07 06:21:10'),
(8, 2, 'Schoolio', 'male', 'toilet', 'Consectetur consequat laboris ad proident. Culpa minim labore non do ea cillum dolor.', 'https://via.placeholder.com/400/819/fff/?text=Schoolio', '12345', '2020-04-11 07:51:10'),
(9, 4, 'Mantro', 'male', 'toilet', 'Quis anim commodo irure id laboris labore ipsum sit nisi est in commodo labore. In fugiat ea nostrud tempor ex anim.', 'https://via.placeholder.com/400/909/fff/?text=Mantro', '12345', '2021-03-15 08:55:40'),
(10, 5, 'Fleetmix', 'female', 'sanitiser', 'Eiusmod veniam amet nostrud velit nostrud. Ea non amet aliqua ea Lorem et laboris officia.', 'https://via.placeholder.com/400/758/fff/?text=Fleetmix', '12345', '2021-03-05 02:02:15'),
(11, 8, 'Koogle', 'female', 'baby toilet', 'Nisi fugiat amet amet ut commodo irure enim culpa irure. Minim occaecat aute consequat non enim labore esse duis officia officia ipsum officia.', 'https://via.placeholder.com/400/835/fff/?text=Koogle', '12345', '2021-09-18 11:30:07'),
(12, 4, 'Fibrodyne', 'unisex', 'toothbrush', 'Nulla labore ipsum aliqua culpa ut enim excepteur non adipisicing dolore ad cillum. Deserunt velit eu aliqua proident sunt minim dolore laboris proident dolor.', 'https://via.placeholder.com/400/932/fff/?text=Fibrodyne', '12345', '2021-05-01 12:14:15'),
(13, 6, 'Prismatic', 'male', 'sink', 'Do duis occaecat qui sunt velit. Sit occaecat in excepteur dolor pariatur deserunt tempor dolor est exercitation in ipsum eu officia.', 'https://via.placeholder.com/400/860/fff/?text=Prismatic', '12345', '2020-08-24 08:04:45'),
(14, 4, 'Empirica', 'unisex', 'listerine', 'Ad ullamco anim id duis mollit culpa aliqua nulla mollit proident exercitation. Incididunt do anim do aute.', 'https://via.placeholder.com/400/832/fff/?text=Empirica', '12345', '2020-03-10 11:02:23'),
(15, 10, 'Flotonic', 'female', 'sanitiser', 'Anim amet cupidatat magna cillum elit ut cillum dolore. Nulla est cillum ullamco magna do excepteur occaecat nostrud laboris incididunt magna sint laborum.', 'https://via.placeholder.com/400/972/fff/?text=Flotonic', '12345', '2020-02-24 09:35:02'),
(16, 2, 'Orbean', 'unisex', 'music', 'Aliqua commodo duis voluptate velit laboris aliqua anim proident eiusmod. Tempor ea duis veniam proident aliquip minim ad adipisicing excepteur exercitation cupidatat dolore laborum officia.', 'https://via.placeholder.com/400/729/fff/?text=Orbean', '12345', '2020-02-07 09:24:02'),
(17, 1, 'Kiosk', 'female', 'sanitiser', 'Cillum exercitation proident occaecat irure nostrud. Ipsum deserunt consectetur eiusmod aliqua ullamco eu ipsum ex ad qui cillum aliquip id in.', 'uploads/1638927952.4637_hans-isaacson-jz7gpyiQEGw-unsplash.jpg', '12345', '2021-06-28 02:22:49'),
(18, 1, 'Turnabout', 'male', 'sink', 'Minim amet labore consectetur sunt voluptate. Eu aute deserunt irure esse occaecat qui id id.', 'https://via.placeholder.com/400/978/fff/?text=Turnabout', '12345', '2020-12-28 10:46:29'),
(19, 8, 'Maximind', 'male', 'paper', 'Lorem in ea commodo excepteur est adipisicing proident commodo reprehenderit exercitation officia. Ut esse labore exercitation amet aliquip officia laborum.', 'https://via.placeholder.com/400/933/fff/?text=Maximind', '12345', '2020-07-02 08:07:46'),
(20, 2, 'Aquoavo', 'unisex', 'toothbrush', 'Occaecat exercitation qui culpa aliquip ex veniam sit magna dolore fugiat esse duis. Excepteur voluptate enim minim culpa dolor consequat cillum ut adipisicing esse do.', 'https://via.placeholder.com/400/996/fff/?text=Aquoavo', '12345', '2021-03-26 12:26:35'),
(21, 3, 'Zillar', 'male', 'toilet', 'Voluptate exercitation mollit culpa veniam sunt ut eu aliquip irure id irure laboris. Anim aute consectetur magna labore labore pariatur occaecat.', 'https://via.placeholder.com/400/857/fff/?text=Zillar', '12345', '2020-06-14 12:20:56'),
(22, 8, 'Signity', 'unisex', 'music', 'Ullamco ullamco enim elit laboris nostrud. Adipisicing et magna cillum reprehenderit duis quis consequat in Lorem tempor.', 'https://via.placeholder.com/400/768/fff/?text=Signity', '12345', '2021-05-02 06:26:55'),
(23, 4, 'Aeora', 'female', 'soap', 'Enim excepteur mollit est esse nulla duis excepteur qui veniam. Incididunt ullamco eu minim ex veniam ad fugiat exercitation anim.', 'https://via.placeholder.com/400/779/fff/?text=Aeora', '12345', '2020-11-18 05:37:15'),
(24, 3, 'Concility', 'male', 'sink', 'Ullamco irure officia pariatur excepteur minim. Commodo magna amet incididunt laboris.', 'https://via.placeholder.com/400/759/fff/?text=Concility', '12345', '2021-08-08 07:13:54'),
(25, 1, 'Elentrix', 'female', 'soap', 'Sit deserunt dolore ut ullamco. Ea consequat non amet ea sit nostrud consectetur.', 'https://via.placeholder.com/400/719/fff/?text=Elentrix', '12345', '2020-02-16 03:12:03'),
(26, 6, 'Digifad', 'male', 'sink', 'Laborum quis ipsum do aute eu magna exercitation adipisicing minim. Cillum id laboris amet deserunt culpa nulla minim incididunt mollit reprehenderit non exercitation tempor.', 'https://via.placeholder.com/400/733/fff/?text=Digifad', '12345', '2021-09-04 05:31:12'),
(27, 5, 'Marvane', 'male', 'sink', 'Ipsum ad occaecat adipisicing minim deserunt reprehenderit mollit proident irure minim velit deserunt deserunt. Sit ad consectetur sint sint nostrud aliquip ipsum.', 'https://via.placeholder.com/400/832/fff/?text=Marvane', '12345', '2021-01-14 04:35:22'),
(28, 7, 'Hyplex', 'male', 'toilet', 'Est ipsum occaecat ullamco anim officia magna ea aliquip aliqua. Officia elit minim ipsum amet cillum nulla aliqua.', 'https://via.placeholder.com/400/793/fff/?text=Hyplex', '12345', '2020-04-25 01:10:27'),
(29, 1, 'Dognosis', 'male', 'toilet', 'Aliqua laboris et dolor reprehenderit aliquip incididunt minim reprehenderit magna consequat irure sint ex ullamco. Cupidatat nulla cillum id et laboris eiusmod sit dolore proident consectetur eiusmod.', 'https://via.placeholder.com/400/867/fff/?text=Dognosis', '12345', '2021-10-11 04:39:35'),
(30, 8, 'Rodeocean', 'unisex', 'toothbrush', 'Occaecat nisi anim nulla dolore. Reprehenderit esse adipisicing nulla exercitation sunt Lorem ipsum.', 'https://via.placeholder.com/400/717/fff/?text=Rodeocean', '12345', '2020-09-07 01:14:16'),
(31, 3, 'Mediot', 'female', 'baby toilet', 'Aliqua dolore enim est reprehenderit fugiat aliquip esse dolor officia nisi. Est labore aliquip sint aliqua non magna culpa officia.', 'https://via.placeholder.com/400/888/fff/?text=Mediot', '12345', '2020-04-14 11:25:17'),
(32, 9, 'Earthpure', 'unisex', 'music', 'Lorem laboris tempor eiusmod velit deserunt exercitation consequat. Nostrud reprehenderit dolore consectetur reprehenderit officia velit irure velit.', 'https://via.placeholder.com/400/720/fff/?text=Earthpure', '12345', '2020-11-29 11:14:41'),
(33, 10, 'Slambda', 'male', 'toilet', 'Ad consectetur consectetur sit aute. Duis mollit enim ut eu mollit amet est consectetur ex non.', 'https://via.placeholder.com/400/718/fff/?text=Slambda', '12345', '2020-08-02 07:19:18'),
(34, 9, 'Speedbolt', 'male', 'sink', 'Veniam laboris excepteur labore proident excepteur ad fugiat voluptate. Occaecat ea dolore sunt deserunt anim in consectetur nulla duis magna sunt dolore minim.', 'https://via.placeholder.com/400/796/fff/?text=Speedbolt', '12345', '2021-01-10 12:21:23'),
(35, 1, 'Daido', 'unisex', 'listerine', 'Nisi nisi duis tempor excepteur cupidatat nostrud sunt elit ut consequat eiusmod sit velit. Qui anim laboris enim sit.', 'https://via.placeholder.com/400/835/fff/?text=Daido', '12345', '2020-08-09 02:44:03'),
(36, 6, 'Velos', 'unisex', 'toothbrush', 'Non dolor anim nostrud sunt magna culpa sint enim dolore sunt qui aliqua occaecat irure. Incididunt irure occaecat enim deserunt deserunt ipsum labore duis adipisicing labore qui anim.', 'https://via.placeholder.com/400/842/fff/?text=Velos', '12345', '2020-05-29 09:08:51'),
(37, 3, 'Farmage', 'female', 'baby toilet', 'Commodo eiusmod consectetur excepteur adipisicing minim ad eu quis aliquip eu ipsum magna. Elit et nisi adipisicing elit mollit enim quis dolore veniam proident.', 'https://via.placeholder.com/400/845/fff/?text=Farmage', '12345', '2021-09-28 02:08:08'),
(38, 5, 'Kozgene', 'unisex', 'toothbrush', 'Eu ad veniam dolore laborum. Commodo minim ex excepteur ullamco commodo labore consequat laboris eiusmod.', 'https://via.placeholder.com/400/717/fff/?text=Kozgene', '12345', '2021-09-29 09:05:43'),
(39, 3, 'Bleeko', 'female', 'sanitiser', 'Magna in voluptate quis aliqua adipisicing pariatur aliquip mollit voluptate eu qui et ea officia. Duis commodo ut eiusmod nulla adipisicing Lorem irure tempor adipisicing laboris aute dolore aliquip.', 'https://via.placeholder.com/400/773/fff/?text=Bleeko', '12345', '2020-07-29 11:32:44'),
(40, 5, 'Pheast', 'male', 'toilet', 'Nostrud dolor tempor dolore esse deserunt cillum adipisicing labore in. Esse magna culpa reprehenderit sunt.', 'https://via.placeholder.com/400/906/fff/?text=Pheast', '12345', '2021-01-09 12:54:21'),
(41, 10, 'Extragene', 'male', 'toilet', 'Enim nulla dolore sint irure qui eu deserunt id. Irure laboris dolore qui minim et id nisi adipisicing consequat irure ad culpa in dolore.', 'https://via.placeholder.com/400/714/fff/?text=Extragene', '12345', '2021-07-13 07:53:12'),
(42, 8, 'Isbol', 'unisex', 'listerine', 'Veniam aute tempor tempor ad laborum aliquip id. Nostrud mollit consequat amet occaecat sunt id magna reprehenderit est irure commodo.', 'https://via.placeholder.com/400/851/fff/?text=Isbol', '12345', '2021-01-18 01:25:22'),
(43, 2, 'Parleynet', 'male', 'paper', 'Enim proident quis ipsum do veniam qui non deserunt est id veniam enim. Anim enim reprehenderit officia laboris esse sit dolore.', 'https://via.placeholder.com/400/701/fff/?text=Parleynet', '12345', '2021-02-08 11:09:30'),
(44, 1, 'Retrotex', 'male', 'toilet', 'Dolore officia minim laborum laborum ullamco in aliqua. Excepteur commodo nisi irure aliquip deserunt exercitation adipisicing eu pariatur laboris ullamco occaecat.', 'https://via.placeholder.com/400/747/fff/?text=Retrotex', '12345', '2020-04-23 03:18:30'),
(45, 1, 'Quonata', 'unisex', 'music', 'Non sint veniam aliquip aute et esse anim culpa dolor est minim ad consequat exercitation. Culpa ex eu ex mollit sint.', 'https://via.placeholder.com/400/959/fff/?text=Quonata', '12345', '2020-04-08 03:38:36'),
(46, 4, 'Splinx', 'male', 'paper', 'Sint cupidatat voluptate occaecat ea ipsum laboris proident. Esse excepteur ullamco proident amet excepteur sit cupidatat labore enim ut aute nostrud.', 'https://via.placeholder.com/400/966/fff/?text=Splinx', '12345', '2021-07-25 08:59:17'),
(47, 5, 'Spacewax', 'unisex', 'toothbrush', 'Cupidatat esse quis ipsum qui consectetur quis et. Occaecat est labore minim cupidatat nulla magna Lorem.', 'https://via.placeholder.com/400/861/fff/?text=Spacewax', '12345', '2021-05-02 01:36:52'),
(48, 7, 'Comtour', 'unisex', 'music', 'Veniam eiusmod esse commodo eiusmod. Officia voluptate anim dolore laborum ullamco non velit aliqua esse eiusmod ullamco est elit exercitation.', 'https://via.placeholder.com/400/942/fff/?text=Comtour', '12345', '2020-01-17 11:01:35'),
(49, 9, 'Voipa', 'unisex', 'listerine', 'Et commodo incididunt aliquip magna minim quis velit laborum proident ea quis. Et amet deserunt culpa adipisicing enim et.', 'https://via.placeholder.com/400/890/fff/?text=Voipa', '12345', '2021-04-09 07:19:42'),
(50, 8, 'Medcom', 'male', 'paper', 'Elit eiusmod commodo nisi incididunt tempor qui aliquip nisi consequat deserunt cillum fugiat. Commodo id veniam non consectetur.', 'https://via.placeholder.com/400/909/fff/?text=Medcom', '12345', '2020-09-01 11:15:48'),
(51, 11, 'another', 'unisex', 'music', 'good restroom', 'https://via.placeholder.com/400/976/fff/?text=user1', '7463', '2021-11-22 18:40:36'),
(52, 11, 'spanky', 'female', 'baby toilet', 'it is okay', 'https://via.placeholder.com/400/976/fff/?text=user1', 'pass', '2021-11-22 19:02:30'),
(53, 1, 'another', 'unisex', 'paper', 'okay clean', 'http://via.placeholder.com/400/?text=RESTROOM', '7463', '2021-11-29 23:23:18'),
(54, 1, 'test1', 'male', 'test1', 'test1', 'http://via.placeholder.com/400/?text=RESTROOM', 'test1', '2021-11-29 23:28:01'),
(62, 12, 'Another cafe', 'Unisex', 'None', 'clean and less people', 'uploads/1639018096.9649_Another Cafe.png', '7463', '2021-12-08 19:47:59'),
(63, 12, 'Cup A Joe ', 'Unisex', 'Door lock', 'There is no door lock', 'uploads/1639018306.1362_CupAJoe.png', 'No Password', '2021-12-08 19:51:32'),
(64, 12, 'Starbucks', 'Unisex', '', 'Very Clean', 'uploads/1639018424.9288_Starbucks1.png', '62722', '2021-12-08 19:53:12'),
(68, 12, 'Macy\'s', 'Male', 'None', 'Clean but busy', 'uploads/1639018653.027_Macy\'s.png', 'No Password', '2021-12-08 19:55:06'),
(69, 12, 'Westfield', 'Female', 'None', 'Okay Clean', 'uploads/1639019066.0315_Westfield.png', 'No Password', '2021-12-08 20:03:58'),
(70, 12, 'Metreon', 'Male', '', 'Clean', 'uploads/1639019394.1939_Metreon.png', 'No Password', '2021-12-08 20:08:32'),
(71, 12, '24 Hour Fitness', 'Male', '', 'Members\' only', 'uploads/1639019803.6879_24 hour fitness san francisco.png', 'No Password', '2021-12-08 20:15:51'),
(72, 12, 'Twitch', 'Female', '', 'Very Clean', 'uploads/1639020196.2576_Twitch.png', 'No Password', '2021-12-08 20:22:12'),
(74, 17, 'Another cafe', 'Unisex', 'None', 'good', 'uploads/1639626087.4073_Another Cafe.png', '1234', '2021-12-15 20:41:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `track_restrooms`
--
ALTER TABLE `track_restrooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `track_restrooms`
--
ALTER TABLE `track_restrooms`
  MODIFY `id` int(13) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
