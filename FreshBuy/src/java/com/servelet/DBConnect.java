
package com.servelet;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.*;

/**
 *
 * @author Rajeev
 */
public class DBConnect {
    
    public Connection con;
    public Statement se;
    public ResultSet rs;
    
        public DBConnect(){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freshbuy","root","root");
                se= con.createStatement();
            }
            catch(ClassNotFoundException | SQLException ex){
                System.out.println("Error"+ ex);
            }
        }
  
    public String getLoginDetails(String Username,String Password){
        try{
            String loginDetails = "select User_Password,email_id,Admin_Rights from customer_information where user_name = '"+ Username +"'";
            rs=se.executeQuery(loginDetails);
            while(rs.next()){
              String user_Password = rs.getString("User_Password");
              String user_email = rs.getString("email_id");
              String Admin = rs.getString("Admin_Rights");
              if (Password.equals(user_Password)&& Admin == null)
              { 
                return user_email;
              } 
              if (Password.equals(user_Password) && Admin != null )
              { 
                return Admin;
              } 
            }
                System.out.println("Username not found");
                return null;
                       
        }
        catch(SQLException xe){
            System.out.println("Error" + xe);
        }
        return null;
    }
    
   // Code to register User into the database
    
    public int registrationDetails(String Username,String Password ,String firstName,String lastName, String emailID, String phoneNumber,String address){
        try{
            PreparedStatement ps = con.prepareStatement("Insert into customer_information values (?,?,?,?,?,?,?,?)");
            ps.setString(1, Username);
            ps.setString(2, Password);
            ps.setString(3, firstName);
            ps.setString(4, lastName);
            ps.setString(5,emailID);
            ps.setString(6,phoneNumber);
            ps.setString(7, address);
            ps.setString(8,null);
            int returntype=ps.executeUpdate();
            return (returntype == 1) ? 1 : 0;
            
        }
            catch( SQLException ec){ ec.printStackTrace();
                    } 
        return 0;
    }
   
    public int fileUpload(String _productname,int _productID,String _productdescription,int _productPrice,String _filePath,String _fileName){
        try{
            PreparedStatement ps = con.prepareStatement("Insert into product_information values (?,?,?,?,?,?)");
            ps.setInt(1, _productID);
            ps.setString(2, _productname);
            ps.setString(3, _productdescription);
            ps.setInt(4, _productPrice);
            ps.setString(5,_filePath);
            ps.setString(6, _fileName);
            int returntype=ps.executeUpdate();
            return (returntype == 1) ? 1 : 0;
            
        }
            catch( SQLException ec){ec.printStackTrace();
                    } 
        return 0;
} 
    public int AddProduct(String id,String Email){
         try{
             int Unit=0;
             String Pid=null;
             String quantity = "select * from cart_details where email_id = '"+ Email +"' and P_ID =" +id;
            rs=se.executeQuery(quantity);
            while(rs.next()){
               Unit = rs.getInt("Units");
               Pid= rs.getString("P_ID");
            //  String E_ID= rs.getString("email_id");
            }        
            if(Unit==0 && Pid ==null)
            {
                Unit = 1;
                PreparedStatement ps = con.prepareStatement("Insert into cart_details values (?,?,?)" );
                ps.setString(1, id);
                ps.setString(2, Email);
                ps.setInt(3, Unit);
                int returntype=ps.executeUpdate();
                return (returntype == 1) ? 1 : 0;
            }
            if(Unit!=0 && Pid !=null)
            {
                Unit = Unit+1;
                PreparedStatement up;
                up = con.prepareStatement("update cart_details set Units = ? where email_id ='"
                         +Email+"' and P_ID="+Pid );
                up.setInt(1,Unit);
                int update=up.executeUpdate();
                return (update == 1) ? 1 : 0;
            }          
        }
        
        catch(SQLException Ap){}
        return 0;
    }
    public int DeleteProduct(String id,String Email){
         try{
             int Unit=0;
             String Pid=null;
             String quantity = "select Units,P_ID from cart_details where email_id = '"+ Email +"' and P_ID =" +id;
            rs=se.executeQuery(quantity);
            while(rs.next()){
               Unit = rs.getInt("Units");
               Pid = rs.getString("P_ID");
              
            }        
            
            if(Unit!=0)
            {
                Unit = Unit-1;
                if(Unit==0)
                {
                    String deleted = "delete from cart_details where Units = 1 and email_id ='"+Email+"' and P_ID ='"+Pid+"'";
                    se.executeUpdate(deleted);
                    return 1;
                    
                }
                else{                  
                    PreparedStatement up;
                    up = con.prepareStatement("update cart_details set Units = ? where email_id ='"
                             +Email+"' and P_ID="+Pid );
                    up.setInt(1,Unit);
                    int update=up.executeUpdate();
                    return (update == 1) ? 1 : 0;
                }
            }          
        }
        
        catch(SQLException Ap){}
        return 0;
    }
    
    public int CardDetails(String _fname,String _lname,String _ctype, String _cnumber, Date _Edate, int _cvv, String _email ){
        
        try{
            PreparedStatement ps = con.prepareStatement("Insert into payment_info values (?,?,?,?,?,?,?)");
            ps.setString(1, _fname);
            ps.setString(2, _lname);
            ps.setString(3, _ctype);
            ps.setString(4, _cnumber);
            ps.setDate(5, _Edate);
            ps.setInt(6, _cvv);
            ps.setString(7, _email);
            ps.executeUpdate();
            int returntype= Pay(_cnumber,_email);
            return (returntype == 1) ? 1 : 0;
            
        }
            catch( SQLException ec){          
                    } 
        return 0;
    }
    
    public int RemoveCard(String _Card_number)
    {
        try{
              if(_Card_number!=null)
                {
                    String deleted = "delete from payment_info where Card_number= "+_Card_number;
                    se.executeUpdate(deleted);
                    return 1;
                }        
         }
        catch (SQLException ex){} 
        return 0;        
    }
    
    public int Pay(String _CardNumber,String EmailID)
    {
        try{
       String update= "select Product_id,Product_name,Units,Product_price from product_information,cart_details where P_ID = Product_id and email_id ='"+EmailID+"'";
                
          rs=se.executeQuery(update);
          while(rs.next())
            {
              String Product_id = rs.getString("Product_id");
              String Product_name = rs.getString("Product_name");
              String Units = rs.getString("Units");
              String Product_price = rs.getString("Product_price");
              
            PreparedStatement ps = con.prepareStatement("Insert into order_details values (?,?,?,?,?,?)");
            ps.setString(1, Product_id);
            ps.setString(2, Product_name);
            ps.setString(3, Product_price);
            ps.setString(4, Units);
            ps.setString(5, _CardNumber);
            ps.setString(6, EmailID);       
            ps.executeUpdate();
   
           }
            String _Delete= "delete from cart_details where email_id ='"+EmailID+"'"; 
            se.executeUpdate(_Delete);
            return 1;
       } catch(SQLException ep){ep.printStackTrace();}
           return 0; 
       }
    }