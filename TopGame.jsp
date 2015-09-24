<%-- 
    Document   : Top
    Created on : Sep 17, 2015, 8:25:24 PM
    Author     : thanos
--%>
<%@page import="java.sql.*"%>
<%Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
   
    </head>
    <body>
        <%!
        public class BestGames {  
     Connection conn=null;
            PreparedStatement selectGames=null;
            ResultSet rs=null;
            public BestGames() throws ClassNotFoundException{
                
                try{
                    Class.forName("com.mysql.jdbc.Driver"); 
                    conn=DriverManager.getConnection("jdbc:mysql://Localhost:3306/progamer","root","");
                    
                    selectGames = conn.prepareStatement("SELECT Gametitle, Rating FROM games");
                    
                    
                }catch(SQLException e){
                    e.printStackTrace();
                }
            }
            public ResultSet BestGames(){
                try{
                    rs=selectGames.executeQuery();
                }catch(SQLException e){
                    e.printStackTrace();
                }
                return rs;
            }
            
}  
        %>
        <%
                BestGames bg= new BestGames();
                ResultSet rsg=bg.BestGames();
        %>
        <style>
        body{
            background-image: url("MainPage.png");
             -webkit-background-size: cover;
              -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                height: 100%;
                margin: 0;
                background-repeat: no-repeat;
                background-attachment: fixed;
        }
        div.centered {
           position: fixed;
         top: 50%;
         left: 50%;
        /* bring your own prefixes */
            transform: translate(-50%, -50%);
                }
                
                 div.center {
                   // position: fixed;
                    // top: 50%;
                     left: 40%;
                     min-width: 450px;
                    position: fixed;
                    right: 35%;
                    top: 10%;
                   
                    //transform: translate(-50%, -50%);
                }
table.hovertable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.hovertable th {
	background-color:#c3dde0;
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
table.hovertable tr {
	background-color:#d4e3e5;
}
table.hovertable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #a9c6c9;
}
h2{
	font-size:20px;
	//padding:0px 0px 15px 0px;
	
}
    </style>
     <div class="centered">
      

    <table border="5" class="hovertable">
        <thead>
            
                     
                 <th><h1>Game Title</h1></th><th><h2>Rating</h2></th> 
                 </tr>
             </thead>
        <tbody>
           
            <%while (rsg.next()) { %>
            <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                <td><h3><%=rsg.getString("Gametitle") %></h3></td>
                <td><h3><%=rsg.getString("Rating") %></h3></td>
            </tr>
            <% } %>
            <tr onmouseover="this.style.backgroundColor='#ffff66';" onmouseout="this.style.backgroundColor='#d4e3e5';">
                <td><h2><a href="MainPage.html" rel="login" class="linkform">Return to  Main Page</a></h2></td>
             </tr>
        </tbody>
    </table>
        
     </div>
    </body>
</html>
