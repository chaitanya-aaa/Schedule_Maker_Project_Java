<%@ page import="java.sql.*" %>
<%@ page import="com.test.db.DBConnection" %>
<html>
<head>
    <title>Pending Tasks</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Pending Tasks</h2>

    <% String msg = request.getParameter("msg"); if (msg != null) { %>
        <div class="alert alert-success"><%= msg %></div>
    <% } %>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Title</th><th>Description</th><th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    Connection con = DBConnection.getConnection();
                    PreparedStatement pst = con.prepareStatement("SELECT * FROM tasks WHERE status='Pending'");
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
            %>
                <tr>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getString("description") %></td>
                    <td>
                        <form action="UpdateStatusServlet" method="post" style="display:inline-block;">
                            <input type="hidden" name="taskId" value="<%= rs.getInt("id") %>">
                            <input type="hidden" name="status" value="Completed">
                            <button class="btn btn-success btn-sm">Mark Completed</button>
                        </form>
                        <form action="UpdateStatusServlet" method="post" style="display:inline-block;">
                            <input type="hidden" name="taskId" value="<%= rs.getInt("id") %>">
                            <input type="hidden" name="status" value="Deleted">
                            <button class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
     <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-outline-primary mx-2">Go to Home</a>
        <a href="completedTasks.jsp" class="btn btn-success mx-2">Go to Completed Tasks</a>
    	<a href="addTask.jsp" class="btn btn-outline-primary mx-2">Add Task</a>
    </div>
</div>
</body>
</html>
