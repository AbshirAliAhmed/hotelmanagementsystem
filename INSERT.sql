CREATE TABLE Guest (
    id INT PRIMARY KEY ,
    full_name VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    passport_number VARCHAR(50),
    created_by_who INT
);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (1, 'Ali Ahmed', '252612345678', 'A1234567', 101);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (2, 'Fatima Hassan', '252612345679', 'B2345678', 102);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (3, 'Mohamed Osman', '252612345680', 'C3456789', 103);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (4, 'Amina Abdi', '252612345681', 'D4567890', 104);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (5, 'Hassan Ali', '252612345682', 'E5678901', 105);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (6, 'Layla Yusuf', '252612345683', 'F6789012', 106);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (7, 'Abdirahman Mohamed', '252612345684', 'G7890123', 107);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (8, 'Zahra Nur', '252612345685', 'H8901234', 108);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (9, 'Omar Abdul', '252612345686', 'I9012345', 109);
INSERT INTO Guest (id, full_name, phone, passport_number, created_by_who) VALUES (10, 'Hodan Warsame', '252612345687', 'J0123456', 110);

    select * from Guest;

CREATE TABLE Rooms (
    id INT PRIMARY KEY ,
    room_number VARCHAR(10),
    room_type_id INT,
    status VARCHAR(20),
    price_per_night INT,
    FOREIGN KEY (room_type_id) REFERENCES room_types(id)
);
INSERT INTO Rooms (id, room_number, room_type_id, status, price_per_night) VALUES
(1, '1', 1, 'Available', 50);
(2, '102', 2, 'Occupied', 75),
(3, '103', 1, 'Available', 50),
(4, '104', 3, 'Under Maintenance', 100),
(5, '105', 2, 'Available', 75),
(6, '201', 1, 'Available', 50),
(7, '202', 2, 'Occupied', 75),
(8, '203', 3, 'Available', 100),
(9, '204', 2, 'Available', 75),
(10, '205', 1, 'Available', 50);
 select * from Rooms;

CREATE TABLE room_types (
    id INT PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(50),
    maxOccupancy INT
  
);
INSERT INTO room_types (id, name, description, maxOccupancy) VALUES
(1, 'Single Room', 'One single bed', 1),
(2, 'Double Room', 'One double bed', 2),
(3, 'Suite', 'Luxury suite', 4),
(4, 'Family Room', 'Two double beds', 4),
(5, 'Deluxe Room', 'Deluxe features', 2),
(6, 'Twin Room', 'Two single beds', 2),
(7, 'Studio', 'Studio setup', 3),
(8, 'Penthouse', 'Top-floor luxury', 6),
(9, 'Cabana', 'Private outdoor unit', 2),
(10, 'Dormitory', 'Shared space', 8);
 select * from room_types;




CREATE TABLE Booking (
    id INT PRIMARY KEY ,
    guest_id INT,
    room_id INT,
    check_in_date VARCHAR(50),
    check_out_date VARCHAR(50),
    total_amount INT,
    status VARCHAR(50),
    FOREIGN KEY (guest_id) REFERENCES Guest(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);
INSERT INTO Booking (id, guest_id, room_id, check_in_date, check_out_date, total_amount, status) VALUES
(1, 101, 1, '2024-01-01', '2024-01-03', 100, 'Confirmed'),
(2, 102, 2, '2024-01-02', '2024-01-05', 225, 'Checked Out'),
(3, 103, 3, '2024-01-04', '2024-01-06', 200, 'Cancelled'),
(4, 104, 4, '2024-01-07', '2024-01-10', 300, 'Confirmed'),
(5, 105, 5, '2024-01-08', '2024-01-12', 375, 'Checked Out'),
(6, 106, 6, '2024-01-09', '2024-01-11', 150, 'Confirmed'),
(7, 107, 7, '2024-01-13', '2024-01-15', 225, 'Confirmed'),
(8, 108, 8, '2024-01-14', '2024-01-16', 300, 'Cancelled'),
(9, 109, 9, '2024-01-17', '2024-01-19', 225, 'Checked Out'),
(10, 110, 10, '2024-01-20', '2024-01-22', 150, 'Confirmed');
 select * from Booking;


CREATE TABLE payment_details (
    id INT PRIMARY KEY ,
    booking_id INT,
    amount_paid DECIMAL(10, 2),
    payment_date VARCHAR(50),
    payment_method VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Booking(id)
);
INSERT INTO payment_details (id, booking_id, amount_paid, payment_date, payment_method, status) VALUES
(1, 1, 100.00, '2023-12-30', 'Credit Card', 'Paid');
(2, 2, 225.00, '2024-01-01', 'Bank Transfer', 'Paid'),
(3, 3, 0.00, '2024-01-03', 'Not Applicable', 'Refunded'),
(4, 4, 150.00, '2024-01-05', 'Debit Card', 'Pending'),
(5, 5, 375.00, '2024-01-07', 'Mobile Payment', 'Paid'),
(6, 6, 150.00, '2024-01-09', 'Cash', 'Paid'),
(7, 7, 225.00, '2024-01-11', 'Credit Card', 'Paid'),
(8, 8, 0.00, '2024-01-13', 'Not Applicable', 'Refunded'),
(9, 9, 225.00, '2024-01-15', 'Bank Transfer', 'Paid'),
(10, 10, 150.00, '2024-01-18', 'Mobile Payment', 'Paid');
 select * from payment_details;


CREATE TABLE staff (
    id INT PRIMARY KEY ,
    full_name VARCHAR(255) NOT NULL,
    title VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    status VARCHAR(50),
    hire_date VARCHAR(50)
);
INSERT INTO staff (id, full_name, title, email, phone, status, hire_date) VALUES
(101, 'Ahmed Ali', 'Manager', 'ahmed.ali@example.com', '+252612345678', 'Active', '2020-01-15'),
(102, 'Fatima Hassan', 'Developer', 'fatima.hassan@example.com', '+252612345679', 'Active', '2021-03-10'),
(103, 'Abdi Mohamed', 'Accountant', 'abdi.mohamed@example.com', '+252612345680', 'Active', '2019-08-20'),
(104, 'Layla Ahmed', 'HR Officer', 'layla.ahmed@example.com', '+252612345681', 'Active', '2022-05-25'),
(105, 'Hassan Warsame', 'Sales Executive', 'hassan.warsame@example.com', '+252612345682', 'Active', '2021-11-30'),
(106, 'Asha Noor', 'Marketing Specialist', 'asha.noor@example.com', '+252612345683', 'Active', '2020-07-18'),
(107, 'Ali Ismail', 'Engineer', 'ali.ismail@example.com', '+252612345684', 'Active', '2022-02-14'),
(108, 'Zahra Osman', 'Designer', 'zahra.osman@example.com', '+252612345685', 'Active', '2021-09-05'),
(109, 'Mohamed Abdi', 'Analyst', 'mohamed.abdi@example.com', '+252612345686', 'Active', '2020-04-22'),
(110, 'Halima Yusuf', 'Consultant', 'halima.yusuf@example.com', '+252612345687', 'Active', '2019-12-11');

 select * from staff;



CREATE TABLE roles (
    id INT PRIMARY KEY ,
    role_name VARCHAR(50) NOT NULL,
    description VARCHAR(50)
);
INSERT INTO roles (id, role_name, description) VALUES
(10, 'Developer', 'Develops and maintains system features');
(2, 'User', 'Standard user with limited access'),
(3, 'Manager', 'Oversees operations and manages teams'),
(4, 'Editor', 'Can edit content but has no admin rights'),
(5, 'Viewer', 'Can only view content, no editing permissions'),
(6, 'Moderator', 'Can moderate content and users')
(7, 'Support', 'Handles customer inquiries and issues')
(8, 'Contributor', 'Can contribute content but not publish'),
(9, 'Analyst', 'Responsible for data analysis and reporting'),
(10, 'Developer', 'Develops and maintains system features');
 select * from roles;


CREATE TABLE users (
    id INT PRIMARY KEY ,
    staff_id INT,
    role_id INT,
    FOREIGN KEY (staff_id) REFERENCES staff(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);
INSERT INTO users (id, staff_id, role_id) VALUES
(1, 1, 1);
(2, 102, 2),
(3, 103, 3),
(4, 104, 1),
(5, 105, 2),
(6, 106, 3),
(7, 107, 1),
(8, 108, 2),
(9, 109, 3),
(10, 110, 1);
 select * from users;
 ----1 Table: Guest
 CREATE VIEW GuestView AS
SELECT 
    g.id AS GuestID,
    g.full_name AS FullName,
    g.phone AS PhoneNumber,
    g.passport_number AS PassportNumber,
    g.created_by_who AS CreatedBy
FROM Guest g;

  ----2 Table:  RoomType
 
 
 CREATE VIEW RoomTypesView AS
SELECT 
    id AS RoomTypeID,
    name AS RoomTypeName,
    description AS Description,
    maxOccupancy AS MaximumOccupancy
FROM room_types;

 ----3 Table:  Room
 
 CREATE VIEW RoomsView AS
SELECT 
    r.id AS RoomID,
    r.room_number AS RoomNumber,
    r.status AS RoomStatus,
    r.price_per_night AS PricePerNight,
    rt.name AS RoomTypeName,
    rt.description AS RoomTypeDescription,
    rt.maxOccupancy AS MaximumOccupancy
FROM Rooms r
JOIN room_types rt ON r.room_type_id = rt.id;

 
  ----4 Table: Booking
CREATE VIEW BookingDetailsView AS
SELECT 
    b.id AS BookingID,
    g.full_name AS GuestName,
    g.phone AS GuestPhone,
    r.room_number AS RoomNumber,
    r.status AS RoomStatus,
    b.check_in_date AS CheckInDate,
    b.check_out_date AS CheckOutDate,
    b.total_amount AS TotalAmount,
    b.status AS BookingStatus
FROM Booking b
JOIN Guest g ON b.guest_id = g.id
JOIN Rooms r ON b.room_id = r.id;

 ----5 Table: Payment

CREATE VIEW PaymentDetailsView AS
SELECT 
    pd.id AS PaymentID,
    b.id AS BookingID,
    b.status AS BookingStatus,
    pd.amount_paid AS AmountPaid,
    pd.payment_date AS PaymentDate,
    pd.payment_method AS PaymentMethod,
    pd.status AS PaymentStatus,
    g.full_name AS GuestName,
    r.room_number AS RoomNumber
FROM payment_details pd
JOIN Booking b ON pd.booking_id = b.id
JOIN Guest g ON b.guest_id = g.id
JOIN Rooms r ON b.room_id = r.id;


 ----6 Table: Staff

CREATE VIEW StaffDetailsView AS
SELECT 
    id AS StaffID,
    full_name AS FullName,
    title AS JobTitle,
    email AS Email,
    phone AS PhoneNumber,
    status AS EmploymentStatus,
    hire_date AS HireDate
FROM staff;




 ----7 Table: Role
 
 CREATE VIEW RolesView AS
SELECT 
    id AS RoleID,
    role_name AS RoleName,
    description AS RoleDescription
FROM roles;

 
 
 ----8 Table: User
 CREATE VIEW UserDetailsView AS
SELECT 
    u.id AS UserID,
    s.full_name AS StaffName,
    s.email AS StaffEmail,
    r.role_name AS RoleName,
    r.description AS RoleDescription
FROM users u
JOIN staff s ON u.staff_id = s.id
JOIN roles r ON u.role_id = r.id;

 
 
 
 
 
 
 

