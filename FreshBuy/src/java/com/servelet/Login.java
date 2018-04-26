
package com.servelet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Rajeev
 */
public class Login extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String _username = request.getParameter("txtusername");
            String _password = request.getParameter("txtpassword");
            
            try{
              if(_username!= null) 
              {
                  HttpSession session = request.getSession();
                  
                  DBConnect connect = new DBConnect();
                 String EmailID = connect.getLoginDetails(_username,_password);
                  if(EmailID !=null){
                      if(EmailID.equals("Admin"))
                      {
                        response.sendRedirect("ProductUpload.jsp");
                       }
                      else{                
                      session.setAttribute("txtusername",_username); 
                      session.setAttribute("UseremailID",EmailID);
                      response.sendRedirect("welcome.jsp");
                       }
                  }
                  else
                  {
                      request.setAttribute("message", "Invalid Username/Password !!!");
                      request.getRequestDispatcher("index.jsp").forward(request, response);
                  }
              }
              
            }
            catch (IOException E1){
                out.println("Error:" + E1.getMessage());
            }
            
        }
    }    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("_username"); 
        response.sendRedirect("index.jsp");
    }
}
    
   