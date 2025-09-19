# 🏨 Hotel Reservation System (SQL Project)

## 📌 Overview

This project is a **Hotel Reservation System** built with **MySQL**.
It simulates how hotels manage their operations — from storing guest details to booking rooms, managing payments, and assigning staff & services.

The main goal of this project was to practice:

* Database design (ERD, relationships, constraints)
* SQL commands (CREATE, INSERT, SELECT, etc.)
* Using **foreign keys** to maintain referential integrity

---

## 📂 Database Structure

The system includes the following tables:

1. **Guests**

   * Stores guest information (name, phone, email).

2. **Rooms**

   * Tracks room numbers, type (Regular/VIP), price, and booking status (`available` or `booked`).

3. **Reservations**

   * Links guests to rooms with check-in & check-out times.
   * Status can be `booked` or `available`.

4. **Payments**

   * Stores transaction details (amount, method, date).
   * Linked to reservations via `reservation_id`.

5. **Staff**

   * Records staff members working at the hotel.

6. **Services**

   * Represents hotel services offered (room cleaning, food delivery, etc.).

---

## 🛠️ SQL Schema

Example:

```sql
CREATE TABLE guest(
  guest_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(20) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE rooms(
  room_id INT AUTO_INCREMENT PRIMARY KEY,
  room_number VARCHAR(10) NOT NULL,
  room_type ENUM('Regular', 'VIP') NOT NULL,
  status ENUM('available', 'booked') NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  guest_id INT,
  FOREIGN KEY (guest_id) REFERENCES guest(guest_id)
);

CREATE TABLE reservations(
  reservation_id INT AUTO_INCREMENT PRIMARY KEY,
  check_in DATETIME NOT NULL,
  check_out DATETIME NOT NULL,
  status ENUM('booked','available') NOT NULL,
  guest_id INT,
  room_id INT,
  FOREIGN KEY (guest_id) REFERENCES guest(guest_id),
  FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

CREATE TABLE payments(
  payment_id INT AUTO_INCREMENT PRIMARY KEY,
  amount DECIMAL(10,2) NOT NULL,
  payment_date DATETIME NOT NULL,
  method ENUM('cash','card') NOT NULL,
  reservation_id INT,
  FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id)
);
```

---

## 📊 Sample Data

```sql
INSERT INTO guest(name, phone, email)
VALUES ('John Doe', '+2342345678901', 'john@gmail.com'),
       ('Mary Smith', '+234156780987', 'mary@gmail.com');

INSERT INTO rooms(room_number, room_type, status, price, guest_id)
VALUES ('001', 'Regular', 'booked', 80000.00, 1),
       ('002', 'VIP', 'booked', 100000.00, 2);

INSERT INTO reservations(guest_id, room_id, check_in, check_out, status)
VALUES (1, 1, '2025-09-18 14:00:00', '2025-09-19 11:00:00', 'booked'),
       (2, 2, '2025-09-23 14:00:00', '2025-09-24 11:00:00', 'booked');

INSERT INTO payments(amount, payment_date, method, reservation_id)
VALUES (80000.00, '2025-09-19 14:30:00', 'card', 3),
       (100000.00, '2025-09-24 09:00:00', 'cash', 4);
```

---

## ✅ Key Learnings

* Designing relational databases with **foreign key constraints**
* Handling **referential integrity errors** (ensuring parent rows exist before inserting child rows)
* Structuring SQL queries for real-world hotel management

---

Would you like me to also **generate an ER diagram (image) of the database schema** so you can add it to the README for extra visual impact?
