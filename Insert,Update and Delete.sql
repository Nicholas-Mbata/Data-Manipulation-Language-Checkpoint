Create database employee_participation_information_system;
use employee_participation_information_system;
-- Create Department Table
CREATE TABLE Department (
    Num_S INT PRIMARY KEY,
    Label VARCHAR(255) NOT NULL,
    Manager_Name VARCHAR(255) NOT NULL
);
-- Create Employee Table
CREATE TABLE Employee (
    Num_E INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Position VARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL CHECK (Salary > 0),
    Department_Num_S INT NOT NULL,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
);
-- Create Project Table
CREATE TABLE Project (
    Num_P INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Department_Num_S INT NOT NULL,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S),
    CHECK (End_Date >= Start_Date)
);
-- Create Employee_Project Table
CREATE TABLE Employee_Project (
    Employee_Num_E INT NOT NULL,
    Project_Num_P INT NOT NULL,
    Role VARCHAR(255) NOT NULL,
    PRIMARY KEY (Employee_Num_E, Project_Num_P),
    FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E),
    FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P)
);