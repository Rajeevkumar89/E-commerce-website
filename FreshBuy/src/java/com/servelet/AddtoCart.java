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
public class AddtoCart extends HttpServlet {

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
        
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        String ID  = request.getParameter("ID");
        String email = request.getParameter("emailid");
        if ("Add".equals(action))
        {
        DBConnect connect = new DBConnect();
        int Added = connect.AddProduct(ID,email);
                  if(Added == 1){
                      response.sendRedirect("welcome.jsp");
                      
                  }
                  else
                      out.println("Adding Failed");
        }
               
        if ("Delete".equals(action)) {
            DBConnect connect = new DBConnect();
            int Deleted = connect.DeleteProduct(ID,email);
            if(Deleted == 1){
                response.sendRedirect("CartDetails.jsp?emailid='"+email+"'");
            }
            else{
                request.setAttribute("Remove", "Cannot delete this item !");
                request.getRequestDispatcher("CartDetails.jsp?emailid='"+email+"'").forward(request, response);
                
            }
        } else out.print("Action not available!!");
    }
}

    


