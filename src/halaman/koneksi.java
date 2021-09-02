package halaman;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class koneksi {
    public static void main(String[] args) {

 Connection connect = null;
 String url = "jdbc:mariadb://localhost:3310/uas_19650079";
 String user = "root";
 String password = "12345678";

 try{
     Class.forName("org.mariadb.jdbc.Driver");
     connect = DriverManager.getConnection(url,user,password);
     if(connect != null){
         System.out.println("KONEKSI KE DATABASE BERHASIL.");
     }else{
         System.out.println("KONEKSI GAGAL.");
     }
 }catch (Exception e){
     e.printStackTrace();
 }
 
 try{
     if(connect != null){
         connect.close();
     }
 }catch (SQLException e){
     e.printStackTrace();
 }

 }
}
