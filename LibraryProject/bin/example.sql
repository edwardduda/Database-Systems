SELECT book.ISBN, book.title, author.firstName, author.lastName, library.name, locatedAt.num_copies, locatedAt.num_checked_out
FROM book
JOIN writtenBy ON book.ISBN = writtenBy.ISBN
JOIN author ON writtenBy.authorId = author.authorId
JOIN locatedAt ON locatedAt.ISBN = book.ISBN
JOIN library ON locatedAt.library = library.name
WHERE book.ISBN = 964210311003
;