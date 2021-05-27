<%-- 
    Document   : inde
    Created on : 22 May, 2021, 5:47:02 PM
    Author     : xyz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
ul {
  list-style-type: none;
  margin: 0;
  /*margin-top: 0px;*/
  padding: 0;
  overflow: hidden;
  background-color: #7926BE;
  /*top:0px;*/
  /*position:*/ 
  width:100%;
  
}

li {
  float: right;
}

li a{
  display: block;
  color: white;
  text-align: center;
  padding: 29px 16px;
  text-decoration: none;
  font-size:25px;
}
.a{
display: block;
  color: white;
  font-family:cursive;
  text-align: center;
  font-size:25px;
  padding: 0px 15px;
  
  text-decoration: none;
}
.b{
   /*display: block;*/
  color: white;
  text-align: center;
  font-size:45px;
  padding: 0px 15px;
  
  /*text-decoration: none;*/
 
}
.a img
{
    position:relative;
    top:20px;
}

li a:hover:not(.active) {
  background-color: #F88D24;
}

.active {
  background-color:green;
}

.mainbody img
{
    /*background-attachment: fixed;*/
    width:1500px;
    position:relative;
    left:1px;
    top:20px;
    
}

.footer {
   position: absolute;
   left: 0;
   bottom: -180px;
   width: 100%;
   background-color: #7926BE;
   color: white;
   text-align: center;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor='#B65FCF'>
        <ul>
  <li><a href="index.jsp">Home</a></li>
  <li><a href="signup.jsp">Register</a></li>
  <li><a href="SignIn.jsp">Login</a></li>
  <div class='a' style="float:left"><img src='css/wallet.png' height='50' width='50'>&nbsp;&nbsp;
      <b>Wallet Management</b></div>
</ul>
        
        <div class='mainbody'>
            <img src='css/body.png'>
        </div>
        
        <div class='feature'>
            <p class='b'>Features</p>
            <div class='imges'>
                <table border='0'>
                    <tr>
                        
                        <td><img src='css/addmoney.png' width='400' height='260' style='position:absolute; left:150px;top:550px; border-radius:15%'></td>
                        <td><img src='css/trackexp.png' width='400' height='260' style='position:absolute; left:580px;top:550px;border-radius:15%'></td>
                        <td><img src='css/waletstat.png' width='400' height='260' style='position:absolute; left:1010px;top:550px;border-radius:15%'></td>
                </tr>
                </table>
                <br><br>
            </div>
               
        </div>
        <div class="footer">
  <p>RV College of Engineering</p>
</div>
    </body>
</html>
