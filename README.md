
---

## 🧾 Features

This SQL project supports:

✔ Structured database schema for hotel operations  
✔ Multiple related entities (customers, rooms, bookings)  
✔ Primary & foreign key relationships  
✔ Sample data for quick testing  
✔ Design documentation and diagram

---

## 📋 Database Design

The core entities include:

- **Customers** – storing guest personal and contact info
- **Rooms** – room numbers, types, status, price
- **Bookings** – reservation dates, assigned rooms, linked to customers
- **RoomTypes** – types/categories of rooms with pricing
- **Staff** – hotel staff and their roles
- **Services** – additional services linked to guests or rooms

<img width="1488" height="788" alt="Hotel diagram" src="https://github.com/user-attachments/assets/a49d6afa-dd39-4a5a-a0e4-e8c538747508" />


---

## 🚀 Setup Instructions

To deploy this database on **SQL Server 2022**:

1. Install or open **Microsoft SQL Server Management Studio (SSMS)**.
2. Create a new database (just run the ddl it will automaticly create if available it will be deleted 1st).
3. Run the script: `DDL statement.sql` to create tables and constraints.
4. Run the script: `DML statement.sql` to insert sample records.
5. Explore and query the data in SSMS!

💡 You can modify the database name or scripts if needed for your environment.

---

## 🛠 Example Queries

Use the following to test your data after setup:

```sql
-- 1. View all rooms & types
SELECT r.RoomID, r.RoomNumber, rt.TypeName, rt.PricePerNight
FROM Rooms r
JOIN RoomTypes rt ON r.RoomTypeID = rt.RoomTypeID;

-- 2. View all bookings with guest info
SELECT b.BookingID, c.FullName, r.RoomNumber, b.CheckInDate, b.CheckOutDate
FROM Bookings b
JOIN Customers c ON b.CustomerID = c.CustomerID
JOIN Rooms r ON b.RoomID = r.RoomID;

