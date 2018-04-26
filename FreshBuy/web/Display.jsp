<%-- 
    Document   : Display
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
        <title>Product Page</title>
        <link rel="stylesheet" href="Styling.css">
        <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null;};
</script>
    </head>
    <body>
       
        <table style="width:80%">
           <col width="200">
           <col width="200">
           <col width="200">
           <col width="200">
            <tr>
                <td align="left" size = "12"> <h1>Welcome ${sessionScope.txtusername} !</h1></td>
                <td align ="Center"><h3><a1><a style="text-decoration: none" href ="CartDetails.jsp?emailid='${sessionScope.UseremailID}'">Go to Cart</a></a1></h3></td>
                <td align ="Center"><a1><a style="text-decoration: none" href="OrderDetails.jsp?emailid='${sessionScope.UseremailID}'">Order Details</a></a1></td>
                <td align ="right"><h3><a1><a style="text-decoration: none" href="Login" >Logout</a></a1></h3></td>
            </tr>
        </table>
        <%
            try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/freshbuy","root","root");
        Statement st = con.createStatement();
        String ID  = request.getParameter("ID");
        ResultSet rs =  st.executeQuery("select Product_id,Product_name,Product_description,Product_price,Pic_name from product_information where Product_id= "+ID);
       %><table border ="1" style="width:80%" >  
          <col width="400">
           <col width="300">
           <col width="300">
           <col width="200">
           <col width="200">
           <th> Product </th>
           <th> Product Name </th>
           <th> Product Description </th>
           <th> Product Price </th>
           <%
        while(rs.next())
        {
            int Pid = rs.getInt("Product_id");
            String Pname = rs.getString("Product_name");
            String Pdesc = rs.getString("Product_description");
            int Pprice = rs.getInt("Product_price");
            String Ppath = rs.getString("Pic_name");
            %>
            <tr>
            <td align ="Center"><img src ="images/<%=Ppath%>" width ="400" height = "400"/></td>
            <td align ="Center"><%=Pname%></td>
            <td align ="Center"><%=Pdesc%></td>
            <td align ="Center">$<%=Pprice%></td>
            
            <td align ="Center"><a1><a style="text-decoration: none" href ="AddtoCart?ID=<%=Pid%>&action=Add&emailid=${sessionScope.UseremailID}">Add to Cart</a></a1></td>
        </tr><%
        }
        %></table>  <%
            }  
            catch(Exception ex){}
        %>
        <h3><a1><a style="text-decoration: none" href ="welcome.jsp">Go Back</a></a1></h3>
</body>
   
</html>
