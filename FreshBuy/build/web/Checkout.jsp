<%-- 
    Document   : Checkout
    Created on : Nov 25, 2017, 4:48:48 PM
    Author     : Rajeev
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link rel="stylesheet" href="Styling.css">
        <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
    </head>
    <body >
        
        <script>
              function myFunction() {
                alert("Payemt Successful !!! ");
                }
              function myFunction1() {
                alert("Card Removed Successfully !!! ");
                }
        </script>
        <%  
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/freshbuy","root","root");
        Statement st = con.createStatement();
        String ID  = request.getParameter("emailid");
        ResultSet rs =  st.executeQuery("select * from payment_info where email_id ="+ID);
       
        if(rs.next())
        {
            %><h1 align ="center"> You can chose from the cards below !!</h1><%
         rs.previous();
       %>
       <div class="body1">
        <table border ="1" style="width:80%" >  
           <col width="400">
           <col width="400">
           <col width="400">
           <col width="400">
           <col width="400">
           <col width="200">
           <col width="200">
           <th height ="50"> First Name </th>
           <th height ="50"> Last Name </th>
           <th height ="50"> Card Type</th>
           <th height ="50"> Card number </th>
           <th height ="50"> Expiry date </th>
           <%
        while(rs.next())
        {
            String Fname= rs.getString("First_Name");
            String Lname = rs.getString("Last_Name");
            String Ctype = rs.getString("Credit_Debit");
            String CNumber = rs.getString("Card_number");
            Date Edate = rs.getDate("Expiry_Date");
            
            %>
            <tr>
            <td align ="Center" height ="50"><%=Fname%></td>
            <td align ="Center" height ="50"><%=Lname%></td>
            <td align ="Center" height ="50"><%=Ctype%></td>
            <td align ="Center" height ="50"><%=CNumber%></td>       
            <td align ="Center" height ="50"><%=Edate%></td>  
            <td align ="Center" height ="50" >
                <button onclick ="myFunction()">
                    <a style="text-decoration: none" href = "Pay?CardNumber=<%=CNumber%>&email=${sessionScope.UseremailID}">  PAY  </a> 
                </button>
            </td>  
            <td align ="Center" height ="50" >
                <button onclick ="myFunction1()">
                    <a style="text-decoration: none" href = "DeleteCard?CardNumber=<%=CNumber%>&email=${sessionScope.UseremailID}">  DELETE  </a>
                </button> 
            </td>  
            
        </tr><%
        }
             %>
       </table><br><br><br><br><br>
              <table align = "center">  
                  <tr><a1><a href = "Checkout.jsp"> New Card ? </a><a1> </tr>
             </table>
       <br><br>
       <h3><a1><a style="text-decoration: none" href ="CartDetails.jsp?emailid='${sessionScope.UseremailID}'">Go to Cart</a></a1></h3>
       <br><br><br><br><br><br></div>
             <%
       } else {

    %>    
        
        <h1 align = "center">Please Enter your Card details</h1>
        <div class ="login-page">
        <div class ="form">
            
        <form action="Pay" method ="POST" class ="register-form">
            <table>
                <tr><th> First name: </th><td> <input type="text" name ="fname" placeholder="First Name" required></td></tr>
                <tr><th> Last Name </th><td> <input type="text" name ="lname" placeholder="Last name" required></td></tr>
                <tr><th> Card Type</th><td>
                        
                        <fieldset id="CardType"> 
                            <input type="radio" name ="card" value ="Credit">Credit
                            <br>
                            <input type="radio" name ="card" value ="Debit">Debit
                        </fieldset></td></tr> 
               
                <tr><th> Card Number</th><td> <input type="text" name ="CNumber" placeholder = "Card Number" required></td></tr>
                <tr><th> Expiry </th><td> <input type="Date" name ="date" ></td></tr>
                <tr><th> CVV </th><td> <input type="text" name ="cvv" placeholder="cvv"  required></td></tr>
                <tr><th></th><td hidden><input type="text" name ="email" value="${sessionScope.UseremailID}"></td></tr>
                <tr ><td colspan = "2" align = "right"><button onclick ="myFunction()">Pay</button> </td></tr>
                
            </table>
        </form>
        </div>
        </div>
                <h3><a1><a style="text-decoration: none" href ="Checkout.jsp?emailid='${sessionScope.UseremailID}'">Go Back</a></a1></h3>
      <% }

    }
            catch(Exception ex){}

%>
    </body>
</html>

