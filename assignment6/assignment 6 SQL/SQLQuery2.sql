-- Created Authors Table
CREATE TABLE Authors (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    biography NVARCHAR(MAX)
);
--insterted data into authors table
INSERT INTO Authors (name, biography)
VALUES 
('John Doe', 'John Doe is a software developer with over 10 years of experience in the tech industry. He specializes in web development and has a passion for teaching.'),
('Jane Smith', 'Jane Smith is a published author and historian. She has written several books on medieval history and is a frequent lecturer at universities.'),
('Emily Johnson', 'Emily Johnson is a graphic designer who works with both traditional and digital media. She has a keen eye for detail and a strong sense of color theory.'),
('Michael Brown', 'Michael Brown is a biochemist who has worked on groundbreaking research in the field of genetics. He has published numerous papers and received several awards.'),
('Sarah Davis', 'Sarah Davis is a professional photographer whose work has been featured in numerous international magazines. She specializes in portrait and landscape photography.');
-- Created Book Table
CREATE TABLE Book (
    id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(255) NOT NULL,
    publication_date DATE,
    ISBN NVARCHAR(13),
    summary NVARCHAR(MAX),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES Authors(id)
);
--insterted data into Books table
INSERT INTO Book (title, publication_date, ISBN, summary, author_id)
VALUES 
('Introduction to Web Development', '2020-03-15', '9781234567897', 'A comprehensive guide to web development covering HTML, CSS, and JavaScript.', 1),
('Medieval History Unveiled', '2018-06-25', '9782345678901', 'An in-depth look at the medieval period, exploring key events and figures.', 2),
('The Art of Design', '2021-09-10', '9783456789012', 'A guide to graphic design principles and techniques for aspiring designers.', 3),
('Genetics and You', '2019-12-05', '9784567890123', 'An exploration of genetic research and its implications for the future.', 4),
('Portraits of Nature', '2022-04-20', '9785678901234', 'A collection of stunning photographs capturing the beauty of the natural world.', 5);
-- Created Books_Review Table
CREATE TABLE Books_Review (
    id INT PRIMARY KEY IDENTITY(1,1),
    reviewer_name NVARCHAR(100) NOT NULL,
    review_text NVARCHAR(MAX),
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review_date DATE,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES Book(id)
);
--insterted data into Books_Review table
INSERT INTO Books_Review (reviewer_name, review_text, rating, review_date, book_id)
VALUES 
('Alice Johnson', 'A great introduction to web development. The examples were clear and easy to follow.', 5, '2021-04-10', 1),
('Bob Smith', 'An insightful book on medieval history. It provides a lot of details and interesting facts.', 4, '2019-07-15', 2),
('Catherine Lee', 'As a designer, I found this book incredibly useful. It covers both theory and practical applications.', 5, '2022-01-20', 3),
('David Martinez', 'A fascinating look into genetics. The explanations are clear and accessible to non-experts.', 4, '2020-02-25', 4),
('Eva Green', 'Stunning photography! This book is a visual feast and a tribute to nature’s beauty.', 5, '2023-05-18', 5);
