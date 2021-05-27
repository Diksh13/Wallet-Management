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
        
                Query q = new Query();
		User user = (User) session.getAttribute("user");
		Wallet userWallet = q.getUserWalletBalance(user.getId());
                if (userWallet.getCash() < 100)
                {
                    
			request.setAttribute("message", "Your Balance is below the minimum balance i.e. Rs 100. Please add cash to the wallet");
                }
		request.setAttribute("wallet", userWallet);
		request.setAttribute("user", user);

        %>
    <jsp:include page="header.jsp" />
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
var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues = [55, 49, 44, 24, 15];
var barColors = ["red", "green","blue","orange","brown"];

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
      text: "World Wine Production 2018"
    }
  }
});
</script>
<script>
var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
var yValues = [55, 49, 44, 24, 15];
var barColors = [
  "#b91d47",
  "#00aba9",
  "#2b5797",
  "#e8c3b9",
  "#1e7145"
];

new Chart("myPieChart", {
  type: "pie",
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
      text: "World Wide Wine Production 2018"
    }
  }
});
</script>


</body>
</html>