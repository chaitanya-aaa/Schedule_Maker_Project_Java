<%@ page import="java.sql.*" %>
<%@ page import="com.test.db.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Completed Tasks</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body style="background:#f0fff0;">
<div class="container mt-4">
    <h2 class="text-center text-success mb-4">Completed Tasks</h2>

    <% String msg = request.getParameter("msg"); if (msg != null) { %>
        <div class="alert alert-success text-center"><%= msg %></div>
    <% } %>

    <table class="table table-bordered table-striped">
        <thead class="table-success">
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement pst = con.prepareStatement("SELECT * FROM tasks WHERE status = 'Completed'");
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
        %>
            <tr>
                <td><%= rs.getString("title") %></td>
                <td><%= rs.getString("description") %></td>
                <td>
                    <!-- Mark as Pending -->
                    <form action="UpdateStatusServlet" method="post" style="display:inline;">
                        <input type="hidden" name="taskId" value="<%= rs.getInt("id") %>">
                        <input type="hidden" name="status" value="Pending">
                        <button type="submit" class="btn btn-warning btn-sm">Mark as Pending</button>
                    </form>

                    <!-- Mark as Deleted -->
                    <form action="UpdateStatusServlet" method="post" style="display:inline;">
                        <input type="hidden" name="taskId" value="<%= rs.getInt("id") %>">
                        <input type="hidden" name="status" value="Deleted">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                </td>
            </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='3' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
        </tbody>
    </table>
    <div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-outline-primary mx-2">Go to Home</a>
        <a href="pendingTasks.jsp" class="btn btn-outline-primary mx-2">Go to Pending Tasks</a>
        <a href="addTask.jsp" class="btn btn-outline-primary mx-2">Add Task</a>
    </div>
</div>
</body>
</html>
