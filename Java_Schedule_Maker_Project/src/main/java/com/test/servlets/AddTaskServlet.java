package com.test.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.db.DBConnection;
@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String title = request.getParameter("title");
			
			
			String description = request.getParameter("description");
			
			String status = request.getParameter("status");
			
			try (Connection con = DBConnection.getConnection()) {
				String qry = "INSERT INTO tasks (title, description, status) VALUES (?, ?, ?)";
				
				PreparedStatement pst = con.prepareStatement(qry);
				
				pst.setString(1, title);
				
				pst.setString(2, description);
				
				pst.setString(3, status);
				
				int i = pst.executeUpdate();
				
				if (i > 0) {
					response.sendRedirect("pendingTasks.jsp");
				} else {
					response.getWriter().println("Error inserting task.");
				}
			} catch (Exception e) {
				 e.printStackTrace();
				 response.getWriter().println("<h3>Database error: " + e.getMessage() + "</h3>");
		        }
		} 
}
