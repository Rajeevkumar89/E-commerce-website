<%-- 
    Document   : Register
    Created on : Nov 1, 2017, 9:10:30 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="Styling.css">
        <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null;};
</script>
    </head>
     
    <body>
        <script type="text/javascript">
 function myFunction() {
alert("Registration Sucessful !!! Please click login button to Login. ");
}
        </script>
        <h1 align = "center">Please Enter your details</h1>
        
        <div class ="login-page">
        <div class ="form">
        <form action="Register" method ="POST" class ="register-form">
            <table>
                <tr><th> Username:</th><td> <input type="text" name ="txtusername" placeholder = "Username" required></td></tr>
                <tr><th> Password:</th><td> <input type="password" name ="txtpassword" placeholder = "Password" required></td></tr>
                <tr><th> First Name: </th><td> <input type="text" name ="textfirstname" placeholder="First Name" required></td></tr>
                <tr><th> Last Name: </th><td> <input type="text" name ="textlastname" placeholder="Last Name" required></td></tr>
                <tr><th> Email ID: </th><td> <input type="email" name ="txtemail" placeholder="Email ID" required></td></tr>
                <tr><th> Phone: </th><td> <input type="text" name ="phnumber" placeholder="Phone Number" required></td></tr>
                <tr><th> Address: </th><td> <input type="text" name ="txtaddress" placeholder="Address" required></td></tr>              
                <tr ><td colspan = "2" align = "right"><button onclick="myFunction()">Register</button> </td></tr>
                
            </table>
        </form>
        </div>
        </div>
    <h1 align ="center"> <a1><a style="text-decoration: none" align ="center" href="index.jsp"> Login </a></a1></h1> 
    </body>
</html>
