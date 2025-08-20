package com.test.servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.test.db.DBConnection;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String taskIdStr = request.getParameter("taskId");
        String status = request.getParameter("status");

        if (taskIdStr == null || status == null) {
            response.sendRedirect("pendingTasks.jsp?msg=Invalid+data");
            return;
        }

        try {
            int taskId = Integer.parseInt(taskIdStr);

            Connection con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement("UPDATE tasks SET status=? WHERE id=?");
            pst.setString(1, status);
            pst.setInt(2, taskId);
            pst.executeUpdate();
            con.close();

            // Redirect with message
            if (status.equals("Completed")) {
                response.sendRedirect("pendingTasks.jsp?msg=Marked+as+Completed");
            } else if (status.equals("Pending")) {
                response.sendRedirect("completedTasks.jsp?msg=Marked+as+Pending");
            } else if (status.equals("Deleted")) {
                response.sendRedirect("deletedTasks.jsp?msg=Task+Moved+to+Deleted");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
