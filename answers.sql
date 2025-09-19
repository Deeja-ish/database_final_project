-- creating a database
CREATE DATABASE hotel;

-- using the database
USE hotel;

-- creating a tables

CREATE TABLE guest (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE rooms(
room_id INT AUTO_INCREMENT PRIMARY KEY,
room_number INT UNIQUE NOT NULL,
room_type VARCHAR(50) NOT NULL,
status ENUM('booked', 'available', 'maintainance') NOT NULL,
price DECIMAL(10,2) NOT NULL,
guest_id INT,
FOREIGN KEY (guest_id) REFERENCEs guest(guest_id)
);

CREATE TABLE reservations(
reservation_id INT AUTO_INCREMENT PRIMARY KEY,
check_in DATETIME NOT NULL,
check_out DATETIME NOT NULL,
status ENUM('pending', 'confirmed', 'cancelled'),
guest_id INT NOT NULL,
room_id INT NOT NULL,
FOREIGN KEY (guest_id) REFERENCES guest(guest_id),
FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME NOT NULL,
    method ENUM('cash', 'card', 'transfer') NOT NULL,
    reservation_id INT NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id)
);

CREATE TABLE staff(
staff_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
role ENUM('receptionist', 'cleaner', 'manager'),
phone VARCHAR(50) UNIQUE NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL
);

-- inseting data intp the tables
INSERT INTO guest(name, phone, email)
VALUES
('john doe', '+2342345678901', 'john@gmail.com'),
('mary smith', '+234156780987', 'mary@gmail.com');

-- insert into rooms table
INSERT INTO rooms(room_number, room_type, status, price, guest_id)
VALUES
('001', 'Regular', 'booked', '80000.00', '1'),
('002',  'VIP', 'booked', '100000.00', '2');

-- insert into reservations table

INSERT INTO reservations (check_in, check_out, status, guest_id, room_id)
VALUES
('2025-09-20', '2025-09-23', 'confirmed', 1, 1),
('2025-09-25', '2025-09-28', 'pending', 2, 2);

-- insert into payments table

INSERT INTO payments (amount, payment_date, method, reservation_id)
VALUES
(80000.00, '2025-09-19 14:30:00', 'card', 3),
(100000.00, '2025-09-24 09:00:00', 'cash', 4);

-- insert into staff table
INSERT INTO staff(name, role, phone, email)
VALUES
('alicia johnson', 'cleaner', '+2341234567890', 'alicia@gmail.com'),
('zainab baba', 'manager', '+2345675432123', 'zainab@gmail.com');