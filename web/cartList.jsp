<%-- 
    Document   : cartList
    Created on : 23 Mar, 2017, 9:38:27 AM
    Author     : aborn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.Product,classes.ProductList"
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta  name="viewport" content="width=device-width, initial-scale=1">
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <title>Confirmation</title>
    </head>
    <body>
        <% String p= request.getParameter("pname");
           int q = Integer.parseInt(request.getParameter("price"));
        String type = request.getParameter("ptype");
        String image = request.getParameter("pimage");
        int r = Integer.parseInt(request.getParameter("qty"));
        int s = Integer.parseInt(request.getParameter("pid"));
        ProductList pList = (ProductList)session.getAttribute("ProductList");
        //session.setAttribute("ProductList",pList);
        Product pd = new Product(p,type,image,q,r,s);
        pList.getProducts().add(pd);
       
        
        %>
        <div class="container">
            <h1>Cart Status</h1>
            <div class="row">
                
                <div class="col-xs-12 col-md-6 col-md-offset-3" style="border: 1px solid #2aabd2">
                    <br>
                    <p>Do you want to add item <strong><% out.print(p); %></strong> to the cart</p>
                    <p>Type : <% out.print(type); %></p>
                    <p>Product Id : 400<% request.getParameter("qty"); %></p>
                    <p>Price : <% out.print(q); %></p>
                    <% out.print(image); %>
                    <p>Number of Quantity: <% out.print(r); %></p><br><hr>
                    <p>Total Price : <% out.print(r); %> x <% out.print(q); %> =  ₹<%=pd.totalPprice() %>.00</p>
                    <form action="finalCart.jsp">
                        <input type="hidden" name="plist" value="<%=pList %>" >
                        <input type="hidden" name="product" value="<%=pd %>" >
                        <button class="btn btn-warning" name="foo" type="submit" value="decline">decline</button>
                        <button class="btn btn-primary" name="foo" type="submit" value="proceed">Proceed</button>
                    </form><br>
                </div>
            </div>            
        </div>
    
         <script src="bower_components/jquery/dist/jquery.min.js"></script>
         <!-- Include all compiled plugins (below), or include individual files as needed -->
         <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        
    </body>
</html>
