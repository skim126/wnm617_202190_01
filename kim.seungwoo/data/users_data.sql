CREATE TABLE IF NOT EXISTS `track_users` (
`id` INT NULL,
`name` VARCHAR(MAX) NULL,
`username` VARCHAR(MAX) NULL,
`email` VARCHAR(MAX) NULL,
`password` VARCHAR(MAX) NULL,
`img` VARCHAR(MAX) NULL,
`date_create` VARCHAR(MAX) NULL
);

INSERT INTO track_users VALUES
(1,'Autumn Parrish','user1','user1@gmail.com',md5("pass"),'https://via.placeholder.com/400/976/fff/?text=user1','2020-11-16 01:38:42 '),
(2,'Berger Booker','user2','user2@gmail.com',md5("pass"),'https://via.placeholder.com/400/910/fff/?text=user2','2021-06-21 06:53:10 '),
(3,'Hilary Hughes','user3','user3@gmail.com',md5("pass"),'https://via.placeholder.com/400/810/fff/?text=user3','2021-10-24 03:35:38 '),
(4,'Coleen Hobbs','user4','user4@gmail.com',md5("pass"),'https://via.placeholder.com/400/904/fff/?text=user4','2020-12-01 12:22:56 '),
(5,'Christa English','user5','user5@gmail.com',md5("pass"),'https://via.placeholder.com/400/726/fff/?text=user5','2021-06-10 06:55:00 '),
(6,'Anderson Thomas','user6','user6@gmail.com',md5("pass"),'https://via.placeholder.com/400/936/fff/?text=user6','2020-04-03 12:02:07 '),
(7,'Chase Mercer','user7','user7@gmail.com',md5("pass"),'https://via.placeholder.com/400/855/fff/?text=user7','2020-02-22 03:44:38 '),
(8,'Jerry Everett','user8','user8@gmail.com',md5("pass"),'https://via.placeholder.com/400/911/fff/?text=user8','2021-02-22 02:17:10 '),
(9,'Nina Emerson','user9','user9@gmail.com',md5("pass"),'https://via.placeholder.com/400/918/fff/?text=user9','2021-08-24 03:22:21 '),
(10,'Watson Mcgee','user10','user10@gmail.com',md5("pass"),'https://via.placeholder.com/400/830/fff/?text=user10','2021-10-09 07:57:09 ');