#CREATE DATABASE:

CREATE DATABASE Employee;
USE Employee;

#EMPLOYEES TABLE :

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Position VARCHAR(50),
    DateOfJoining DATE,
    ContactInfo VARCHAR(100)
);
SELECT * FROM Employees;
#ATTENDANCE TABLE :
CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    Date DATE,
    CheckInTime TIME,
    CheckOutTime TIME,
    Status ENUM('Present', 'Absent', 'Late'),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
SELECT * FROM Attendance;
use employee;

#LEAVE TABLE :

CREATE TABLE Leave_ (
    LeaveID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    LeaveDate DATE,
    LeaveType ENUM('Sick', 'Casual', 'Paid'),
    Status ENUM('Pending', 'Approved', 'Rejected'),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
select*from Leave_;
#DEPARTMENT TABLE :

CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

select*from Departments;
#USERS TABLE :

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(255),
    Role ENUM('Admin', 'Manager', 'Employee')
);

#INSERT EMPLOYEES DETAILS:

INSERT INTO Employees(FirstName, LastName, Department, Position, DateOfJoining, ContactInfo) VALUES
("paranjothi","R","it","developer","2024-10-01","7010568143"),
("gokul","s","it","fullstack","2024-10-01","6017568149"),
("jeeva","s","it","webdeveloper","2024-10-01","8070578243"),
("durai","b","it","uiux","2024-10-01","7014568643"),
("sathya","e","it","frontend","2024-10-01","7010568386");

select*from employees;

#INSERT ATTENDANCE :

INSERT INTO Attendance (EmployeeID, Date, CheckInTime, Status)
VALUES (1, '2024-12-01', '09:00:00', 'Present'),
(2, '2024-12-01', '09:00:00', 'Present'),
(3, '2024-12-01', '09:00:00', 'Present'),
(4, '2024-12-01', '09:00:00', 'Present'),
(5, '2024-12-01', '09:00:00', 'Present'),
(1, '2024-12-02', '09:00:00', 'Present'),
(2, '2024-12-02', '09:00:00', 'Present'),
(3, '2024-12-02', '09:00:00', 'Present'),
(4, '2024-12-02', '09:00:00', 'Present'),
(5, '2024-12-02', '09:00:00', 'Present'),
(1, '2024-12-03', '09:00:00', 'Present'),
(2, '2024-12-03', '09:00:00', 'Absent'),
(3, '2024-12-03', '09:00:00', 'Present'),
(4, '2024-12-03', '09:00:00', 'Present'),
(5, '2024-12-03', '09:00:00', 'Absent');

#INSERT USER PASSWORD: 

INSERT INTO Users(Username, Password, Role) VALUES(
"paranji","paranji0905","employee"),
("gokul","gokul0905","employee"),
("jeeva","jeeva0905","employee"),
("durai","durai0905","employee"),
("sathya","sathya0905","employee");
#UPDATE POSITION :

update users set role="Manager" where UserID=4;
update users set role="Admin" where UserID=2;

select*from users;


select*from Attendance;
#INSERT LEAVE:

insert into Leave_ (EmployeeID,LeaveDate,LeaveType)values(
2,"2024-12-03","paid"),
(5,"2024-12-03","paid");

select*from Leave_;
  
  #UPDATE LEAVE:
  
UPDATE Leave_
SET Status = 'Approved'
WHERE LeaveID = 1;

UPDATE Leave_
SET Status = 'Rejected'
WHERE LeaveID = 2;

SELECT*FROM Leave_;

#INSERT DEPARTMENTS :

INSERT INTO Departments(DepartmentName)VALUES("it");

select*from departments;

#SELECT PRESENT DAYS:

SELECT EmployeeID, COUNT(*) AS PresentDays
FROM Attendance
WHERE MONTH(Date) = 12 AND Status = 'Present'
GROUP BY EmployeeID;
#SELECT LATE ATTENDANCE:

SELECT EmployeeID, COUNT(*) AS LateDays
FROM Attendance
WHERE Status = 'Late'
GROUP BY EmployeeID;

#SELECT LEAVE COUNTS:

SELECT EmployeeID,COUNT(*) AS PresentDays
FROM Attendance
WHERE MONTH(Date) = 12 AND Status = 'Absent'
GROUP BY EmployeeID;

select*from users;




















































