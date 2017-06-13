/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author qiuyayun
 */
public class UpdateFee {
    
    //ServletContext s=this.getServletContext();
             String url ="jdbc:mysql://localhost:3306/Library";
             String username = "root" ;   
             String password = "pass";
             public UpdateFee(String userName){
                 try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection(url,username,password);
             PreparedStatement ps;
             ps=conn.prepareStatement("select * from borrowingBooks where userName=?");
             ps.setString(1, userName);

             ResultSet rs=ps.executeQuery();
             while(rs.next()){
             Date date=rs.getDate("borrow_date");
             
             Date date2=new Date(new java.util.Date().getTime());
             
             long days=(date.getTime()-date2.getTime())/ (1000 * 60 * 60 * 24);
             float money;
             if(days<30)
             money=0;
             else if(days<37)
             money=50;
             else
                 money=50+(days-30)*5;
             PreparedStatement ps2=conn.prepareStatement("update borrowingBooks set Fee=? where userName=?");
             ps2.setFloat(1, money);
             ps2.setString(2, userName);
             ps2.execute();
             //System.out.println(date2);
             }
             
             
             }catch(Exception e){
               System.out.println(e);
            }
         }
             
}

