<%-- 
    Document   : OrderDetails
    Created on : Nov 26, 2017, 11:22:08 PM
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
        <title>Order Details</title>
        <link rel="stylesheet" href="Styling.css">
        <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null;};
</script>
    </head>
    <body style="background-color:whitesmoke">  
    <table style="width:80%">
           <col width="200">
           <col width="200">
            <tr>
                <td align="left" size = "12"> <h1>Welcome ${sessionScope.txtusername} !</h1></td>
                <td align ="right"><h3><a1><a style="text-decoration: none" href="Login" >Logout</a></a1></h3></td>
            </tr>
        </table>
        <%
            
            try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/freshbuy","root","root");
        Statement st = con.createStatement();
        String ID  = request.getParameter("emailid");
        ResultSet rs =  st.executeQuery("select Product_Name, Product_Price, Units, Card_number "
                + "from order_details where email_id ="+ID);     
        if(!rs.next())
        {
            
            %>
        <h1> No Orders Yet !!!</h1>
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
           <th height="100"> Product Price </th>
           <th height="100"> Units </th>
           <th height="100"> Card_number </th>
           <%
        while(rs.next())
        {
            String Pname = rs.getString("Product_name");
            String Pprice = rs.getString("Product_price");
            String Punits = rs.getString("Units");
            String PCard = rs.getString("Card_number");
           
            %>
            <tr>
            <td align ="Center" height="70"><%=Pname%></td>
            <td align ="Center" height="70">$<%=Pprice%></td>
            <td align ="Center" height="70"><%=Punits%></td>
            <td align ="Center" height="70"><%=PCard%></td>       
        </tr><%
        }
        %></table> 
        <br><br><br>
        <%
            } 
    }
               catch(Exception ex){}
%>
        
<h3><a1><a style="text-decoration: none" href ="welcome.jsp">Go Back</a></a1></h3>
</body>
   
</html>

