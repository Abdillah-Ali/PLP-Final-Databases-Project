/*


Zanzibar Peer-to-Peer Labor Marketplace Database


This SQL script defines a relational database schema to support a labor 
marketplace platform. The system includes tables for users, services, 
transactions, and messaging. Proper constraints and relationships 
(1-1, 1-M, M-M) are enforced.

*/

-- Create database
CREATE DATABASE IF NOT EXISTS ZanzibarLaborMarketplace;
USE ZanzibarLaborMarketplace;




Table: Users
Description: Stores user information including seekers and providers.
Relationships:
    - One-to-Many with Services
    - One-to-Many with Transactions (as seeker)
    - One-to-Many with Messages (as sender or receiver)
    

*/
CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role ENUM('provider', 'seeker') NOT NULL,
    phone_number VARCHAR(15),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

/*


Table: Services
Description: Represents services offered by providers.
Relationships:
    - Many-to-One with Users
    
*/
CREATE TABLE IF NOT EXISTS Services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    service_name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10, 2),
    category VARCHAR(100),
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

/*

Table: Transactions
Description: Tracks service transactions between seekers and providers.
Relationships:
    - Many-to-One with Users (seeker)
    - Many-to-One with Services
    
*/
CREATE TABLE IF NOT EXISTS Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    seeker_id INT NOT NULL,
    service_id INT NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('pending', 'completed', 'cancelled') NOT NULL,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (seeker_id) REFERENCES Users(user_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);

/*

Table: Messages
Description: Stores messages between seekers and providers related to transactions.
Relationships:
    - Many-to-One with Users (sender)
    - Many-to-One with Users (receiver)
    - Many-to-One with Transactions
    
*/
CREATE TABLE IF NOT EXISTS Messages (
    message_id INT PRIMARY KEY AUTO_INCREMENT,
    transaction_id INT NOT NULL,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    message_text TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (transaction_id) REFERENCES Transactions(transaction_id),
    FOREIGN KEY (sender_id) REFERENCES Users(user_id),
    FOREIGN KEY (receiver_id) REFERENCES Users(user_id)
);

/*
Table: User_Skills (Many-to-Many Example)
Description: A user can have many skills, and a skill can belong to many users.

*/
CREATE TABLE IF NOT EXISTS Skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS User_Skills (
    user_id INT NOT NULL,
    skill_id INT NOT NULL,
    PRIMARY KEY (user_id, skill_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);

/*
End of Script

This schema includes:
- All required constraints (PK, FK, NOT NULL, UNIQUE)
- 1-M: Users -> Services, Users -> Transactions, Users -> Messages
- M-M: Users <-> Skills
- Data integrity and relational structure
===============================================================================
*/
