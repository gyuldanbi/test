package test;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {
	public Connection testA() throws Exception {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","1177mi");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
