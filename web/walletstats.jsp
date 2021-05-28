<%@ page language="java" contentType="text/html"
pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.ArrayList,java.util.*,Dbase.*,pkg1.*"%>

<%
Query q = new Query();

                session = request.getSession(false);
		User user = (User) session.getAttribute("user");
//                q.getBar(user);
//                ArrayList<Integer> arr = q.getBarData(user);
//                request.setAttribute("BarData",arr);
                
                
                ArrayList<ArrayList<String>> arr1=q.getWeekBar(user);
                request.setAttribute("BarDataX",arr1.get(0));
                request.setAttribute("BarDataY",arr1.get(1));
                
                ArrayList<ArrayList<String>> arr2=q.getMonthBar(user);
                request.setAttribute("BarDataMonthX",arr2.get(0));
                request.setAttribute("BarDataMonthY",arr2.get(1));
                
                
		
%>
                                <jsp:forward page="stats.jsp"/>
                                <%

		
		
		
%>