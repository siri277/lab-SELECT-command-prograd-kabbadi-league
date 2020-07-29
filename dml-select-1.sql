## Progression


-- 1. **Write a query to display the team details. Display the records sorted in the order of team name.**
INSERT INTO TEAM VALUES(1,'U MUMBA','SANJEEV KUMAR BALIYAN',3,2);
INSERT INTO TEAM VALUES(2,'PATNA PIRATES','RAM MEHAR SINGH',4,3);
INSERT INTO TEAM VALUES(3,'BENGALURU BULLS','RANDHIR SINGH',5,4);
INSERT INTO TEAM VALUES(4,'BENGAL WARRIORS','BC RAMESH',6,5);

SELECT * FROM TEAM;
SELECT NAME FROM TEAM ORDER BY NAME;

-- 2. **Write a query to display the player details whose name starts with a letter `S` and who do not belong to the country 'South Africa'. Display the records sorted in descending order based on player name.**
INSERT INTO PLAYER VALUES(1,'PARDEEP NARWAL','INDIAN',2,3);
INSERT INTO PLAYER VALUES(2,'AJAY THAKUR','INDIAN',3,4);
INSERT INTO PLAYER VALUES(3,'SURENDER NADA','INDIAN',4,5);
INSERT INTO PLAYER VALUES(4,'SIDDHARTH DESAI','INDIAN',5,6);

SELECT * FROM PLAYER;
SELECT * FROM PLAYER WHERE NAME LIKE 'S%' AND COUNTRY != 'SOUTH AFRICA' ORDER BY NAME DESC;

-- 3. **Write a query to display the event number and the seconds taken for each event. Display the records sorted in ascending order based on event number.**
INSERT INTO EVENT VALUES(2,3,4,1,14,10,20,24,20);
INSERT INTO EVENT VALUES(3,4,5,2,15,11,30,26,21);
INSERT INTO EVENT VALUES(4,5,6,3,16,12,40,28,22);
INSERT INTO EVENT VALUES(5,6,7,4,17,13,50,30,23);

SELECT * FROM EVENT;
SELECT EVENT_NO,CLOCK_IN_SECONDS FROM EVENT;
SELECT EVENT_NO FROM EVENT ORDER BY EVENT_NO ASC;

-- 4. **Write a query to display the event numbers of those events which has sum of raid points and defending points greater than or equal to 3. Display the records sorted in ascending order based on event_no.**
SELECT EVENT_NO
FROM EVENT
WHERE RAID_POINTS+DEFENDING_POINTS >= 3 ORDER BY EVENT_NO ASC;

-- 5. **Write a query to display the name of all the players who belong to the country India or Iran. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER
WHERE COUNTRY='INDIAN' ORDER BY NAME ASC;

-- 6. **Write a query to display the name of all the players who does not belong to the country India and Iran. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER
WHERE COUNTRY != 'INDIAN'AND COUNTRY!= 'IRAN' ORDER BY NAME ASC;

-- 7. **Write a query to display the names of all the skills that start with `Defend`. Display the records sorted in ascending order based on skill name.**
INSERT INTO SKILL VALUES(1,'RAIDER');
INSERT INTO SKILL VALUES(2,'DEFENDER');
INSERT INTO SKILL VALUES(3,'ALL-ROUNDER');

SELECT * FROM SKILL;
SELECT NAME FROM SKILL 
WHERE NAME LIKE 'DEFEND%' ORDER BY NAME ASC;

-- 8. **Write a query to display all the stadium names that ends with `Complex`. Display the records sorted in ascending order based on stadium names.**
INSERT INTO VENUE VALUES(2,'THYAGARAJ SPORTS COMPLEX',6);
INSERT INTO VENUE VALUES(3,'GACHIBOWLI INDOOR STADIUM',7);
INSERT INTO VENUE VALUES(4,'SAWAIMANSINGH INDOOR STADIUM',8);

SELECT * FROM VENUE;
SELECT STADIUM_NAME FROM VENUE
WHERE STADIUM_NAME LIKE '%COMPLEX' ORDER BY STADIUM_NAME ASC;

-- 9. **Write a query to display the winner team ids and the scores of those teams whose scores are less than 35. Display the records sorted in descending order based on outcome id.**
INSERT INTO OUTCOME VALUES(2,'ONGOING',5,20,3);
INSERT INTO OUTCOME VALUES(3,'COMPLETED',6,22,4);
INSERT INTO OUTCOME VALUES(4,'COMPLETED',7,23,5);

SELECT * FROM OUTCOME;
SELECT WINNER_TEAM_ID,SCORE FROM OUTCOME
WHERE SCORE<35 ORDER BY ID DESC; 

-- 10. **Write a query to display the game details of those games that were played between January and March of 2020. Display the records sorted in descending order based on id.**
INSERT INTO GAME VALUES(2,TO_DATE('23/10/2019','DD/MM/YYYY'),3,4,3,4,2,3,12,13);
INSERT INTO GAME VALUES(3,TO_DATE('12/01/2020','DD/MM/YYYY'),4,5,4,5,3,4,13,14);
INSERT INTO GAME VALUES(4,TO_DATE('03/02/2020','DD/MM/YYYY'),5,6,5,6,4,5,14,16);

SELECT * FROM GAME;
WHERE GAME_DATE BETWEEN '01/JAN/2020' AND '01/MAR/2020' ORDER BY ID DESC;

-- 11. **Write a query to display the names of players who are Raiders. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER 
WHERE ID IN(SELECT ID FROM SKILL WHERE NAME='RAIDER')ORDER BY NAME ASC;

-- 12. **Write a query to display the event number, raid points and defence points scored in the first innings of the game that was played on `2020-01-26`. Display the records sorted in ascending order based on event number.**
SELECT EVENT_NO,RAID_POINTS,DEFENDING_POINTS FROM EVENT
WHERE INNINGS_ID IN(SELECT FIRST_INNINGS_ID FROM GAME WHERE GAME_DATE='26-JAN-2020')ORDER BY EVENT_NO ASC;

-- 13. **Write a query to display the name of the winner team in the game played on `2020-03-09`. Display the records sorted in ascending order based on team name.**
SELECT NAME FROM TEAM
WHERE ID IN(SELECT WINNER_TEAM_ID FROM OUTCOME WHERE ID IN(SELECT ID FROM GAME WHERE GAME_DATE='09/MAR/2020'))ORDER BY NAME ASC;

-- 14. **Write a query to display the names of players who were the player of the match in the game played on 2020-03-09'. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER
WHERE ID IN(SELECT PLAYER_OF_MATCH FROM OUTCOME WHERE ID IN(SELECT ID FROM GAME WHERE GAME_DATE='09/MAR/2020'))ORDER BY ID DESC;

-- 15. **Write a query to display the names of players who are All rounders. Display the records sorted in ascending order based on player name.**
SELECT NAME FROM PLAYER
WHERE SKILL_ID IN(SELECT NAME FROM SKILL WHERE NAME='ALL ROUNDER') ORDER BY NAME ASC;

-- 16. **Write a query to display the venue names for all the games that were played on `2020-03-09`. Display the records sorted in ascending order based on venue name.**
SELECT STADIUM_NAME FROM VENUE,GAME
WHERE GAME_DATE='09-MAR-2020' ORDER BY STADIUM_NAME ASC;

-- 17. **Write a query to display the Coach's name of the team `Iran`**
SELECT COACH FROM TEAM
WHERE NAME ='IRAN';

-- 18. **Write a query to display the event number and the defence points of `Fazel Atrachali` in each event. Display the records sorted in ascending order based on event number.**
SELECT EVENT_NO FROM EVENT
WHERE DEFENDING_POINTS IN (SELECT ID FROM PLAYER WHERE NAME='Fazel Atrachali') ORDER BY EVENT_NO ASC;

-- 19. **Write a query to display the names of the Winning teams in the month of March 2020. Display the records sorted in ascending order based on team name.**
SELECT NAME FROM PLAYER
WHERE ID IN(SELECT WINNER_TEAM_ID FROM OUTCOME WHERE ID IN(SELECT ID FROM GAME WHERE GAME_DATE='01/MAR/2020'))ORDER BY NAME ASC;

-- 20. **Write a query to display the names of players who were the player of the match in the games held in March 2020. Display the records sorted in ascending order based on player name.**
