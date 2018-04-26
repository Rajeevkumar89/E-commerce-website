/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servelet;


import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author USER
 */
public class DeleteCard extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
      protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");
       String _CardNumber =request.getParameter("CardNumber");
       String email = request.getParameter("email");
       DBConnect RemoveCard  = new DBConnect();
        int Delete = RemoveCard.RemoveCard(_CardNumber);
        {
            if(Delete==1)
            {
               response.sendRedirect("Checkout.jsp?emailid='"+email+"'");
            }
        }
        
    }


}
