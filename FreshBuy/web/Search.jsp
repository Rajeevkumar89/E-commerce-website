<%-- 
    Document   : welcome
    Created on : Nov 1, 2017, 8:38:37 PM
    Author     : Rajeev
--%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link rel="stylesheet" href="Styling.css">
        
        <script type = "text/javascript" >
            function preventBack(){window.history.forward();}
            setTimeout("preventBack()", 0);
            window.onunload=function(){null;};
        </script>
    </head>
    
    <body>
    <div class ="form">
    <table style="width:85%">
    <col width="200">
    <col width="200">
    <col width="200">   
    <tr>
    <div><td align="left" size = "12"> <h2>Welcome ${sessionScope.txtusername}!</h2></td>
    </div>
        <td align ="Center"><a1><a style="text-decoration: none" href ="CartDetails.jsp?emailid='${sessionScope.UseremailID}'">Go to Cart</a></a1></td>
        <td align ="right"><a1><a style="text-decoration: none" href="Login" >Logout</a></a1></td>
    </tr>
    </table>
                  
    <%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/freshbuy","root","root");
        Statement st = con.createStatement();
        String Pname1= request.getParameter("prouctName");
        ResultSet rs =  st.executeQuery("select Product_id,Product_name,Product_description,Product_price,Product_pic_path,Pic_name "
                + "from product_information "
                + "where Product_name like '%"+Pname1+"%'");
       %>  
       <table border ="1" style="width:90%" >  
           <col width="100">
           <col width="200">
           <col width="200">
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
            <td align ="Center"><a href="Display.jsp?ID=<%=Pid%>"><img src ="images/<%=Ppath%>" width ="250" height = "150"/></a></td>
            <td align ="Center"><%=Pname%></td>
            <td align ="Center"><%=Pdesc%></td>
            <td align ="Center">$<%=Pprice%></td>
            
            <td align ="Center"><button onclick ="myFunction()"><a1><a style="text-decoration: none" href ="AddtoCart?ID=<%=Pid%>&action=Add&emailid=${sessionScope.UseremailID}">Add to Cart</a></a1></button></td>
        </tr><%
        }
        %></table>  <%
            }  
            catch(Exception ex){}
        %>
        
        <h3><a1><a style="text-decoration: none" href ="welcome.jsp">Go Back</a></a1></h3>
    </body>
    </div>
     </div>
</html>
