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
	capacity varchar(20) NOT NULL,
	extendable bool NOT NULL,
	
	PRIMARY KEY(roomID),
	FOREIGN KEY(hotelID) REFERENCES hotel ON DELETE CASCADE ON UPDATE CASCADE,
	Check(price>=0)
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
	roomID int,
	customerID int,
	checkout Date NOT NULL,
	checkin Date NOT NULL,
	payment bool NOT NULL,
	paymentType varchar(45),

	PRIMARY KEY(bookingID),
	FOREIGN KEY(roomID) REFERENCES room ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(customerID) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE,
    CHECK (CheckOut > CheckIn)
);

Drop table if exists renting cascade;
Create table if not exists renting(
	rentingID SERIAL NOT NULL,
	roomID int NOT NULL,
	customerID int NOT NULL,
	checkout Date NOT NULL,
	checkin Date NOT NULL,
	paymentType varchar(45),

	PRIMARY KEY(rentingID),
	FOREIGN KEY(roomID) REFERENCES room ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(customerID) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE,
	CHECK (checkOut > checkIn)
);

Drop table if exists archives cascade;
Create table if not exists archives (
	archiveID serial NOT NULL,
	customerID int NOT NULL,
	rentingID int,
	bookingID int,
	checkin_date DATE,
    checkout_date DATE,
    paymentType varchar(45),

	PRIMARY KEY(archiveID),
	FOREIGN KEY(customerID) REFERENCES customer ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(rentingID) REFERENCES renting ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(bookingID) REFERENCES booking ON DELETE CASCADE ON UPDATE CASCADE
);

--Triggers and functions
DROP FUNCTION if exists valid_booking;
Create FUNCTION valid_booking()
	RETURNS TRIGGER as
	$BODY$
	BEGIN
	IF EXISTS(
		SELECT* FROM booking
		WHERE roomID=NEW.roomID
		AND NEW.CheckIn<checkOut
		AND NEW.checkOut>checkIn
	) THEN
		RAISE EXCEPTION 'Booking Already Exists In between that time frame';
	END IF;
	IF NEW.checkin>NEW.checkout THEN
		RAISE EXCEPTION 'Booking Checkout is before Checkin';
	END IF;
	RETURN NEW;
	END
	$BODY$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS update_booking ON booking;
Create TRIGGER update_booking
	BEFORE UPDATE ON booking
	FOR EACH ROW
	EXECUTE PROCEDURE valid_booking();


DROP TRIGGER IF EXISTS prevent_double_booking ON booking;
Create TRIGGER prevent_double_booking
	BEFORE INSERT ON booking
	FOR EACH ROW
	EXECUTE PROCEDURE valid_booking();

DROP FUNCTION IF EXISTS valid_price;
Create FUNCTION valid_price()
	RETURNS TRIGGER AS
	$BODY$
	BEGIN 
	IF NEW.price<0 THEN RAISE EXCEPTION 'Price cannot be negative';
	END IF;
	RETURN NEW;
END $BODY$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS create_room ON room;
Create TRIGGER create_room
	BEFORE INSERT OR UPDATE ON room
	FOR EACH ROW
	EXECUTE PROCEDURE valid_price();


--Views

--Groups by city and area
DROP view if exists available_hotel_rooms_per_area;
Create view available_hotel_rooms_per_area as
SELECT split_part(hotel.hoteladdress, ',', 2) as city, hotel.area, COUNT(room.RoomID) AS AvailableHotelRooms
FROM hotel
JOIN room ON hotel.hotelID = room.hotelID
LEFT JOIN booking ON room.roomID = booking.roomID
AND booking.checkOut < CURRENT_DATE
GROUP BY city, hotel.area
ORDER BY city;

--Shows the capacity of the hotels based on room capacity
DROP view if EXISTS capacity_of_hotel;
Create view capacity_of_hotel as
SELECT hotel.name,
 SUM(CASE WHEN room.capacity = 'Single' THEN 1
 		  WHEN room.capacity = 'Double' THEN 2
		  WHEN room.capacity = 'Suite' THEN 4
		  ELSE 0
	END) as TotalCapacity
FROM hotel
JOIN room on hotel.hotelID = room.hotelID
GROUP BY hotel.name
ORDER BY hotel.name;

--Indexes
Create index room_type ON room(capacity); -- Commonly people will search for a room with a certain capacity
Create index price ON room(price); -- We will have a query that allows people to search by price of hotel
Create index hotel_name ON hotel(name); --Have a query that allows for people to search fora particular hotel brand name
Create index hotel_rating ON hotel(category); -- We will have a query which allows customers to search by rating
