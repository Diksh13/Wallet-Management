<%@ page language="java" contentType="text/html"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,Dbase.*,pkg1.*"%>


<%
Query q = new Query();

String query = "insert into user(username,email,password) values(?,?,?)";
		Connection conn = DbConnection.getConnection();
		
		User user = new User(request.getParameter("username"), request.getParameter("email"),
				request.getParameter("password"));
                out.println(request.getParameter("username"));
                
		boolean userExists = q.checkUserExistence(user.getUsername());
                
                out.println(userExists);

		if (userExists) {
			request.setAttribute("userExists", true);
			request.setAttribute("currentUser", user.getUsername());
                        %>
                        <jsp:forward page="signup.jsp"/>
                        <%
                                
		
		}

		try {
			java.sql.PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			int success = ps.executeUpdate();
			if (success == 1) {
				user = q.getUserByUserName(request.getParameter("username"));
				q.createUserWallet(user);
				request.setAttribute("message", "Successfully created the user.");
				request.setAttribute("user", user);
                                %>
                                <jsp:forward page="SignIn.jsp"/>
                                <%
				return;
			}
		} catch (SQLException e) {
                        out.println(e);
}
	
%>