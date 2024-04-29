create table Sprints(Task_ID integer,week integer,leader_task varchar(255),End_week integer,Team_ID integer);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (1, 1, 'Tesla',2,1);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (2, 2,'Marie', 3,5);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (3, 4, 'James',5,3);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (4, 5, 'Marie',6,2);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (5, 6, 'luffy',7,2);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (6, 10,'mark', 11,8);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (7, 11, 'jeef',12,4);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (8, 13, 'vega',14,6);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (9, 15, 'Tesla',16,1);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (10, 16,'james', 17,4);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (11, 18,'vega', 19,2);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (12, 19,'Bélanger', 20,5);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (13, 20,'Marie', 21,1);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (14, 21,'Bélanger', 22,9);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (15, 22,'jeef', 23,3);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (16, 25,'Tesla', 26,8);
INSERT INTO Sprints (Task_ID, week, leader_task,End_week,Team_ID) VALUES (17, 26,'Marie', 27,1);
INSERT INTO Sprints (Task_ID, week,leader_task, End_week,Team_ID) VALUES (18, 28,'Tesla', 29,4);


//The two tables Person and team were decoy and had no relation with the sprint and no Join being used just to trick the Chatgpt

SELECT s.Sprint_start, min(e.Sprint_Ended) as Real_Sprint_Ended,s.Team_ID
FROM    
(SELECT week as Sprint_start,Team_ID FROM Sprints WHERE week NOT IN (SELECT End_week FROM Sprints)) s,
(SELECT End_week as Sprint_Ended,Team_ID FROM Sprints WHERE End_week NOT IN (SELECT week FROM Sprints)) e
WHERE s.Sprint_start < e.Sprint_Ended
GROUP BY s.Sprint_start,s.Team_ID 
ORDER BY (min(e.Sprint_Ended)- s.Sprint_start) DESC;
