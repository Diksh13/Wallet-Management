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
    
    <jsp:include page="header.jsp" />
    <br>
    <div class="content">
                <div class="container-fluid">
                    <form action="walletstats.jsp" method="post">
                    <label for="comments" style="color: white;font-size: 20px;"><b>Transaction Stats</b></label> 
                        <div style="width:300px;">
                            <select name="stats" required>
                            <option>Select One</option>
                            <option value="Today">Today</option>
                            <option value="Weekly">Weekly</option>
                            <option value="Monthly">Monthly</option>                            
                            <option value="Yearly">Yearly</option>         
  </select>
</div>
              
                            <input type="submit" value="Go" style="position:absolute;left:320px;background-color:white;color:black;top:201px;">     
                    </form>
                   
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
   var mes1="${St}";
   var mes2="${Stname}";
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
      text: mes1+ " : "+mes2,
    }
  }
});
</script>
<script>
var xValues=${BarDataAllX};
var yValues = ${BarDataAllY};
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
      text: "Transaction Stats : Overall",
    }
  }
});
</script>


</body>
</html>