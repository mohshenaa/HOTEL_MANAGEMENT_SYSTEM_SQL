--DML statement for Hotel Management System

--use HotelManagementSystem
-----insert value into Guest table---------

insert into Guest (GuestName ,Email,Phone,Member ,Address)
values 
('Nurul Amin','Nurul@gmail.com','01533695781','1','sylhet'),
('Youns Ali','Youns@gmail.com','01719997080','4','Nowga'),
('Mishkatul Jobair','Jobair@gmail.com','01518945130','2','Dhaka'),
('Minhajul Islam','Minhaj@gmail.com','01851806911','1','Feni'),
('Fahim Islam','Fahim@gmail.com','01856020028','3','Ctg'),
('Yasin Arafat','Arafat@gmail.com','01846318836','2','Ctg'),
('Izaz Sakib','Sakib@gmail.com','01872055545','2','Feni'),
('Farjana Fardous','farjana@gmail.com','01833050350','2','Noakhali'),
('Saiful Islam','Saiful@gmail.com','01862208252','1','Noakhali'),
('Abu Rifat','Rifat@gmail.com','01832329083','2','Ctg'),
('Abdul Kader','Kader@gmail.com','01558052447','3','Dhaka')
go

-----insert value into RoomType table---------

insert into RoomType(TypeName,Ratepernight,Descriptions)
values
('Standard',1000, 'Basic room with essential amenities'),
('Family',2200, 'Larger room designed to accommodate families') ,
('Suite',2000, 'Luxurious room with separate living and sleeping areas'),
('Executive',2500, 'Premium room designed for business travelers') ,
('Presidential',3000, 'Top-tier suite with exclusive features and services'),
('King',1800, 'Room with a king-size bed'),
('Queen',1500, 'Room with a queen-size bed'),
('Twin', 1200,'Room with two single beds'),
('Deluxe',1400, 'Spacious room with upgraded features and better views')
go 

-----insert value into Room table---------

insert into Room(RoomNumber,TypeId ,Status)
values
(201,1,'booked'),
(301,2,'booked'),
(501,3,'booked'),
(401,1,'booked'),
(410,4,'booked'),
(202,5,'booked'),
(203,6,'booked'),
(204,7,'booked'),
(205,8,'booked'),
(207,9,'booked'),
(302,2,'booked'),
(402,4,'available'),
(411,5,'available')
go

-----insert value into facility table---------

insert into Facility(Facilityname,Facilitycost)
values 
('restuarent',1500),
('gym',500),
('spa',1000),
('play zone',500),
('swimming pool',500),
('conference room',1000),
('laundry','300')
go

-----insert value into Booking table---------

insert into Booking(GuestId,RoomId,BookingDate,stayingdays,bookingstatus,Check_in)
values 
(1,1,'2025-01-25',1,'active','2025-02-01'),
(2,2,'2025-02-20',3,'active','2025-02-28'),
(3,4,'2025-02-10',2,'active','2025-02-19'),
(4,6,'2025-04-25',1,'cancelled','2025-04-25'),
(5,9,'2025-03-12',1,'active','2025-03-16'),
(6,3,'2025-04-05',2,'active','2025-04-07'),
(7,5,'2025-04-25',2,'active','2025-04-28'),
(8,7,'2025-02-20',1,'active','2025-02-23'),
(9,8,'2025-01-25',2,'active','2025-01-26'),
(10,6,'2025-04-05',1,'active','2025-04-09'),
(11,1,'2025-02-10',1,'cancelled','2025-02-10')
go

-----insert value into Paymenttype table---------

insert into Paymenttype (Paytype)
values 
('Bkash'),('Debit card'),('Bank transfers'),
('Credit card'),('Nagad'),('Visa card')
go

-----insert value into Payment table---------

insert into Payment(Paytypeid,BookingId,Facilityid,Servicecharge )
values 
(1,1,2,300),
(2,2,4,300),
(3,3,2,300),
(4,4,5,300),
(5,5,3,300),
(6,6,6,300),
(6,7,6,300),
(3,8,3,300),
(3,9,6,300),
(1,10,2,300),
(6,11,6,300)
go

 ------merge statement for insert value in booking cancelled table ----

merge into cancelled as c
using ( 
select Bookingid,dateadd(day, 2, BookingDate) as Cancelleddate
from Booking
where Bookingstatus = 'cancelled') as b

on c.Bookingid= b.Bookingid
when not matched then

insert(BookingId,Cancelleddate)
values (b.Bookingid,b.Cancelleddate );
go

-----insert value into Users table---------
insert into Users(UserName,Password)
values('Admin',123456),
('Meem',123456)
go

-----insert value into position table---------
insert into position(PositionName)
values('Receptionist'),
('Manager'),
('Porter'),
('Housekeeper'),
('Waiter / Waitress'),
('Chef'),
('Guard'),
('Assistant')
go

-----insert value into staff table---------
insert into Staff(StaffName,Contact,PositionId,ShiftTime,BasicSalary,Allowances)
values  ('Sadia', '01711854255', 1, 'Day', 25000, 5000),
 ('Rakib', '01715896541', 1, 'Night', 30000, 5000),
('Rafi', '01715632587', 2, 'Day', 60000, 10000), 
('Rafat', '01711654122', 2, 'Night', 65000, 10000),
('Raju', '01710214585', 3, 'Day', 18000, 3000),   
('Safayet', '01719874125', 3, 'Night', 18000, 3000),
('Nasima', '01711654125', 4, 'Day', 20000, 4000),     
('Nasim', '01714582136', 4, 'Night', 23000, 4000), 
('Asha', '01711000005', 5, 'Day', 18000, 3000), 
('Ashaim', '01712584123', 5, 'Night', 20000, 3000), 
('Shafiq', '01711000006', 6, 'Day', 40000, 8000),  
('Rafiq', '017110005356', 6, 'Night', 45000, 8000), 
('Kamrul', '01711852369', 7, 'Day', 17000, 2000), 
('Hasan', '01711741258', 7, 'Night', 17000, 2000),  
('Sumi(spa)', '01711008521', 8, 'Day/Night', 30000, 6000),
('Rakin(gym)', '01711000231', 8, 'Day/Night', 30000, 6000), 
('Nayeem(laundry)', '01711852108', 8, 'Day', 30000, 6000),  
('Nesar(playzone)', '01711357951', 8, 'Day/Night', 30000, 6000);  

----call all tables----
select * from guest
select * from roomtype
select * from Room
select * from Facility
select * from Booking
select * from Paymenttype
select * from Payment
select * from Cancelled
select * from Users
select * from position
select * from Staff
go

--------retrive data---
select * from guest
where member = 3
order by guestid desc
go

select * from booking 
where bookingstatus like 'cancelled'
order by bookingid desc
go

----subquery----
select * from booking 
where BookingId in (select RoomId from Room where status = 'booked')
go

-----offset fetch---
select * from guest
order by guestid
offset 5 rows
fetch next 5 rows only
go
----uses of Aggregate functions-----

select PaymentDate, count(*) as counttotal,sum(AmountTotal) as sumtotal, min(AmountTotal) as mintotal,
avg(AmountTotal) as avgtotal, max(AmountTotal) as maxtotal
from Payment
group by PaymentDate
having PaymentDate between '2025-03-01' and '2025-03-31' and sum(AmountTotal)>=500
order by PaymentDate desc
go

------lag,lead---
select bookingid,check_in,check_out,
LAG(Check_out) OVER (PARTITION BY GuestID ORDER BY Check_in) as prevCheck_out,
LEAD(Check_in) OVER (PARTITION BY GuestID ORDER BY Check_in) as NextCheck_in
from booking
order by bookingid, Check_in


-----rollup----

select GuestId, count(*) as Totalbookings
from dbo.Booking
group by rollup (GuestId)
go
--------cube----

select Bookingid,GuestId, count(*) as Totalbookings
from dbo.Booking
group by rollup (Bookingid,GuestId)
go

-------grouping set

select GuestId, count(*) as Totalbookings
from dbo.Booking
group by grouping sets (GuestId,())
go
--------having
select GuestId, count(*) as Totalbookings
from dbo.Booking
group by GuestId
having count(*) >2

------floor
select floor(11.6) 
---celling--
select ceiling (-18.2)
go

------table variables--

declare @BookingTable table
(
Bookingid int,
Guestid int,
Roomid int,
Bookingdate date,
Status varchar(20)
)
insert into @Bookingtable
values (1, 1, 2, getdate(), 'Confirmed');
select * from @Bookingtable
go

--------temporary rable
--drop table #TempBookingInfo
--go
create table #TempBookingInfo
(
BookingId int,
GuestId int,
Bookingdate date
)
select BookingId, GuestId, Bookingdate
from dbo.Booking
where Bookingdate > '2025-01-01'
go
select * from #TempBookingInfo
go

--------global temporary rable
--drop table ##globaltempBookingInfo
--go
create table ##globaltempBookingInfo
(
BookingId int,
GuestId int,
Bookingdate date
)
select BookingId, GuestId, Bookingdate
from dbo.Booking
where Bookingdate > '2025-01-01'
go

select * from ##globaltempBookingInfo
go
-------create view with encryption by join -----

create view dbo.vw_hotelinformation
with schemabinding
as 
select g.GuestId, b.BookingId,r.roomid , guestname,Phone, Member,BookingDate,typename as roomname,Check_in,stayingdays,Check_out, PaymentDate,paytype,facilitycost, AmountTotal
from dbo.Booking as b
join dbo.room as r on b.RoomId= r.RoomId
join dbo.RoomType as rt on r.TypeId=rt.TypeId
join dbo.Guest as g on b.GuestId= g.GuestId
join dbo.Payment as p on b.BookingId= p.BookingId
join dbo.facility as f on p.facilityId=f.facilityId
join dbo.paymenttype as pay on p.paytypeid= pay.paytypeid
go

-----create view to see all cancelled columns details----

create view dbo.vw_hotelinformation2
with encryption
as 
select vw.BookingId ,GuestId, roomname, guestname,Phone, Member,BookingDate,cancelleddate
from dbo.vw_hotelinformation as vw
join dbo.cancelled as c on vw.BookingId= c.BookingId
go

--------call view--------

select * from dbo.vw_hotelinformation
select * from dbo.vw_hotelinformation2
go

----into function------
select * 
into softcopy
from dbo.vw_hotelinformation

----call into function----
select * from softcopy

---call Stored Procedure to insert
exec sp_addguest  
@GuestName = 'Mohshena Akter',  
@Email = 'mohshena1111@gmail.com',  
@Phone = '01883331808',  
@Member = 5,  
@Address = 'ctg'
go
-----call Stored Procedure with return

declare @Result int
exec
@result = sp_addguest_return
@GuestName = 'Sumaiya jahan',  
@Email = 'sumaiya@gmail.com', 
@Phone = '01787858996',  
@Member = 5, 
@Address = 'feni'
------- Check the return value
if @Result = 1
print 'Guest inserted successfully'
else
print 'Failed to insert guest'
go

--distinct--
select distinct guestname, Email
from guest

-- call the output parameter

declare @count int
exec sp_getguestbookingcount
@GuestName = 'Farjana Fardous',
@Bookingcount = @Count output
print 'total bookings for guest:'+ cast (@count as varchar)
go

----call Stored Procedure with transaction

exec sp_addpayment_Hotel @PaymentId = 1, @Amountpaid = 1000

----call scalar-Valued Function

select dbo.fn_getallbookingsbyguest('Farjana Fardous') as allbookings
select dbo.fn_getallbookingsbyguest('saiful islam') as allbookings

----call Table-Valued Function

select * from dbo.fn_getbooking2(9)

-----call multi valued function

select * from fn_GetBookings3('Izaz sakib')
go

-----table variable---

declare @guestlist table
(
Guestid int,
Guestname varchar(50)
)
insert into @GuestList (GuestID, GuestName)
values (1, 'mridu muna'), (2, 'shahrun jannat');
select * from @guestlist
go

-------cte----

with guestfamilymember as
(
select GuestId,GuestName,Member, Phone
from dbo.Guest
where Member > 3
)
select *
from guestfamilymember
go

-------Recursive cte----

with guestfamilymember2 as
(
select GuestId,GuestName,Member
from Guest
where Member < 3
union all
select g.GuestId,g.GuestName, g.Member
from Guest as g
join Guest on g.guestid = guest.guestid
)
select *
from guestfamilymember2
go

print 'complete DML'