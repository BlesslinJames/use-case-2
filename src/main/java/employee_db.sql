CREATE DATABASE EmployeeTaskTracker;
USE EmployeeTaskTracker;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    role ENUM('Associate', 'Admin'),
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255)
);
CREATE TABLE Tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    project VARCHAR(100),
    date DATE,
    start_time TIME,
    end_time TIME,
    category VARCHAR(50),
    description TEXT
);
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100),
    project_description TEXT
);
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);
select*from Users;
select*from tasks;
select*from Projects;
select*from Roles;
INSERT INTO tasks (employee_id, project, date, start_time, end_time, category, description) VALUES
(1, 'Project Alpha', '2024-07-23', '08:00:00', '16:00:00', 'Development', 'Developing new features'),
(2, 'Project Beta', '2024-07-23', '09:00:00', '17:00:00', 'Testing', 'Testing new features');
INSERT INTO Roles (role_name) VALUES ('Admin'), ('Associate');
ALTER TABLE Users ADD role_id INT, ADD FOREIGN KEY (role_id) REFERENCES Roles(role_id);
