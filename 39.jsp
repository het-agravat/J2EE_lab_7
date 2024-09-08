<!--39. Write a JSP program that inserts and displays records of students in a table. with output. -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Records</title>
</head>
<body>
    <h2>Insert Student Record</h2>
    <form action="index.jsp" method="post">
        Roll No: <input type="text" name="rollno" required><br>
        Name: <input type="text" name="name" required><br>
        Course: <input type="text" name="course" required><br>
        Semester: <input type="number" name="semester" required><br>
        <input type="submit" value="Insert">
    </form>

    <h2>Student Records</h2>
    <table border="1">
        <tr>
            <th>Roll No</th>
            <th>Name</th>
            <th>Course</th>
            <th>Semester</th>
        </tr>

        <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/studentdb";
            String user = "root";  // Replace with your DB username
            String password = "password";  // Replace with your DB password
            Connection conn = null;
            Statement stmt = null;

            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);
                stmt = conn.createStatement();

                // Check if form data is submitted
                String rollno = request.getParameter("rollno");
                String name = request.getParameter("name");
                String course = request.getParameter("course");
                String semester = request.getParameter("semester");

                // Insert data into the table if form is submitted
                if (rollno != null && name != null && course != null && semester != null) {
                    String insertSQL = "INSERT INTO student (rollno, name, course, semester) VALUES (" + rollno + ", '" + name + "', '" + course + "', " + semester + ")";
                    stmt.executeUpdate(insertSQL);
                }

                // Fetch and display records from the table
                String query = "SELECT * FROM student";
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("rollno") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("course") %></td>
                        <td><%= rs.getInt("semester") %></td>
                    </tr>
        <%
                }
                rs.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                // Close the connection
                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        %>
    </table>
</body>
</html>
