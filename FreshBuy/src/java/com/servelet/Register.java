/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Rajeev
 */
public class Register extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String _username = request.getParameter("txtusername");
            String _password = request.getParameter("txtpassword");
            String _firstName = request.getParameter("textfirstname");
            String _lastName = request.getParameter("textlastname");
            String _emailID = request.getParameter("txtemail");
            String _phoneNumber = request.getParameter("phnumber");
            String _address = request.getParameter("txtaddress");
            try{
              if(_username!= null && _password!=null && _firstName!=null &&  _lastName!=null && _emailID!=null && _phoneNumber!=null &&  _address!=null ) 
              {
                  DBConnect connect = new DBConnect();
                 int registered = connect.registrationDetails(_username,_password,_firstName,_lastName,_emailID,_phoneNumber,_address);
                  if(registered == 1)
                  {
                      request.setAttribute("Registered", "Registration Sucessfull. Please Login to continue !!!");
                      request.getRequestDispatcher("Register.jsp").forward(request, response);
                  }
                      
                  else
                      out.println("Registration Failed !!! Please try again");
              }
              else 
                  out.print("Please provide all the details ");
            }
            catch (IOException E1){ E1.printStackTrace();
                out.println("Error:" + E1.getMessage());
            }
            
        }
    }    
}
