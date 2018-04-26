/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rajeev
 */
public class Pay extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();     
        response.setContentType("text/html;charset=UTF-8");
        String _CardNumber =request.getParameter("CardNumber");
        
              
        String _fname =request.getParameter("fname");
        String _lname =request.getParameter("lname");
        String _ctype =request.getParameter("card");
        String _cnumber =request.getParameter("CNumber");
        Date _Edate =Date.valueOf(request.getParameter("date"));
        int _cvv =Integer.parseInt(request.getParameter("cvv"));
        String _email = request.getParameter("email");
        
        DBConnect Payment = new DBConnect();
        
        int paid = Payment.CardDetails(_fname,_lname,_ctype,_cnumber,_Edate,_cvv,_email);
        
        if(paid!=0)
        {
            response.sendRedirect("welcome.jsp");
        }
        else
            out.println("Payment Failed!!");
        }
       
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();     
        response.setContentType("text/html;charset=UTF-8");
        String _CardNumber =request.getParameter("CardNumber");
        String _email = request.getParameter("email");
            DBConnect Old_Payment = new DBConnect();
            int success = Old_Payment.Pay(_CardNumber,_email);
            
            if(success!=0)
                 response.sendRedirect("welcome.jsp");
            else
                out.println("Payment Failed!!");
    }
}

    
