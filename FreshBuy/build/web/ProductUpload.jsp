<%-- 
    Document   : ProductUpload
    Created on : Nov 20, 2017, 10:48:14 AM
    Author     : Rajeev
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
        <title>Product Upload</title>
        <link rel="stylesheet" href="Styling.css">
    </head>
    <body>
        <h1 align="center">Please upload the details of your product !!!</h1>
        <td align ="right"><h3><a1><a style="text-decoration: none" href="Login" >Logout</a></a1></h3></td>
        <div class="form">
        <div class="login-page">
         <form action="ProductUpload" method ="POST" enctype ="multipart/form-data" class ="product-page">
            <table align="center" >
                
                <tr><th> Name:</th><td> <input type="text" name ="pname" placeholder="Product Name" required></td></tr><tr></tr><tr></tr>
                <tr><th> Id: </th><td> <input type="text" name ="pid" placeholder="Product ID" required></td></tr><tr></tr><tr></tr>
                <tr><th> Description:  </th><td> <input type="text" name ="pdescription" placeholder="Description" required></td></tr><tr></tr><tr></tr>
                <tr><th> Price: </th><td> <input type="text" name ="pprice"placeholder="Product Price"  required></td></tr><tr></tr><tr></tr>
                <tr><th> Image: </th><td> <input type="file" name ="ppicture" required ></td></tr><tr></tr><tr></tr>
                <tr ><td colspan = "1.5"><button>Upload</button> </td></tr>
                
            </table>
        </div></div>
        </form>
    </body>
</html>
