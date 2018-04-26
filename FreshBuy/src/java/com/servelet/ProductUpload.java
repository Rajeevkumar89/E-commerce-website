/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servelet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Rajeev
 */
//@WebServlet("/ProductUpload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 16,
        maxRequestSize  = 1024 * 1024 * 100)
public class ProductUpload extends HttpServlet {

    private static final long serialVersionUID = 1L;

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        String _productname = request.getParameter("pname");
        int _productID = Integer.parseInt(request.getParameter("pid"));
        String _productdescription = request.getParameter("pdescription");
        int _productPrice = Integer.parseInt(request.getParameter("pprice"));
        
        Part _filePart = request.getPart("ppicture");
        String _fileName = extractFileName(_filePart);      
        String _filePath =  "C:\\Users\\USER\\Documents\\NetBeansProjects\\FreshBuy\\web\\images" + File.separator + _fileName;
      
        _filePart.write(_filePath +File.separator );
      
                  try{
                 
                       DBConnect connect = new DBConnect();
                       int _fileUpload = connect.fileUpload(_productname,_productID,_productdescription,_productPrice,_filePath,_fileName);
                       
                       if(_fileUpload == 1)
                       {
                           out.println("File Uploaded Sucessfully.....");
                           response.sendRedirect("index.jsp");
                        }
                       else 
                       {
                           out.println("File Uploading Failed  " + "!!!!!");
                       }
                       
                      }
                      catch(IOException p){out.println (p);}          
     }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String [] items = contentDisp.split(";");
        for(String s :items)
        {
            if (s.trim().startsWith("filename")){
                return s.substring(s.indexOf("=")+2, s.length()-1);
                
            }
        }
return " ";
    }
 

}