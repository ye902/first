package db;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DBInit {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager
				       .getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF-8", "root","root");
		FileInputStream fis = new FileInputStream("src/sql.txt");   
		InputStreamReader isr = new InputStreamReader(fis, "UTF-8");
		BufferedReader br=new BufferedReader(isr);
		String line=br.readLine();
		String sql="";
		while(line!=null){
			if(line.endsWith(";")){
				sql+=line;
				System.out.println(sql);
				Statement stmt=conn.createStatement();
				stmt.execute(sql);
				stmt.close();
				sql="";
			}else{
				sql+=line;
			}
			line=br.readLine();
		}
		conn.close();
		br.close();
	}

}
