# 🌍 Zanzibar Peer-to-Peer Labor Marketplace

## 📖 Project Title

**Zanzibar Peer-to-Peer Labor Marketplace SQL Database**

---

## 📄 Project Description

This project provides a structured relational database schema for a **peer-to-peer labor marketplace** in Zanzibar. The system enables **users to register**, **offer or request services**, **make transactions**, and **communicate with one another**.

It is built using SQL with proper use of:
- **Primary Keys (PK)**
- **Foreign Keys (FK)**
- **NOT NULL** and **UNIQUE** constraints
- Relationship types: **1-to-1**, **1-to-Many**, and **Many-to-Many (M-M)**

---

## 🧱 Database Structure

### Included Tables:
1. **Users** – Details of service providers and seekers
2. **Services** – Listings of services by providers
3. **Transactions** – Service booking records
4. **Messages** – User-to-user communications linked to transactions
5. *(Optional)* **Skills** and **User_Skills** – M-M skill tagging

### Key Features:
- Data integrity via constraints
- Role differentiation using `ENUM('provider', 'seeker')`
- Time tracking with `TIMESTAMP DEFAULT CURRENT_TIMESTAMP`
- Structured for scalability and easy integration with frontend or API

---

## ⚙️ How to Run / Set Up the Project

### Prerequisites:
- MySQL or MariaDB installed
- A tool for running SQL:
  - MySQL Workbench
  - phpMyAdmin
  - MySQL CLI
  - DBeaver, VS Code SQL plugins, etc.

---

### 🧪 Instructions (Steps 2–4)

#### ✅ Step 2: Import the SQL File
You need to import the `.sql` file that defines all tables and constraints.

**Using MySQL CLI:**
```bash
mysql -u root -p
SOURCE path/to/zanzibar_labor_marketplace.sql;



Using MySQL Workbench:

Open MySQL Workbench.

Create a new schema (optional).

File → Open SQL Script → Select zanzibar_labor_marketplace.sql.

Run the script.

Using phpMyAdmin:

Navigate to your phpMyAdmin panel.

Select the desired database or create a new one.

Click on "Import".

Upload and execute the zanzibar_labor_marketplace.sql file.




✅ Step 3: Verify Tables
After import:

Run SHOW TABLES; to check if tables were created.

You can inspect schema with DESCRIBE table_name; for each table.





✅ Step 4: Insert Sample Data (Optional)
To test the schema:

INSERT INTO Users (username, password, email, first_name, last_name, role, phone_number)
VALUES ('johnDoe', 'securePass', 'john@example.com', 'John', 'Doe', 'provider', '123456789');

INSERT INTO Services (user_id, service_name, description, price, category)
VALUES (1, 'Carpentry Work', 'Furniture making and repairs', 40.00, 'Home Services');


