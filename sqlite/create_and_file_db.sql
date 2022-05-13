DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `studid` INT NOT NULL,
  `name` TEXT NOT NULL,
  `dob` TEXT NOT NULL,
  `program` TEXT NOT NULL,
  `credit` INT NOT NULL,
  PRIMARY KEY (`studid`)
);
INSERT INTO student VALUES (1,'Jedidiah Goodwin MD','1983-10-15','DS',8),(2,'Iliana Hagenes','1987-06-21','DS',10),(3,'Enrico Jaskolski IV','1980-01-07','MAT',3),(4,'Dr. Luis Nienow DVM','2001-09-12','ART',8),(5,'Prof. Darren Morissette Jr.','1989-01-13','CS',10),(6,'Cara Wehner','1997-09-04','BIZ',8),(7,'Jefferey Kassulke','1976-10-26','ART',5),(8,'Dr. Chester Jacobs MD','1980-11-18','ELEC',10),(9,'Dashawn Greenfelder','1990-02-21','MAT',9),(10,'Belle Nikolaus','1991-12-30','DS',9),(11,'Margaretta Hettinger','2000-12-06','LAW',2),(12,'Marty Bahringer','2000-06-26','PHY',2),(13,'Jessie Muller Jr.','1981-03-15','ART',7),(14,'Dr. Melyna Cremin MD','1996-12-18','ELEC',6),(15,'Mr. Torey Kuhlman','1998-06-15','ELEC',10),(16,'Prof. Kristoffer Oberbrunner','1996-07-13','BIZ',10),(17,'Akeem Hermann','2001-02-21','PHY',1),(18,'Elliott Ankunding','1979-04-02','CS',9),(19,'Wilmer Wyman','1992-05-29','MAT',5),(20,'Prof. Eleonore Ratke','1971-01-11','DS',10),(21,'Mr. Josh Bernier','2002-01-25','LAW',1),(22,'Clarabelle Johns','1991-03-31','PHY',5),(23,'Mr. Stan Kiehn III','1980-08-01','CS',3),(24,'Prof. Macy Swift MD','1980-09-22','ART',3),(25,'Augusta Lowe','1993-03-19','ELEC',6),(26,'Chesley Metz','1973-05-12','LAW',9),(27,'Maeve Hintz','1991-02-16','PHY',4),(28,'Prof. Liza Watsica DDS','1994-01-23','CS',9),(29,'Dr. Herman Kreiger','1988-06-04','ART',1),(30,'Mrs. Lola Marvin Jr.','1976-06-11','PHY',8),(31,'Lila Goyette V','2000-03-13','CHEM',10),(32,'Mr. Myrl Gottlieb III','1991-11-25','ELEC',6),(33,'Natalie Bartell','2002-03-01','DS',8),(34,'Sophie Rippin','1995-08-14','PHY',6),(35,'Rey Stroman Sr.','1986-12-06','MAT',7),(36,'Wendy Rice','1997-04-22','CHEM',7),(37,'Miss Willie Cronin Jr.','1982-04-17','DS',1),(38,'Maya O Conner','1996-01-11','ELEC',4),(39,'Alice Robel','1986-11-02','ART',2),(40,'Elisabeth Gottlieb','1986-04-24','CS',9),(41,'Lela Wilderman PhD','1986-07-28','BIZ',5),(42,'Verla Eichmann','1989-07-22','DS',8),(43,'Raymond Leffler','1986-02-28','PHY',1),(44,'Camryn Cummerata','1976-10-24','ART',2),(45,'Prof. Donnell Gutmann','1995-04-09','DS',5),(46,'Mathilde Crona V','1987-06-04','CHEM',3),(47,'Elmira Altenwerth','1973-06-29','MAT',8),(48,'Mr. Carlos Yundt','1996-10-29','BIZ',10),(49,'Katrina Senger','1997-01-20','ART',7),(50,'Hailie Luettgen','1998-01-26','LAW',8),(51,'Tre Jakubowski','1983-09-11','MAT',4),(52,'Miss Nelle Rohan V','1978-10-16','CS',2),(53,'Olaf Ankunding','1982-07-27','ELEC',6),(54,'Kaycee Bogan','1976-09-27','BIZ',9),(55,'Dr. Noe Barrows III','1985-07-24','ELEC',4),(56,'Mrs. Chanel Kulas IV','1976-11-12','PHY',6),(57,'Prof. Johnnie Wisoky IV','1991-12-14','CS',8),(58,'Hannah Olson','1999-01-12','LAW',10),(59,'Melvina Turner','2003-10-25','PHY',7),(60,'Mr. Jake Muller','2002-11-26','CS',7),(61,'Karen Johns I','1978-07-23','LAW',7),(62,'Skylar Hettinger','1999-03-26','BIZ',10),(63,'Savanah O\"Conner','1986-01-12','DS',6),(64,'Tiffany Stracke','2003-12-11','CS',2),(65,'Megane Kihn','1981-03-26','LAW',10),(66,'Prof. Marguerite Douglas MD','1973-03-24','MAT',9),(67,'Fleta Labadie','1984-09-09','BIZ',3),(68,'Jamal Durgan','1989-03-30','ELEC',10),(69,'Guy Lubowitz','1996-11-26','DS',1),(70,'Deontae Harvey','1998-11-11','LAW',9),(71,'Alena Grady','1993-04-03','CS',4),(72,'Adell Hudson','2000-05-30','BIZ',4),(73,'Uriah Fisher','1978-08-12','DS',3),(74,'Jacques Lakin','1976-06-11','CHEM',7),(75,'Oda Reinger','1999-10-21','LAW',3),(76,'Kamille Runte PhD','2000-08-27','BIZ',6),(77,'Juanita Carter IV','1998-09-24','ART',1),(78,'Dr. Jillian Yost','1991-06-13','BIZ',4),(79,'Coby Hammes','2001-01-05','BIZ',5),(80,'Madilyn Kassulke','1974-05-25','PHY',8),(81,'Reuben Jakubowski','1970-06-07','BIZ',3),(82,'Prof. Hayden Farrell II','1997-08-11','ELEC',6),(83,'Abe Schamberger Jr.','1992-12-12','ELEC',1),(84,'Edwardo Grimes','1993-08-12','DS',9),(85,'Mr. Royce Lemke V','1975-02-17','PHY',6),(86,'Leopoldo Brown IV','1982-11-28','ELEC',2),(87,'Prof. Fern Carroll IV','1991-07-05','PHY',4),(88,'Stan Bergnaum','2003-05-29','PHY',6),(89,'Layla Langosh','1986-07-11','PHY',8),(90,'Katherine West','2001-10-18','BIZ',4),(91,'Finn Sawayn','1990-03-23','LAW',4),(92,'Dr. Jensen Gulgowski','2000-12-19','CHEM',7),(93,'Michale Harvey','1978-02-16','MAT',5),(94,'Ali Emard','1986-12-14','PHY',5),(95,'Mr. Murray Douglas III','1998-05-26','LAW',10),(96,'Miss Shanel Bogan','2003-03-14','ART',7),(97,'Dr. Syble Berge DDS','1976-08-20','ART',8),(98,'Amy Lindgren','1992-12-08','LAW',9),(99,'Nora McLaughlin','1989-02-24','ELEC',9),(100,'Jed Kemmer','1982-11-24','CHEM',8);
