<%-- 
    Document   : finalCart
    Created on : 28 Mar, 2017, 2:50:57 AM
    Author     : aborn
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.Product,classes.ProductList"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta  name="viewport" content="width=device-width, initial-scale=1">
        <title>Online kart</title>
        <!-- Bootstrap -->
        <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <title>Cart List</title>
    </head>
    <body>
        <div class="container">
            <h1>The Cart List</h1>
            <div class="row" style="border:1px solid #3e8f3e">
                <div class="col-xs-12 col-md-10 col-md-offset-1">
                    
                    <% String s = request.getParameter("foo");
                        if(s.equals("decline")){
                            response.sendRedirect("index.jsp");  
                        }else {
                           ProductList pl = (ProductList)session.getAttribute("ProductList");
                           Product p = (Product) request.getAttribute("product");
                           //pl.getProducts().add(p);

                           ArrayList<Product> prod = pl.getProducts();
                          int a =prod.size();
                          if(a==0){
                              out.print("Your Cart is empty");
                          }
                          
                          %> 
                          <ul class="media-list">
                          <h3 style="margin-left:75%;">Total Item : <% out.print(a);%></h3>
                          
                          <%
                                int grandtotal = 0;
                          for(int i=0;i< a ;i++){ 
                              String name = prod.get(i).getName();
                              String type = prod.get(i).getType();
                              String image = prod.get(i).getImage();
                              int price = prod.get(i).getPrice();
                              int qty = prod.get(i).getQty();
                              int total =prod.get(i).totalPprice();
                              
                              grandtotal+=total;
                               %>
                               
                              <li class="media">
                                  <div class="media-left media-middle">
                                      
                                      <a href="#">
                                          <img style="height:70px;width: 60px;" class="media-object img-thumbnail"
                                               src="<%out.print(image);%>">
                                      </a>  
                                  </div>
                                      <div class="media-body" style="padding-left: 100px;">
                                      <h2 class="media-heading"><% out.print(name); %></h2>
                                      <p>Product Type : <% out.print(type);%></p>
                                      <p>Product Quantity : <% out.print(qty);%><span style="margin-left: 45%;"><% out.print(qty); %> x <% out.print(price);%></span>
                                        = ₹<% out.print(total); %>.00</p>
                                      <p>Product Price : <% out.print(price); %></p>
                                  </div>
                              </li>

                           <% } %>
                           </ul><hr>
                    <p style="margin-left: 65%"><strong>Grand Total: ₹<% out.print(grandtotal); %>.00</strong></p>
                       <% } %>
                    
                </div>
            </div>
                       <div class="row" style="margin-bottom: 30px;">
                           <div class="col-xs-12 col-md-6 col-md-offset-6">
                               <form action="index.jsp">
                               <button type="submit" class="btn btn-block btn-info">Check Out</button>
                               </form>
                           </div>
                       </div>
        </div>
         <script src="bower_components/jquery/dist/jquery.min.js"></script>
         <!-- Include all compiled plugins (below), or include individual files as needed -->
         <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>        
    </body>
</html>
