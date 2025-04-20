-- Keep a log of any SQL queries you execute as you solve the mystery.

SELECT * FROM crime_scene_reports LIMIT 10;



SELECT descriptoin FROM crime_scene_reports  WHERE year=2023 AND month=7 AND day=28  AND street="Humphrey Street";

SELECT * FROM interviews LIMIT 10;

SELECT transcript,name FROM interviews WHERE year=2023 AND month=7 AND day=28;
--someone says that a man want to flight the first flight tomorrow!

--list of all flights at day=29 of month=7 year=2023
SELECT * FROM flights WHERE year=2023 AND month=7 AND day=29;


sqlite> SELECT full_name,city  FROM airports WHERE id = 8;
--the fiftyville airport number is 8


SELECT name FROM people WHERE phone_number IN
(SELECT caller FROM phone_calls WHERE year=2023 AND month=7 AND day=28 AND duration <60);
--list of people that their call-time is less than one minute


--the destination_airport_id and the idea of 8:20 flight is for new york!
SELECT city FROM airports
WHERE id = (SELECT destination_airport_id FROM flights WHERE id = 36);


--people with flight id of 36:
SELECT hour, minute FROM flights
WHERE year = 2023 AND day = 29 AND month = 7 ORDER BY hour, minute LIMIT 1;
SELECT id FROM flights WHERE hour = 8 AND minute = 20;



--with list is in common with durtion <60 : talor and bruce
SELECT name FROM people
    JOIN phone_calls ON people.phone_number = phone_calls.caller
    WHERE day = 28 AND month = 7 AND year = 2023 AND duration < 60;



SELECT name FROM people
    JOIN phone_calls ON people.phone_number = phone_calls.receiver
    WHERE day = 28 AND month = 7 AND year = 2023 AND duration < 60 AND caller = (SELECT phone_number FROM people WHERE name = "Taylor");
--reciever is jamse



SELECT name FROM people
    JOIN phone_calls ON people.phone_number = phone_calls.receiver
    WHERE day = 28 AND month = 7 AND year = 2023 AND duration < 60 AND caller = (SELECT phone_number FROM people WHERE name = "Bruce");
--reciever is Robin

--now should find one of this pair


--people that someone in interview says that exit from bakery_security_logs at hour = 10 AND minute > 10 AND minute < 30 that
SELECT name FROM people
    JOIN bakery_security_logs ON people.license_plate = bakery_security_logs.license_plate
    WHERE day = 28 AND month = 7 AND year = 2023 AND hour = 10 AND minute > 10 AND minute < 30 AND  activity = 'exit';

--bruce is one of them
