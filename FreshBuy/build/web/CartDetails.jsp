<%-- 
    Document   : Cart Details
    Created on : Nov 23, 2017, 3:23:10 AM
    Author     : Rajeev
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Details</title>
        <link rel="stylesheet" href="Styling.css">
        <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null;};
</script>
    </head>
    

<script>

function myFunction() {
alert("1 item removed ");
}
</script>
    <body style="background-color:whitesmoke">
       
        <table style="width:80%">
           <col width="200">
           <col width="200">
           <col width="200">
            <tr>
                <td align="left" size = "12"> <h1>Welcome ${sessionScope.txtusername} !</h1></td>
                <td align ="Center"><a1><a style="text-decoration: none" href="OrderDetails.jsp?emailid='${sessionScope.UseremailID}'">Order Details</a></a1></td>
                <td align ="right"><h3><a1><a style="text-decoration: none" href="Login" >Logout</a></a1></h3></td>
            </tr>
        </table>
        <%
            
            try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/freshbuy","root","root");
        Statement st = con.createStatement();
        String ID  = request.getParameter("emailid");
        ResultSet rs =  st.executeQuery("select Product_id,Product_name,Units,Product_price,Units*Product_price "
                + "from product_information,cart_details "
                + "where P_ID = Product_id "
                + "and email_id ="+ID);
        int Tcost = 0;
        
        if(!rs.next())
        {
            
            %>
        <h1> Your Cart is Empty!!!</h1>
            <%
         }
        else
        { rs.previous();
       %><table border ="1" style="width:80%"  >  
           <col width="400" >
           <col width="400" >
           <col width="400">
           <col width="400" >
           <col width="200" >
           <th height="100"> Product Name</th>
           <th height="100"> Units </th>
           <th height="100"> Product Price </th>
           <th height="100"> Cost </th>
           <%
        while(rs.next())
        {
            int Pid = rs.getInt("Product_id");
            String Pname = rs.getString("Product_name");
            String Pdesc = rs.getString("Units");
            int Pprice = rs.getInt("Product_price");
            int Ppath = rs.getInt("Units*Product_price");
           // String Tcost = rs.getString("sum(Units*Product_price)");
            Tcost = Tcost + Ppath;
            %>
            <tr>
            <td align ="Center" height="70"><%=Pname%></td>
            <td align ="Center" height="70"><%=Pdesc%></td>
            <td align ="Center" height="70">$<%=Pprice%></td>
            <td align ="Center" height="70">$<%=Ppath%></td>       
            <td align ="Center" height="70"><button onclick="myFunction()"><a style="text-decoration: none" href ="AddtoCart?ID=<%=Pid%>&action=Delete&emailid=${sessionScope.UseremailID}">Remove</a></button></td>
        </tr><%
        }
        %></table> 
        <br><br><br>
        <table>  
                 
            <table border ="1" style="width:80%" >  
            <col width="400" >
            <col width="400">
           
            <th> Total Cost</th>
            <tr></tr>
           <tr>
            <td align ="Center">$<%=Tcost%></td>
            <td align ="Center"><h3><a1><a style="text-decoration: none" href ="Checkout.jsp?emailid='${sessionScope.UseremailID}'">Checkout</a></a1></h3></td>
           </tr>
        <table><%
            } 
    }
   
            catch(Exception ex){}

%>
        
<h3><a1><a style="text-decoration: none" href ="welcome.jsp">Go Back</a></a1></h3>
</body>
   
</html>
