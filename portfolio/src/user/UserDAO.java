package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserDAO {
	Connection conn = null;
	Statement stmt = null;

	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pf?characterEncoding=utf8", "root",
					"1177mi");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void input(UserDTO dto) {
		connect();

		try {
			stmt = conn.createStatement();
			String cmd = String.format(
					"insert into user values('%s','%s','%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s');",
					dto.getId(), dto.getPassword(), dto.getName(), dto.getSex(), dto.getBirth(), dto.getNumber(),
					dto.getEmail(), dto.getPostcode(), dto.getAddress(), dto.getSend_mail(), dto.getSend_text());

			stmt.executeUpdate(cmd);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public boolean checkId(String id) {
		boolean chk = false;
		connect();
		
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from pf.user where id='" + id + "';");
			
			if(rs.next()) {
				chk = true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return chk;
	}
}
