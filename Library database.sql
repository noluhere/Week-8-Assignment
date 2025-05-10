CREATE DATABASE LibraryManagement;
USE LibraryManagement;
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PRIMARY KEY (AuthorID)
);
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Publisher VARCHAR(100) NOT NULL,
    PublicationDate DATE NOT NULL,
    PRIMARY KEY (BookID)
);
CREATE TABLE Book_Authors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PRIMARY KEY (MemberID)
);
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    PRIMARY KEY (LoanID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
CREATE TABLE Fines (
    FineID INT AUTO_INCREMENT,
    LoanID INT,
    FineAmount DECIMAL(10, 2) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL DEFAULT 'Unpaid',
    PRIMARY KEY (FineID),
    FOREIGN KEY (LoanID) REFERENCES Loans(LoanID)
);
show database;