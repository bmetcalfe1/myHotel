CREATE TABLE `rooms` (
  `room_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `roomNumber` INT(11) NOT NULL UNIQUE,
  `nightlyRate` INT(11) NOT NULL,
  `numberBedrooms` INT(11) NOT NULL,
  `numberWindows` INT(11) NOT NULL,
  `privateKitchen` BOOLEAN NOT NULL,
  `rentable` BOOLEAN NOT NULL,
  `carpet` BOOLEAN NOT NULL
);

// room num unique, room id is primary

CREATE TABLE `guests` (
  `guest_id` INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
  FOREIGN KEY (`guestId`) REFERENCES `guests` (`guest_id`)
);


-- // TO FIND empty rooms

SELECT * FROM rooms
WHERE room_id NOT IN (
SELECT DISTINCT room_id 
FROM BOOKINGS
WHERE ? BETWEEN checkIn AND checkOut
OR ? BETWEEN checkIn AND checkOut )

SELECT rooms.* FROM rooms
LEFT JOIN bookings ON rooms.id = bookings.room_id
And bookings.checkIn < ? AND bookings.checkOut > ?
WHERE bookings.id IS NULL

-- // use a form with 2 user inputs
-- // YYYY/MM/DD on form
-- // html5 input type = date could also work

-- //idea - input type range also cool here

-- // If the primary key happens to be an auto_increment value, 
-- you have to remove the auto increment, 
-- then drop the primary key 
-- then re-add the auto-increment

ALTER TABLE `rooms`
MODIFY `roomNumber` INT, 
DROP PRIMARY KEY, 
ADD PRIMARY KEY (room_id);

-- then add back the auto increment

-- ALTER TABLE `xx` ADD INDEX `auto_increment_field` (auto_increment_field),
-- MODIFY `auto_increment_field` int auto_increment;
-- then set auto increment back to previous value

-- ALTER TABLE `xx` AUTO_INCREMENT = 5;


