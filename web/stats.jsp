<%@ page language="java" contentType="text/html"
         pageEncoding="UTF-8" import="java.sql.*,java.util.*,Dbase.*,pkg1.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <%
//        Query q=new Query();
//        session = request.getSession(false);
//		User user = (User) session.getAttribute("user");
//		User user = (User) session.getAttribute("user");
//                int a=user.getId();
//                List<Integer> BarData  = new ArrayList<Integer>();
//                q.getBarData(user);
                
        %>
    
    <jsp:include page="header.jsp" />
    <br>
    <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
    
            <canvas id="myChart" style="width:100%;max-width:700px;background-color: #ffffff;float:left;"></canvas>
                        </div>
                        <div class="col-md-6">
    
            <canvas id="myPieChart" style="width:100%;max-width:700px;background-color: #ffffff;float:right;"></canvas>
                        </div>
                    </div>
                </div>
            
    </div>
    
                                <jsp:include page="footer.jsp" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
<script>
     var d = new Date();
    var weekday = new Array(7);
  weekday[0] = "Sunday";
  weekday[1] = "Monday";
  weekday[2] = "Tuesday";
  weekday[3] = "Wednesday";
  weekday[4] = "Thursday";
  weekday[5] = "Friday";
  weekday[6] = "Saturday";
var xValues=${BarDataX};
var yValues = ${BarDataY};
var barColors = ["red", "green","blue","orange","brown","yellow","black","grey"];

new Chart("myChart", {
  type: "bar",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    title: {
      display: true,
      text: "Weekly Stats : "+weekday[d.getDay()],
    }
  }
});
</script>
<script>
var d = new Date();
var month = new Array();
  month[0] = "January";
  month[1] = "February";
  month[2] = "March";
  month[3] = "April";
  month[4] = "May";
  month[5] = "June";
  month[6] = "July";
  month[7] = "August";
  month[8] = "September";
  month[9] = "October";
  month[10] = "November";
  month[11] = "December";
var xValues=${BarDataMonthX};
var yValues = ${BarDataMonthY};
var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145",
  "#FFD700",
  "#000000",
  "#808080"
];

new Chart("myPieChart", {
  type: "doughnut",
  data: {
    labels: xValues,
    datasets: [{
      backgroundColor: barColors,
      data: yValues
    }]
  },
  options: {
    title: {
      display: true,
      text: "Monthly Stats : "+month[d.getMonth()],
    }
  }
});
</script>


</body>
</html>