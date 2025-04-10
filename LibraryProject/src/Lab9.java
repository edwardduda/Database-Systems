import java.sql.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;


public class Lab9 {
    public static void main(String[] args) {
        // JDBC connection details
        String url = "";
        // I deleted my login info
        String sqlUserName = "";
        String sqlPassword = "";

        // File path to the XML file
        String filePath = "src/activities.xml";

        try (Connection connection = DriverManager.getConnection(url, sqlUserName, sqlPassword)) {
            // Parse the XML file
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(filePath);

            // Normalize XML structure
            document.getDocumentElement().normalize();

            // Get all "borrowedBy" elements
            NodeList nodeList = document.getElementsByTagName("borrowedBy");

            for (int i = 0; i < nodeList.getLength(); i++) {
                Element element = (Element) nodeList.item(i);

                String memberId = element.getElementsByTagName("memberBy").item(0).getTextContent().trim();
                String ISBN = element.getElementsByTagName("ISBN").item(0).getTextContent().trim();
                String library = element.getElementsByTagName("library").item(0).getTextContent().trim();
                String checkoutDate = element.getElementsByTagName("checkoutDate").item(0).getTextContent().trim();
                String checkinDate = element.getElementsByTagName("Checkin_date").item(0).getTextContent().trim();

                if (!"N/A".equals(checkinDate)) {
                    // Handle checkin
                    updateCheckin(connection, memberId, ISBN, library, checkinDate);
                } else if (!"N/A".equals(checkoutDate)) {
                    // Handle checkout
                    if (checkBookExists(connection, ISBN, library)) {
                        insertCheckout(connection, memberId, ISBN, library, checkoutDate);
                    } else {
                        System.out.println("Book with ISBN " + ISBN + " does not exist in library " + library);
                    }
                }
            }

            // Run and print queries
            printBorrowedByTable(connection);
            printCheckedOutBooks(connection);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static boolean checkBookExists(Connection connection, String ISBN, String library) throws SQLException {
        String checkSQL = "SELECT COUNT(*) FROM locatedAt WHERE ISBN = ? AND library = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(checkSQL)) {
            preparedStatement.setString(1, ISBN);
            preparedStatement.setString(2, library);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        }
        return false;
    }

    private static void updateCheckin(Connection connection, String memberId, String ISBN, String library, String checkinDate) throws SQLException {
        String updateSQL = "UPDATE borrowedBy SET checkinDate = ? WHERE memberId = ? AND ISBN = ? AND library = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(updateSQL)) {
            preparedStatement.setString(1, checkinDate);
            preparedStatement.setString(2, memberId);
            preparedStatement.setString(3, ISBN);
            preparedStatement.setString(4, library);
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Successfully updated checkin for member " + memberId + " for book " + ISBN + " at " + library);
            } else {
                System.out.println("No matching checkout record found for member " + memberId + " for book " + ISBN + " at " + library);
            }
        }
    }

    private static void insertCheckout(Connection connection, String memberId, String ISBN, String library, String checkoutDate) throws SQLException {
        String insertSQL = "INSERT INTO borrowedBy (memberId, ISBN, library, checkoutDate) VALUES (?, ?, ?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(insertSQL)) {
            preparedStatement.setString(1, memberId);
            preparedStatement.setString(2, ISBN);
            preparedStatement.setString(3, library);
            preparedStatement.setString(4, checkoutDate);
            preparedStatement.executeUpdate();
            System.out.println("Successfully inserted checkout for member " + memberId + " for book " + ISBN + " at " + library);
        }
    }

    private static void printBorrowedByTable(Connection connection) throws SQLException {
        String query = "SELECT * FROM borrowedBy";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            System.out.println("Contents of Borrowed_by table:");
            while (resultSet.next()) {
                System.out.println("Member ID: " + resultSet.getInt("memberId") +
                        ", ISBN: " + resultSet.getString("ISBN") +
                        ", Library: " + resultSet.getString("library") +
                        ", Checkout Date: " + resultSet.getDate("checkoutDate") +
                        ", Checkin Date: " + resultSet.getDate("checkinDate"));
            }
        }
    }

    private static void printCheckedOutBooks(Connection connection) throws SQLException {
        String query = "SELECT m.lastName, m.firstName, m.memberId, b.title, l.library " +
                       "FROM member m " +
                       "JOIN borrowedBy bb ON m.memberId = bb.memberId " +
                       "JOIN book b ON bb.ISBN = b.ISBN " +
                       "JOIN locatedAt l ON bb.library = l.library " +
                       "WHERE bb.checkinDate IS NULL";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            System.out.println("Members with books currently checked out:");
            while (resultSet.next()) {
                System.out.println("Last Name: " + resultSet.getString("lastName") +
                        ", First Name: " + resultSet.getString("firstName") +
                        ", Member ID: " + resultSet.getInt("memberId") +
                        ", Book Title: " + resultSet.getString("title") +
                        ", Library: " + resultSet.getString("library"));
            }
        }
    }
}
