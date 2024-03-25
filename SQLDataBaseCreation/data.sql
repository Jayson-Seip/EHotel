INSERT INTO hotelchain (chainid, name, centralAddress, numberOfHotels, email, phoneNumber) VALUES (1, 'Hotel Chain A', '123 Central St, City, Country', 8, 'chaina@example.com', '+1234567890');
INSERT INTO hotelchain (chainid, name, centralAddress, numberOfHotels, email, phoneNumber) VALUES (2, 'Hotel Chain B', '456 Main St, City, Country', 8, 'chainb@example.com', '+1234567891');
INSERT INTO hotelchain (chainid, name, centralAddress, numberOfHotels, email, phoneNumber) VALUES (3, 'Hotel Chain C', '789 Park Ave, City, Country', 8, 'chainc@example.com', '+1234567892');
INSERT INTO hotelchain (chainid, name, centralAddress, numberOfHotels, email, phoneNumber) VALUES (4, 'Hotel Chain D', '101 Elm St, City, Country', 8, 'chaind@example.com', '+1234567893');
INSERT INTO hotelchain (chainid, name, centralAddress, numberOfHotels, email, phoneNumber) VALUES (5, 'Hotel Chain E', '222 Oak St, City, Country', 8, 'chaine@example.com', '+1234567894');

INSERT INTO hotel (hotelID, chainID, name, hotelAddress, area, email, phoneNumber, category)
VALUES
    -- Hotels for Chain 1
    (101, 1, 'Hotel A1', '123 Main St, Ottawa, Canada', 'Downtown', 'hotelA1@example.com', '+1234567891', 3),
    (102, 1, 'Hotel A2', '456 Park Ave, Toronto, Canada', 'Midtown', 'hotelA2@example.com', '+1234567892', 4),
    (103, 1, 'Hotel A3', '789 Elm St, Montreal, Canada', 'Suburb', 'hotelA3@example.com', '+1234567893', 2),
    (104, 1, 'Hotel A4', '101 Oak St, Toronto, Canada', 'Beachfront', 'hotelA4@example.com', '+1234567894', 5),
    (105, 1, 'Hotel A5', '222 Pine St, Vancouver, Canada', 'Riverside', 'hotelA5@example.com', '+1234567895', 1),
    (106, 1, 'Hotel A6', '333 Maple St, New York, US', 'Downtown', 'hotelA6@example.com', '+1234567896', 3),
    (107, 1, 'Hotel A7', '444 Cedar St, Calgary, Canada', 'Midtown', 'hotelA7@example.com', '+1234567897', 4),
    (108, 1, 'Hotel A8', '555 Walnut St, Ottawa, Canada', 'Suburb', 'hotelA8@example.com', '+1234567898', 2),
    -- Hotels for Chain 2
    (201, 2, 'Hotel B1', '123 Broadway, Toronto, Canada', 'Beachfront', 'hotelB1@example.com', '+1234567899', 3),
    (202, 2, 'Hotel B2', '456 Elm St, Montreal, Canada', 'Riverside', 'hotelB2@example.com', '+1234567900', 4),
    (203, 2, 'Hotel B3', '789 Oak St, Calgary, Canada', 'Mountainside', 'hotelB3@example.com', '+1234567901', 2),
    (204, 2, 'Hotel B4', '101 Maple St, New York, US', 'Downtown', 'hotelB4@example.com', '+1234567902', 5),
    (205, 2, 'Hotel B5', '222 Cedar St, Toronto, Canada', 'Midtown', 'hotelB5@example.com', '+1234567903', 1),
    (206, 2, 'Hotel B6', '333 Pine St, Ottawa, Canada', 'Suburb', 'hotelB6@example.com', '+1234567904', 3),
    (207, 2, 'Hotel B7', '444 Elm St, Ottawa, Canada', 'Beachfront', 'hotelB7@example.com', '+1234567905', 4),
    (208, 2, 'Hotel B8', '555 Oak St, Toronto, Canada', 'Riverside', 'hotelB8@example.com', '+1234567906', 2),
    -- Hotels for Chain C
    (301, 3, 'Hotel C1', '123 Hill St, Vancouver, Canada', 'Mountainside', 'hotelC1@example.com', '+1234567907', 3),
    (302, 3, 'Hotel C2', '456 Valley St, Ottawa, Canada', 'Downtown', 'hotelC2@example.com', '+1234567908', 4),
    (303, 3, 'Hotel C3', '789 Lake St, Calgary, Canada', 'Midtown', 'hotelC3@example.com', '+1234567909', 2),
    (304, 3, 'Hotel C4', '101 Park St, Toronto, Canada', 'Suburb', 'hotelC4@example.com', '+1234567910', 5),
    (305, 3, 'Hotel C5', '222 River St, Montreal, Canada', 'Beachfront', 'hotelC5@example.com', '+1234567911', 1),
    (306, 3, 'Hotel C6', '333 Forest St, New York, US', 'Riverside', 'hotelC6@example.com', '+1234567912', 3),
    (307, 3, 'Hotel C7', '444 Valley St, Vancouver, Canada', 'Mountainside', 'hotelC7@example.com', '+1234567913', 4),
    (308, 3, 'Hotel C8', '555 Hill St, Ottawa, Canada', 'Downtown', 'hotelC8@example.com', '+1234567914', 2),
    -- Hotels for Chain D
    (401, 4, 'Hotel D1', '123 Forest St, Toronto, Canada', 'Midtown', 'hotelD1@example.com', '+1234567915', 3),
    (402, 4, 'Hotel D2', '456 Grove St, Montreal, Canada', 'Suburb', 'hotelD2@example.com', '+1234567916', 4),
    (403, 4, 'Hotel D3', '789 Park St, Calgary, Canada', 'Beachfront', 'hotelD3@example.com', '+1234567917', 2),
    (404, 4, 'Hotel D4', '101 Lake St, Vancouver, Canada', 'Riverside', 'hotelD4@example.com', '+1234567918', 5),
    (405, 4, 'Hotel D5', '222 Valley St, Ottawa, Canada', 'Mountainside', 'hotelD5@example.com', '+1234567919', 1),
    (406, 4, 'Hotel D6', '333 Forest St, Toronto, Canada', 'Downtown', 'hotelD6@example.com', '+1234567920', 3),
    (407, 4, 'Hotel D7', '444 Hill St, Montreal, Canada', 'Midtown', 'hotelD7@example.com', '+1234567921', 4),
    (408, 4, 'Hotel D8', '555 River St, Calgary, Canada', 'Suburb', 'hotelD8@example.com', '+1234567922', 2),
    -- Hotels for Chain E
    (501, 5, 'Hotel E1', '123 Maple St, Ottawa, Canada', 'Downtown', 'hotelE1@example.com', '+1234567823', 3),
    (502, 5, 'Hotel E2', '456 Cedar St, Toronto, Canada', 'Midtown', 'hotelE2@example.com', '+1234567824', 4),
    (503, 5, 'Hotel E3', '789 Walnut St, Montreal, Canada', 'Suburb', 'hotelE3@example.com', '+1234567825', 2),
    (504, 5, 'Hotel E4', '101 Pine St, New York, US', 'Beachfront', 'hotelE4@example.com', '+1234567826', 5),
    (505, 5, 'Hotel E5', '222 Main St, Vancouver, Canada', 'Riverside', 'hotelE5@example.com', '+1234567827', 1),
    (506, 5, 'Hotel E6', '333 Broadway, Ottawa, Canada', 'Downtown', 'hotelE6@example.com', '+1234567828', 3),
    (507, 5, 'Hotel E7', '444 Elm St, Toronto, Canada', 'Midtown', 'hotelE7@example.com', '+1234567829', 4),
    (508, 5, 'Hotel E8', '555 Oak St, Montreal, Canada', 'Suburb', 'hotelE8@example.com', '+1234567830', 2);


