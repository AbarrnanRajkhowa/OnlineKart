<%-- 
    Document   : index
    Created on : 22 Mar, 2017, 4:12:26 PM
    Author     : aborn
--%>

<%@page import="classes.ProductList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*" %>

<% Class.forName("org.apache.derby.jdbc.ClientDriver"); %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta  name="viewport" content="width=device-width, initial-scale=1">
        <title>Online kart</title>
        <!-- Bootstrap -->
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <% ProductList pList = new ProductList();
            session.setAttribute("ProductList",pList); %>
    <body style="background-color: graytext;color : whitesmoke">
        
        <div class="container">
             <h1 id="portfolio">Online Shopping</h1>
            <div class="row">
                 
          <div class="col-xs-4 col-xs-offset-8 col-md-4 col-md-offset-8 text-center">
              <form action="newjsp.jsp">
                <button type="submit" name="foo" value="proceed" style="color: white ; background-color: transparent"><h1><i class="fa fa-cart-arrow-down"></i> Cart</h1></button> 
              </form>
            </div>  
            </div>
    </div>
   
        
        <!-- Products -->
        <div class="container content">

        <div class="row">
           <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/OnlineKart", "Abarnan", "1234");

            Statement statement = connection.createStatement() ;
            ResultSet rs = 
                statement.executeQuery("select * from PRODUCTS") ; 
            
                
        %>
         <% while(rs.next()){ %>

        <div class="col-xs-12 col-md-4">
        <div class="thumbnail">
            <img class="img-responsive img-thumbnail" style="height: 170px;weidth:120px;" src="<%=rs.getString("P_IMAGE")%>">
        <div class="caption text-center">
            <p>Product id: <%=rs.getString("P_ID") %></p><br>
            <p>Product type: <%=rs.getString("P_TYPES") %></p><br>
            <p>Product name: <%=rs.getString("P_NAME") %></p><br>
            <p>Product price: <%=rs.getString("P_PRICE") %></p><br>
            <form action="cartList.jsp" >
                <input type="hidden" name="pname" value= "<%=rs.getString("P_NAME") %>" />
                <input type="hidden" name="price" value="<%=rs.getString("P_PRICE")%>"/>
                <input type="hidden" name="ptype" value="<%=rs.getString("P_TYPES")%>"/>
                <input type="hidden" name="pid" value="<%=rs.getString("P_ID")%>"/>
                <input type="hidden" name="pimage" value="<%=rs.getString("P_IMAGE")%>"/>
                 <input type="hidden" name="plist" value="<%=pList %>" >
                <input style="size: 3px" type="text" name="qty" value="1"/><br>
                <button class="btn btn-info btn-sm" type="submit" value="Add to cart">Add to Cart</button>
            </form>
                
            
        </div>
        </div>      
        </div>
                 <% } %>
        </div>
        </div>
        
        
    <script src="bower_components/jquery/dist/jquery.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    </body>
</html>
