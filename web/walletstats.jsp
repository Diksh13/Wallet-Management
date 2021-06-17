<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.ArrayList,java.util.*,java.util.Date,java.text.SimpleDateFormat,Dbase.*,pkg1.*"%>

<%
    Date date=new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
        String dayWeekText = new SimpleDateFormat("EEEE").format(date);
        int year = c.get(Calendar.YEAR);
        String[] monthName = {"January", "February",
                "March", "April", "May", "June", "July",
                "August", "September", "October", "November",
                "December"};
        String month = monthName[c.get(Calendar.MONTH)];
  
Query q = new Query();

                session = request.getSession(false);
		User user = (User) session.getAttribute("user");
                
                if(request.getParameter("stats")==null){
//                    System.out.println("stats is null");
                ArrayList<ArrayList<String>> arr1=q.getWeekBar(user);
                request.setAttribute("BarDataX",arr1.get(0));
                request.setAttribute("BarDataY",arr1.get(1));
                request.setAttribute("St","This Week");
                request.setAttribute("Stname",dayWeekText);
                }
                else
                {
//                   System.out.println("stats is not null");
                ArrayList<ArrayList<String>> arr1=q.getBar(user,request.getParameter("stats"));
                request.setAttribute("BarDataX",arr1.get(0));
                request.setAttribute("BarDataY",arr1.get(1));
                if(request.getParameter("stats").equals("Today")){
                    request.setAttribute("St","Today");
                request.setAttribute("Stname",dayWeekText);
                
                }
                else if(request.getParameter("stats").equals("Weekly")){
                    request.setAttribute("St","This Week");
                request.setAttribute("Stname",dayWeekText);
                }
                else if(request.getParameter("stats").equals("Monthly")){
                    request.setAttribute("St","This Month");
                request.setAttribute("Stname",month);
                }
                else
                {
                    request.setAttribute("St","This Year");
                request.setAttribute("Stname",year);
                }
                    
                }
                
                
                ArrayList<ArrayList<String>> arr2=q.getAllBar(user);
                request.setAttribute("BarDataAllX",arr2.get(0));
                request.setAttribute("BarDataAllY",arr2.get(1));
                
                
		
%>
                                <jsp:forward page="stats.jsp"/>
                                <%

		
		
		
%>