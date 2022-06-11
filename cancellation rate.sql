
/*
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| client_id   | int      |
| driver_id   | int      |
| city_id     | int      |
| status      | enum     |
| request_at  | date     |     
+-------------+----------+
id is the primary key for this table.
The table holds all taxi trips. Each trip has a unique id, while client_id and driver_id are foreign keys to the users_id at the Users table.
Status is an ENUM type of ('completed', 'cancelled_by_driver', 'cancelled_by_client').

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| users_id    | int      |
| banned      | enum     |
| role        | enum     |
+-------------+----------+
users_id is the primary key for this table.
The table holds all users. Each user has a unique users_id, and role is an ENUM type of ('client', 'driver', 'partner').
banned is an ENUM type of ('Yes', 'No').
*/

with tmp as (select t.*,if(status="completed",0,1) as cancel
             from trips t 
             join users cl
             on client_id=cl.users_id 
             join users dr 
             on driver_id=dr.users_id 
             where cl.banned="No" and
             dr.banned="No" 
             and request_at between '2013-10-01' and '2013-10-03')

select request_at as Day, round(sum(cancel)/count(cancel),2) as "Cancellation Rate" from tmp group by request_at
