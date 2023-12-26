--Preview of the dataset
SELECT TOP 5 *
FROM [dbo].[Bookings] ;
SELECT  *
FROM [dbo].[Summary$] ;

--Check Datatype of the columns
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME ='Bookings' ;

--RESERVATION
SELECT COUNT(*) AS TotalReservations
FROM [dbo].[Bookings]
SELECT reservation_status, COUNT(*) AS status_count
FROM [dbo].[Bookings]
GROUP BY reservation_status
ORDER BY status_count DESC;
SELECT SUM(is_canceled) AS canceled_reservation
FROM [dbo].[Bookings]
SELECT arrival_date_month , COUNT(*) AS reservations_count
FROM [dbo].[Bookings]
GROUP BY arrival_date_month
ORDER BY reservations_count DESC;
SELECT 
    COUNT(*) * 100.0 /(SELECT COUNT(*) FROM [dbo].[Bookings]) AS occupancy_rate
FROM [dbo].[Bookings]
WHERE reservation_status = 'Check-Out'
SELECT AVG(days_in_waiting_list) AS avg_waiting_days
FROM [dbo].[Bookings];


--HOTEL
SELECT hotel, COUNT(*) AS Hotel_count
FROM [dbo].[Bookings]
WHERE  [hoteL]  IN ('City Hotel' , 'Resort Hotel')
GROUP BY hotel;

SELECT *
FROM [dbo].[Bookings]
WHERE  [hoteL] IS NULL ;

--COUNTRY

SELECT country, COUNT(*) AS country_reservation
FROM [dbo].[Bookings]
GROUP BY country
ORDER BY country_reservation DESC;
SELECT country, AVG(adr) AS country_avg_dailyrate
FROM [dbo].[Bookings]
GROUP BY country
ORDER BY country_avg_dailyrate DESC;


--BOOKINGS
SELECT AVG(lead_time) AS avg_lead_time
FROM [dbo].[Bookings];

SELECT SUM(stays_in_week_nights) AS weeknight_stays,
       SUM(stays_in_weekend_nights) AS weekend_stays
FROM [dbo].[Bookings];
SELECT distribution_channel, COUNT(*) AS channel_count
FROM [dbo].[Bookings]
GROUP BY distribution_channel
ORDER BY channel_count DESC;
SELECT market_segment, COUNT(*) AS segment_count
FROM [dbo].[Bookings]
GROUP BY market_segment
ORDER BY segment_count DESC;

--FOOD
SELECT meal, COUNT(*) AS meal_count
FROM [dbo].[Bookings]
GROUP BY meal
ORDER BY meal_count DESC;

--ROOM
SELECT assigned_room_type, COUNT(*) AS room_type_count
FROM [dbo].[Bookings]
GROUP BY assigned_room_type
ORDER BY room_type_count DESC;
SELECT reserved_room_type, COUNT(*) AS room_type_count
FROM [dbo].[Bookings]
GROUP BY reserved_room_type
ORDER BY room_type_count DESC;
SELECT assigned_room_type, reserved_room_type, COUNT(*) AS matching_reservation
FROM [dbo].[Bookings]
WHERE assigned_room_type = reserved_room_type
GROUP BY assigned_room_type , reserved_room_type
ORDER BY matching_reservation DESC;

--Revenue

SELECT top 10 [adr] AS Dailyrate ,hotel, assigned_room_type
FROM [dbo].[Bookings] 
WHERE hotel = 'Resort Hotel'
ORDER by [adr] Desc
SELECT top 10 [adr] AS Dailyrate ,hotel, assigned_room_type
FROM [dbo].[Bookings]
WHERE hotel = 'City Hotel'
ORDER by [adr] Desc;
SELECT country, avg(adr) AS avg_daily_rate
FROM [dbo].[Bookings]
GROUP BY country
ORDER BY avg_daily_rate DESC;
SELECT arrival_date_month, SUM(adr)  AS monthly_revenue
FROM [dbo].[Bookings] 
GROUP BY arrival_date_month 
ORDER BY monthly_revenue;

--Guest
SELECT COUNT(*) AS repeated_guest_count
FROM [dbo].[Bookings]
WHERE is_repeated_guest = 1;

SELECT COUNT(*) * 100.0 / (SELECT COUNT(*) FROM [dbo].[Bookings]) AS repeated_guest_percentage
FROM [dbo].[Bookings]
WHERE is_repeated_guest = 1;





