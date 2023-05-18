create database DB_project;
use DB_project;



select * From Student;
select * from Faculty;
select * From Section;
select * from Allocates;
select * From Course;
select * From Feedback;
select * From Registers;
select * From Users;
select * from marks;
select * from Academic_Officer;
select * from Gives;
select * from offers;
select * from Attendance;
ALTER TABLE Student ADD CONSTRAINT UserId FOREIGN KEY (UserId) REFERENCES Users (UserId);
ALTER TABLE Student ADD CONSTRAINT Section1 FOREIGN KEY (Section) REFERENCES Section (SectionId);
ALTER TABLE Registers ADD CONSTRAINT StudentId1 FOREIGN KEY (StudentId) REFERENCES Student (UserId);
ALTER TABLE Registers ADD CONSTRAINT AcademicOfficer1 FOREIGN KEY (AcademicID) REFERENCES Academic_Officer (UserId);
ALTER TABLE Registers ADD CONSTRAINT CourseId1 FOREIGN KEY (CourseId) REFERENCES Course (CourseId);
ALTER TABLE Academic_Officer ADD CONSTRAINT UserId2 FOREIGN KEY (UserId) REFERENCES Users (UserId);
ALTER TABLE Faculty ADD CONSTRAINT UserId3 FOREIGN KEY (UserId) REFERENCES Users (UserId);
ALTER TABLE Allocates ADD CONSTRAINT Academic_OfficerID FOREIGN KEY (AcadOffID) REFERENCES Academic_Officer (UserId);
ALTER TABLE Allocates ADD CONSTRAINT FacultyId1 FOREIGN KEY (FacultyId) REFERENCES Faculty (UserId);
ALTER TABLE Allocates ADD CONSTRAINT SectionID1 FOREIGN KEY (SectionID) REFERENCES Section (SectionId);
ALTER TABLE Allocates ADD CONSTRAINT Allote4 FOREIGN KEY (CourseID) REFERENCES Course (CourseID);
ALTER TABLE Gives ADD CONSTRAINT StudentId3 FOREIGN KEY (StudentId) REFERENCES Student (UserId);
ALTER TABLE Gives ADD CONSTRAINT FacId FOREIGN KEY (FacultyId) REFERENCES Faculty (UserId)
ALTER TABLE Gives ADD CONSTRAINT FeedbackId1 FOREIGN KEY (FeedbackID) REFERENCES Feedback (FeedbackID);
ALTER TABLE marks ADD CONSTRAINT StudentId6 FOREIGN KEY (StudentID) REFERENCES Student (UserId);
ALTER TABLE marks ADD CONSTRAINT CourseId4 FOREIGN KEY (CourseId) REFERENCES Course (CourseId);
ALTER TABLE Offers ADD CONSTRAINT AcademicId5 FOREIGN KEY (AcademicID) REFERENCES Academic_Officer (UserId);
ALTER TABLE Offers ADD CONSTRAINT CourseID6 FOREIGN KEY (CourseId) REFERENCES Course (CourseId);


DELETE FROM Registers
WHERE RegNo > 130;
drop table Attendance;

Alter Table Attendance Add CourseId tinyint    -- ADDED CourseId in Attendance
Update Attendance Set CourseId = 106 where FacultyId = 6 AND UserID = 3 AND AttendDate = '2023-05-01'
Update Attendance Set CourseId = 116 where FacultyId = 12 AND UserID = 3 AND AttendDate = '2023-05-01'
Update Attendance Set CourseId = 106 where FacultyId = 9 AND UserID = 3 AND AttendDate = '2023-05-01'
Update Attendance Set CourseId = 106 where FacultyId = 6 AND UserID = 15 AND AttendDate = '2023-05-01'
Update Attendance Set CourseId = 117 where FacultyId = 6 AND UserID = 3 AND AttendDate = '2023-05-02'
Update Attendance Set CourseId = 106 where FacultyId = 12 AND UserID = 3 AND AttendDate = '2023-05-02'
Update Attendance Set CourseId = 110 where FacultyId = 9 AND UserID = 3 AND AttendDate = '2023-05-02'
Update Attendance Set CourseId = 106 where FacultyId = 9 AND UserID = 15 AND AttendDate = '2023-05-02'
Update Attendance Set CourseId = 106 where FacultyId = 6 AND UserID = 3 AND AttendDate = '2023-05-03'
Update Attendance Set CourseId = 106 where FacultyId = 12 AND UserID = 3 AND AttendDate = '2023-05-03'
Update Attendance Set CourseId = 110 where FacultyId = 9 AND UserID = 3 AND AttendDate = '2023-05-03'
Update Attendance Set CourseId = 110 where FacultyId = 9 AND UserID = 15 AND AttendDate = '2023-05-03'




-- select * from Faculty;  -- 2, 5 , 6, 9, 12, 16,17,18,19,20,21,22,23,24,25
-- ADDING SOME MORE VALUES
INSERT INTO Attendance VALUES(19, 27, '2023-05-01', 'A', 106);
INSERT INTO Attendance VALUES(2, 10, '2023-05-01', 'A', 106);
INSERT INTO Attendance VALUES(24, 27, '2023-05-01', 'A', 106);
INSERT INTO Attendance VALUES(12, 27, '2023-05-02', 'A', 106);
INSERT INTO Attendance VALUES(19, 27, '2023-05-02', 'P', 106);
INSERT INTO Attendance VALUES(19, 28, '2023-05-02', 'A', 106);
INSERT INTO Attendance VALUES(2, 36, '2023-05-03', 'A', 106);
INSERT INTO Attendance VALUES(19, 42, '2023-05-03', 'P', 106);
INSERT INTO Attendance VALUES(19, 8, '2023-05-03', 'A', 106);
INSERT INTO Attendance VALUES(25, 39, '2023-05-01', 'A', 106);
INSERT INTO Attendance VALUES(17, 13, '2023-05-01', 'A', 106);
INSERT INTO Attendance VALUES(18, 50, '2023-05-01', 'P', 106);
INSERT INTO Attendance VALUES(17, 48, '2023-05-02', 'A', 106);
INSERT INTO Attendance VALUES(19, 31, '2023-05-02', 'P', 106);
INSERT INTO Attendance VALUES(19, 29, '2023-05-02', 'P', 106);
INSERT INTO Attendance VALUES(20, 45, '2023-05-03', 'P', 106);
INSERT INTO Attendance VALUES(21, 47, '2023-05-03', 'P', 106);
INSERT INTO Attendance VALUES(25, 27, '2023-05-03', 'A', 106);

INSERT INTO Attendance VALUES(19, 27, '2023-05-01', 'A', 108);
INSERT INTO Attendance VALUES(2, 10, '2023-05-01', 'A', 108);
INSERT INTO Attendance VALUES(24, 27, '2023-05-01', 'A', 108);
INSERT INTO Attendance VALUES(12, 27, '2023-05-02', 'A', 108);
INSERT INTO Attendance VALUES(19, 27, '2023-05-02', 'P', 108);
INSERT INTO Attendance VALUES(19, 28, '2023-05-02', 'A', 108);
INSERT INTO Attendance VALUES(2, 36, '2023-05-03', 'A', 108);
INSERT INTO Attendance VALUES(19, 42, '2023-05-03', 'P', 108);
INSERT INTO Attendance VALUES(19, 8, '2023-05-03', 'A', 108);
INSERT INTO Attendance VALUES(25, 39, '2023-05-01', 'A', 108);
INSERT INTO Attendance VALUES(17, 13, '2023-05-01', 'A', 108);
INSERT INTO Attendance VALUES(18, 50, '2023-05-01', 'P', 108);
INSERT INTO Attendance VALUES(17, 48, '2023-05-02', 'A', 108);
INSERT INTO Attendance VALUES(19, 31, '2023-05-02', 'P', 108);
INSERT INTO Attendance VALUES(19, 29, '2023-05-02', 'P', 108);
INSERT INTO Attendance VALUES(20, 45, '2023-05-03', 'P', 108);
INSERT INTO Attendance VALUES(21, 47, '2023-05-03', 'P', 108);
INSERT INTO Attendance VALUES(25, 27, '2023-05-03', 'A', 108);

INSERT INTO Attendance VALUES(19, 27, '2023-05-01', 'A', 116);
INSERT INTO Attendance VALUES(2, 10, '2023-05-01', 'A', 116);
INSERT INTO Attendance VALUES(24, 27, '2023-05-01', 'A', 116);
INSERT INTO Attendance VALUES(12, 27, '2023-05-02', 'A', 116);
INSERT INTO Attendance VALUES(19, 27, '2023-05-02', 'P', 116);
INSERT INTO Attendance VALUES(19, 28, '2023-05-02', 'A', 116);
INSERT INTO Attendance VALUES(2, 36, '2023-05-03', 'A', 116);
INSERT INTO Attendance VALUES(19, 42, '2023-05-03', 'P', 116);
INSERT INTO Attendance VALUES(19, 8, '2023-05-03', 'A', 116);
INSERT INTO Attendance VALUES(25, 39, '2023-05-01', 'A', 116);
INSERT INTO Attendance VALUES(17, 13, '2023-05-01', 'A', 116);
INSERT INTO Attendance VALUES(18, 50, '2023-05-01', 'P', 116);
INSERT INTO Attendance VALUES(17, 48, '2023-05-02', 'A', 116);
INSERT INTO Attendance VALUES(19, 31, '2023-05-02', 'P', 116);
INSERT INTO Attendance VALUES(19, 29, '2023-05-02', 'P', 116);
INSERT INTO Attendance VALUES(20, 45, '2023-05-03', 'P', 116);
INSERT INTO Attendance VALUES(21, 47, '2023-05-03', 'P', 116);
INSERT INTO Attendance VALUES(25, 27, '2023-05-03', 'A', 116);

INSERT INTO Attendance VALUES(19, 27, '2023-05-01', 'A', 111);
INSERT INTO Attendance VALUES(2, 10, '2023-05-01', 'A', 111);
INSERT INTO Attendance VALUES(24, 27, '2023-05-01', 'A', 111);
INSERT INTO Attendance VALUES(12, 27, '2023-05-02', 'A', 105);
INSERT INTO Attendance VALUES(19, 27, '2023-05-02', 'P', 112);
INSERT INTO Attendance VALUES(19, 28, '2023-05-02', 'A', 113);
INSERT INTO Attendance VALUES(2, 36, '2023-05-03', 'A', 114);
INSERT INTO Attendance VALUES(19, 42, '2023-05-03', 'P', 115);
INSERT INTO Attendance VALUES(19, 8, '2023-05-03', 'A', 117);
INSERT INTO Attendance VALUES(25, 39, '2023-05-01', 'A', 118);
INSERT INTO Attendance VALUES(17, 13, '2023-05-01', 'A', 119);
INSERT INTO Attendance VALUES(18, 50, '2023-05-01', 'P', 120);
INSERT INTO Attendance VALUES(17, 48, '2023-05-02', 'A', 121);
INSERT INTO Attendance VALUES(19, 31, '2023-05-02', 'P', 122);
INSERT INTO Attendance VALUES(19, 29, '2023-05-02', 'P', 123);
INSERT INTO Attendance VALUES(20, 45, '2023-05-03', 'P', 124);
INSERT INTO Attendance VALUES(21, 47, '2023-05-03', 'P', 125);
INSERT INTO Attendance VALUES(25, 27, '2023-05-03', 'A', 121);

drop table marks;