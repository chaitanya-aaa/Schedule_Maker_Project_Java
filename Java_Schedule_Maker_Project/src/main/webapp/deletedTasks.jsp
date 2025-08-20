<%@ page import="java.sql.*" %>
<%@ page import="com.test.db.DBConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleted Task</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background:#fff2f2">
<div class="container mt-4">
    <h2 class="text-center text-danger mb-4">Deleted Task</h2>
    <table class="table table-bordered">
        <thead class="table-danger">
            <tr>
                <th>Title</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Connection con = DBConnection.getConnection();
                Statement stmt = con.createStatement();

                // 1. Fetch deleted tasks
                ResultSet rs = stmt.executeQuery("SELECT * FROM tasks WHERE status='Deleted'");

                boolean hasData = false;
                while (rs.next()) {
                    hasData = true;
        %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("description") %></td>
            </tr>
        <%
                }

                // 2. Now delete those tasks from DB
                if (hasData) {
                    stmt.executeUpdate("DELETE FROM tasks WHERE status='Deleted'");
                }

                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='2' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>
  	<div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-outline-primary mx-2">Go to Home</a>
        <a href="addTask.jsp" class="btn btn-outline-danger mx-2">Add Task</a>
    </div>
</div>
</body>
</html>
