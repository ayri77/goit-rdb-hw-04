/*
Заповніть таблиці простими видуманими тестовими даними. Достатньо одного-двох рядків у кожну таблицю.
*/

-- Task 2
USE library_management;

INSERT INTO authors (author_name)
VALUES
    ('George Orwell'),
    ('J.K. Rowling');

INSERT INTO genres (genre_name)
VALUES
    ('Dystopian'),
    ('Fantasy');

INSERT INTO users (username, email)
VALUES
    ('ivan_petrenko', 'ivan.petrenko@example.com'),
    ('olena_shevchenko', 'olena.shevchenko@example.com');

INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES
    ('1984', 1949, 1, 1),
    ('Harry Potter and the Philosopher''s Stone', 1997, 2, 2);

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES
    (1, 1, '2024-01-10', '2024-01-20'),
    (2, 2, '2024-02-05', '2024-02-19');