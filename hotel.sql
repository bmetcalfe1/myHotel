CREATE TABLE `rooms` (
  `roomNumber` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nightlyRate` INT(11) NOT NULL,
  `numberBedrooms` INT(11) NOT NULL,
  `numberWindows` INT(11) NOT NULL,
  `privateKitchenYN` TINYINT(1) NOT NULL,
  `rentableYN` TINYINT(1) NOT NULL,
  `carpetYN` TINYINT(1) NOT NULL
);

CREATE TABLE `guests` (
  `guestId` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `firstName` VARCHAR(11) NOT NULL,
  `lastName` VARCHAR(11) NOT NULL
);

CREATE TABLE `bookings` (
  `reservationNumber` INT(11) NOT NULL AUTO_INCREMENT,
  `roomNumber` INT(11) NOT NULL,
  `guestId` INT(11) NOT NULL,
  `checkIn` DATE NOT NULL, 
  `checkOut` DATE NOT NULL,
  PRIMARY KEY (`reservationNumber`),
  FOREIGN KEY (`roomNumber`) REFERENCES `rooms` (`roomNumber`),
  FOREIGN KEY (`guestId`) REFERENCES `guests` (`guestId`)
);
