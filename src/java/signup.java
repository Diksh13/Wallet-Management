/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author xyz
 */
public class signup extends HttpServlet {
    public Statement st;
   public ResultSet rs;
   public Connection con=null;
   
   
        static final String DB_URL =
      "jdbc:mysql://localhost:3306/wallet";
   static final String DB_DRV =
      "com.mysql.jdbc.Driver";
   static final String DB_USER = "diksha";
   static final String DB_PASSWD = "root";
   
   

// This class can be used to initialize the database connection

	protected static Connection initializeDatabase()
		throws SQLException, ClassNotFoundException
	{
		// Initialize all the information regarding
		// Database Connection
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql:// localhost:3306/";
		// Database name to access
		String dbName = "wallet";
		String dbUsername = "diksha";
		String dbPassword = "root";

		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dbURL + dbName,dbUsername,dbPassword);
		return con;
	}

   
//    public Connection getconnection()
//    {
//       try
//       {
//         Class.forName("com.mysql.cj.jdbc.Driver");
//         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wallet","diksha","root");
//         st=con.createStatement();
//         //rs=st.executeQuery("select * from student");
//         if(con!=null)
//         {
//             System.out.println("Connection establish");
//         }
//         else
//         {
//             System.out.println("Connection not established");
//         }
//       }
//       catch(SQLException | ClassNotFoundException e)
//       {
//           System.out.println(e);
//       }
//        return con;
//    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signup</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signup at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        response.setContentType("text/html");
        String name=request.getParameter("username");
        String email=request.getParameter("email");
        String pwd=request.getParameter("password");
        
        PrintWriter pw=response.getWriter();
        pw.println("<h1>Welcome</h1>"+name+email+pwd);
        pw.println("<h1>Welcome</h1>");
        
        
        
      

      Connection connection = null;
      Statement statement = null;
      ResultSet resultSet = null;
      pw.println(connection);

      try{
         connection=DriverManager.getConnection
            (DB_URL,DB_USER,DB_PASSWD);
         pw.println(connection);
         statement=connection.createStatement();
         pw.println(statement);
          pw.println(resultSet);
         resultSet=statement.executeQuery
            ("SELECT * FROM user");
         pw.println(resultSet);
         
         while(resultSet.next()){
            pw.println(
            resultSet.getString(1)+
            resultSet.getString(2)+
            resultSet.getString(3)+
            resultSet.getString(4));
         }

      }catch(SQLException ex){
          pw.println("sorry");
          
      }
        
        
        
        
        
//        con=getconnection();
//        pw.println("<h1>Welcome</h1>"+con);
//        if(con!=null)
//        {
//            
//            try {
////                System.out.println("Enter the Name");
////                name=sc.next();
////                System.out.print("Enter the Age");
////                age=sc.next();
////                System.out.println("Enter the Sem");
////                sem=sc.next();
////                System.out.println("Ente rthe Section");
////                sec=sc.next();
//                int status=st.executeUpdate("insert into user values('"+name+"','"+email+"','"+pwd+"')");
//                if(status==1)
//                {
//                    pw.println("<h1>Inserted successfully</h1>");
//                }
//                else
//                {
//                    pw.println("<h1>Not inserted</h1>");
//                }
//            } catch (SQLException ex) {
//                pw.println("<h1>Not iiinserted</h1>");
////                Logger.getLogger(Program1.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
