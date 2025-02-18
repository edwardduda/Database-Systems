import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Lab10Duda {
    private String url;
    private String sqlUserName;
    private String sqlPassword;
    private Connection connection;

    public static void main(String[] args) {
        Lab10Duda lab10 = new Lab10Duda("jdbc:mysql://faure/edwardd", "edwardd", "836234659");
    }

    public Lab10Duda(String url, String sqlUserName, String sqlPassword) {
        this.url = url;
        this.sqlUserName = sqlUserName;
        this.sqlPassword = sqlPassword;
        connection = getConnection();
        guiInterface();
    }

    private void establishConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                connection = DriverManager.getConnection(url, sqlUserName, sqlPassword);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        if (connection == null) {
            establishConnection();
        }
        return connection;
    }

    public void guiInterface() {
        boolean running = true;
        Scanner inputScanner = new Scanner(System.in);
        while (running) {
            int responseInt;
            try {
                System.out.println("Welcome. Please enter 4-digit MemberID or press (0) to exit.");
                responseInt = inputScanner.nextInt();
                if (responseInt == 0) {
                    running = false;
                    inputScanner.close();
                    System.exit(-1);
                } else if (checkMemberId(connection, responseInt)) {
                    bookSearch(inputScanner);
                } else {
                    memberNotFound(inputScanner);
                }
            } catch (Exception e) {
                e.printStackTrace();
                running = false;
            }
        }
        inputScanner.close();
    }

    private boolean checkMemberId(Connection connection, int memberId) throws SQLException {
        String checkSQL = "SELECT memberId FROM member WHERE memberId = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(checkSQL)) {
            preparedStatement.setInt(1, memberId);
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet.next();
        }
    }

    private void memberNotFound(Scanner inputScnr) {
        try {
            System.out.println("Member ID not found. Would you like to sign up?\nYes or No.");
            String responseString = inputScnr.next();
            if (responseString.equalsIgnoreCase("yes")) {
                createMember(inputScnr);
            } else if (responseString.equalsIgnoreCase("no")) {
                System.out.println("Goodbye.");
                System.exit(0);
            } else {
                System.out.println("I'm sorry, please enter a valid response.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void createMember(Scanner inputScanner) {
        try {
            String[] attributeList = new String[3];
            for (int i = 0; i < attributeList.length; i++) {
                boolean validInput = false;
                while (!validInput) {
                    String attributeName = (i == 0) ? "First Name" : (i == 1) ? "Last Name" : "Date of Birth";
                    System.out.println("Please enter your " + attributeName + ":");
                    String responseString = inputScanner.next();
                    if (responseString.length() > 0 && responseString.length() < 50) {
                        attributeList[i] = responseString;
                        validInput = true;
                    } else {
                        System.out.println("Invalid input. Please try again.");
                    }
                }
            }
            int assignedMemberId = generateNewMemberId();
            insertMemberDBMS(assignedMemberId, attributeList[0], attributeList[1], attributeList[2]);
            guiInterface();
        } catch (SQLException e) {
            System.out.println("Unable to create Member. Please try again.");
        }
    }

    private int getMaxMemberId() throws SQLException {
        String sqlQuery = "SELECT MAX(memberId) FROM member";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sqlQuery)) {
            if (rs.next()) {
                return rs.getInt(1); // returns 0 if no IDs exist
            }
            return 999;
        }
    }

    private int generateNewMemberId() throws SQLException {
        int newId = getMaxMemberId() + 1;
        if (newId < 1000 || newId > 9999) {
            throw new RuntimeException("Member ID limit reached");
        }
        return newId;
    }

    private void insertMemberDBMS(int memberId, String firstName, String lastName, String dobStr) {
        String sqlQuery = "INSERT INTO member (memberId, firstName, lastName, DOB) VALUES (?, ?, ?, ?)";
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy");
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sqlQuery)) {
            java.util.Date parsedDate = dateFormat.parse(dobStr);
            java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
            pstmt.setInt(1, memberId);
            pstmt.setString(2, firstName);
            pstmt.setString(3, lastName);
            pstmt.setDate(4, sqlDate);
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                System.out.println("Member added successfully!");
                System.out.println("Your MemberID = " + memberId);
            } else {
                System.out.println("A problem occurred, member not added.");
            }
        } catch (ParseException | SQLException e) {
            System.out.println("Error adding member: " + e.getMessage());
        }
    }

    private void bookSearch(Scanner inputScanner) {
        try {
            System.out.println("How would you like to search for the book?");
            System.out.println("1. ISBN\n2. Name\n3. Author");
            int searchOption = inputScanner.nextInt();
            inputScanner.nextLine(); // Consume newline

            if (searchOption == 1) {
                System.out.println("Enter ISBN:");
                String isbn = inputScanner.nextLine();
                bookSearchQuery("ISBN", isbn);
            } else if (searchOption == 2) {
                System.out.println("Enter Name (partial name allowed):");
                String name = inputScanner.nextLine();
                bookSearchQuery("Name", name);
            } else if (searchOption == 3) {
                System.out.println("Enter Author's Name (partial name allowed):");
                String authorName = inputScanner.nextLine();
                bookSearchQuery("Author", authorName);
            } else {
                System.out.println("Invalid option.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void bookSearchQuery(String searchType, String searchString) throws SQLException {
        String sqlQuery = "";
        if (searchType.equals("ISBN")) {
            sqlQuery = "SELECT DISTINCT b.ISBN, b.title, a.firstName, a.lastName, l.name, la.num_copies, la.num_checked_out, la.floor, la.shelf " +
                    "FROM book b " +
                    "JOIN writtenBy wb ON b.ISBN = wb.ISBN " +
                    "JOIN author a ON wb.authorId = a.authorId " +
                    "JOIN locatedAt la ON b.ISBN = la.ISBN " +
                    "JOIN library l ON la.library = l.name " +
                    "WHERE b.ISBN = ?";
        } else if (searchType.equals("Name")) {
            sqlQuery = "SELECT DISTINCT b.ISBN, b.title, a.firstName, a.lastName, l.name, la.num_copies, la.num_checked_out, la.floor, la.shelf " +
                    "FROM book b " +
                    "JOIN writtenBy wb ON b.ISBN = wb.ISBN " +
                    "JOIN author a ON wb.authorId = a.authorId " +
                    "JOIN locatedAt la ON b.ISBN = la.ISBN " +
                    "JOIN library l ON la.library = l.name " +
                    "WHERE b.title LIKE ?";
        } else if (searchType.equals("Author")) {
            sqlQuery = "SELECT DISTINCT b.ISBN, b.title, a.firstName, a.lastName, l.name, la.num_copies, la.num_checked_out, la.floor, la.shelf " +
                    "FROM book b " +
                    "JOIN writtenBy wb ON b.ISBN = wb.ISBN " +
                    "JOIN author a ON wb.authorId = a.authorId " +
                    "JOIN locatedAt la ON b.ISBN = la.ISBN " +
                    "JOIN library l ON la.library = l.name " +
                    "WHERE a.firstName LIKE ? OR a.lastName LIKE ?";
        }

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {

            if (searchType.equals("ISBN")) {
                preparedStatement.setString(1, searchString);
            } else if (searchType.equals("Name")) {
                preparedStatement.setString(1, "%" + searchString + "%");
            } else if (searchType.equals("Author")) {
                preparedStatement.setString(1, "%" + searchString + "%");
                preparedStatement.setString(2, "%" + searchString + "%");
            }

            List<Book> books = new ArrayList<>();
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    String ISBN = resultSet.getString("ISBN");
                    String bookTitle = resultSet.getString("title");
                    String authorFirstName = resultSet.getString("firstName");
                    String authorLastName = resultSet.getString("lastName");
                    String libraryName = resultSet.getString("name");
                    int numCopies = resultSet.getInt("num_copies");
                    int numCheckedOut = resultSet.getInt("num_checked_out");
                    int floor = resultSet.getInt("floor");
                    int shelf = resultSet.getInt("shelf");
                    Book book = new Book(ISBN, bookTitle, authorFirstName, authorLastName, libraryName, numCopies, numCheckedOut, floor, shelf);
                    books.add(book);
                }
            }

            if (books.isEmpty()) {
                System.out.println("Book not found.");
            } else {
                for (Book book : books) {
                    if (book.numCopies > book.numCheckedOut) {
                        System.out.println("Book available at " + book.libraryName + " on floor " + book.floor + " shelf " + book.shelf);
                    } else {
                        System.out.println("All copies of the book are currently checked out at " + book.libraryName);
                    }
                }
            }
        }
    }
}

class Book {
    String ISBN;
    String bookTitle;
    String authorFirstName;
    String authorLastName;
    String libraryName;
    int numCopies;
    int numCheckedOut;
    int floor;
    int shelf;

    public Book(String ISBN, String bookTitle, String authorFirstName, String authorLastName, String libraryName, int numCopies, int numCheckedOut, int floor, int shelf) {
        this.ISBN = ISBN;
        this.bookTitle = bookTitle;
        this.authorFirstName = authorFirstName;
        this.authorLastName = authorLastName;
        this.libraryName = libraryName;
        this.numCopies = numCopies;
        this.numCheckedOut = numCheckedOut;
        this.floor = floor;
        this.shelf = shelf;
    }
}
