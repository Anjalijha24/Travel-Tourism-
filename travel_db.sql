Create database travel_db;
use travel_db;

-- Create Users Table
ALTER TABLE Users
ADD COLUMN guest_count INT DEFAULT 1; 

-- Add Guest Information to the Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    flight_id INT,
    booking_date DATE,
    destination VARCHAR(100),
    departure VARCHAR(100),
    arrival VARCHAR(100),
    time TIME,
    price DECIMAL(10, 2),
    guest_count INT, 
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Create Flights Table
CREATE TABLE Flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    airline_name VARCHAR(100),
    departure_airport VARCHAR(100),
    destination_airport VARCHAR(100),
    date DATE,
    time TIME,
    price DECIMAL(10, 2)
);

-- Create Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    flight_id INT,
    booking_date DATE,
    destination VARCHAR(100),
    departure VARCHAR(100),
    arrival VARCHAR(100),
    time TIME,
    price DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Create Hotels Table
CREATE TABLE Hotels (
    accomodation_id INT AUTO_INCREMENT PRIMARY KEY,
    hotel_name VARCHAR(255),
    location VARCHAR(255),
    availability INT,
    price_per_night DECIMAL(10, 2),
    contact_number VARCHAR(20)
);

-- Create HotelBookings Table
CREATE TABLE HotelBookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    hotel_id INT,
    check_in_date DATE,
    check_out_date DATE,
    total_price DECIMAL(10, 2),
    guest_count INT, 
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);
