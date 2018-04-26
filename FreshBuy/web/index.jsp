<%-- 
    Document   : index
    Created on : Oct 30, 2017, 3:19:12 PM
    Author     : Rajeev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>FreshBuy.com</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" href="Styling.css">
        <script type = "text/javascript" >
   function preventBack(){window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null;};
</script>
    </head>
    
    <body>
        
        <div><h1 align ="center">Welcome to FreshBuy</h1></div>
        <div class ="login-page">
        <div class ="form">
        <form action="Login" method ="POST" class ="register-form" >
            ${message}
            <table align="center" >
                <tr><th> Username:</th>
                    <td> <input type="text" name ="txtusername" placeholder = "Username" required></td></tr>
                <tr><th> Password:</th><td> <input type="password" name ="txtpassword" placeholder = "Password" required></td></tr>
                <tr><td colspan = "2" align = "right"><button>Login</button> </td></tr>
                
            </table>
        </form>
       
        <form action="Register.jsp" method ="POST" class ="register-form">
            <table align="center" >
                <tr><td><label> Not a member yet?</label></td>
                    <td align="right"><button>Register</button></td></tr>
            </table>
        </form>
            </div>
            </div>
            
    </body></body1>
   
</html>
