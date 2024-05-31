DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Dept_Emp;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
	dept_no VARCHAR NOT NULL,
  	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE Titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR(30),
	PRIMARY KEY (title_id)
);

CREATE TABLE Employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1),
	hire_date DATE,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles (title_id)
);

CREATE TABLE Dept_Emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no)
);


CREATE TABLE Dept_Manager (
	dept_no VARCHAR NOT NULL,
  	emp_no INTEGER NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES Departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

CREATE TABLE Salaries (
	emp_no INTEGER NOT NULL,
	salary DECIMAL NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees (emp_no)
);

SELECT * FROM Departments;
SELECT * FROM Titles;
SELECT * FROM Employees;
SELECT * FROM Dept_Emp;
SELECT * FROM Dept_Manager;
SELECT * FROM Salaries;