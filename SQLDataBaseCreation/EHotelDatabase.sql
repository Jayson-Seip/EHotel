Drop table if exists hotelChain cascade;
Create table if not exists hotelChain(
	chainID int,
	name varchar(20) NOT NULL,
	centralAddress varchar(100) NOT NULL,
	numberOfHotels int NOT NULL,
	email varchar(100) NOT NULL,
	phoneNumber varchar(20),
	
	PRIMARY KEY (chainID),
	check(email LIKE '_%@_%._%')
);

Drop table if exists hotel cascade;
Create table if not exists hotel(
	hotelID int  NOT NULL,
	chainID int NOT NULL,
	name varchar(20) NOT NULL,
	category int NOT NULL,
	hotelAddress varchar(100) NOT NULL,
	area varchar(20) NOT NULL,
	email varchar(100) NOT NULL,
	phoneNumber varchar(20) NOT NULL,
	
	PRIMARY KEY(HotelID),
	FOREIGN KEY(ChainID) REFERENCES hotelChain ON DELETE CASCADE ON UPDATE CASCADE,
	check(email LIKE '_%@_%._%'),
	check(category>=1 and category <=5)
);

Drop table if exists room cascade;
Create table if not exists Room(
	roomID int NOT NULL,
	hotelID int NOT NULL,
	price decimal(10,2) NOT NULL,
	seaview bool NOT NULL,
	mountainview bool NOT NULL,
	capacity int NOT NULL,
	extendable bool NOT NULL,
	
	PRIMARY KEY(roomID),
	FOREIGN KEY(hotelID) REFERENCES hotel ON DELETE CASCADE ON UPDATE CASCADE
);

Drop table if exists room_amenities cascade;
Create table if not exists room_amenities(
	roomID int NOT NULL,
	amenities VARCHAR(20),

	PRIMARY KEY(roomID,amenities),
	FOREIGN KEY(roomID) REFERENCES room ON DELETE CASCADE ON UPDATE CASCADE
);

Drop table if exists room_problems cascade;
Create table if not exists room_problems(
	roomID int NOT NULL,
	problem VARCHAR(100),

	PRIMARY KEY(roomID,problem),
	FOREIGN KEY(roomID) REFERENCES room ON DELETE CASCADE ON UPDATE CASCADE
);
	
	

Drop table if exists employee cascade;
Create table if not exists employee(
	employeeID int NOT NULL,
	SIN int NOT NULL,
	fullName varchar(45) NOT NULL,
	address varchar(45) NOT NULL,
	salary int NOT NULL,
	hotelID int NOT NULL,
	
	PRIMARY KEY(employeeID),
	FOREIGN KEY(hotelID) REFERENCES hotel ON DELETE CASCADE ON UPDATE CASCADE,
	check(Length(cast(SIN as VARCHAR)) = 9)	
);

Drop table if exists positions cascade;
Create table if not exists positions(
	postionID int NOT NULL,
	employeeID int NOT NULL,
	postion varchar(20) NOT NULL,
	
	PRIMARY KEY(postionID),
	FOREIGN KEY(employeeID) REFERENCES employee ON DELETE CASCADE ON UPDATE CASCADE
	
);

Drop table if exists works_as cascade;
Create table if not exists works_as(
	employeeID int NOT NULL,
	positionID int NOT NULL,
	
	PRIMARY KEY(employeeID, positionID),
	FOREIGN KEY(EmployeeID) REFERENCES employee ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(positionID) REFERENCES positions ON DELETE CASCADE ON UPDATE CASCADE
);
	
Drop table if exists customer cascade;
Create table if not exists customer(
	customerID int NOT NULL,
	fullName varchar(45) NOT NULL,
	address varchar(45) NOT NULL,
	registration bool NOT NULL,
	ID int NOT NULL,
	
	PRIMARY KEY(customerID)
	
);

Drop table if exists booking cascade;
Create table if not exists booking(
	bookingID SERIAL NOT NULL,
	roomID int NOT NULL,
	customerID int NOT NULL,
	checkout Date NOT NULL,
	checkin Date NOT NULL,
	payment bool NOT NULL,
	
	PRIMARY KEY(bookingID),
	FOREIGN KEY(roomID) REFERENCES room ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(customerID) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (CheckOut > CheckIn)
);

DROP FUNCTION IF EXISTS check_booking_day();
Create FUNCTION check_booking_day()
	RETURNS TRIGGER as
	$BODY$
	BEGIN
	-- Checks if check-in is before check-out date
	IF NEW.checkin > NEW.checkout THEN
		RAISE EXCEPTION 'Check-in date must be after check-out date';
	END IF;
	RETURN NEW;
	END
	$BODY$ LANGUAGE plpgsql;
	
DROP TRIGGER IF EXISTS update_booking ON booking;
Create TRIGGER update_booking
	BEFORE UPDATE ON booking
	FOR EACH ROW
	EXECUTE PROCEDURE check_booking_day();


Drop table if exists renting cascade;
Create table if not exists renting( 
	rentingID SERIAL NOT NULL,
	roomID int NOT NULL,
	customerID int NOT NULL,
	checkout Date NOT NULL,
	checkin Date NOT NULL,
	
	PRIMARY KEY(rentingID),
	FOREIGN KEY(roomID) REFERENCES room ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(customerID) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK (checkOut > checkIn)
	
);

Drop table if exists archives cascade;
Create table if not exists archives (
	archiveID int NOT NULL,
	customerID int NOT NULL,
	rentingID int NOT NULL,
	bookingID int NOT NULL,
	
	PRIMARY KEY(archiveID),
	FOREIGN KEY(customerID) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(rentingID) REFERENCES renting ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(bookingID) REFERENCES booking ON DELETE CASCADE ON UPDATE CASCADE
);

