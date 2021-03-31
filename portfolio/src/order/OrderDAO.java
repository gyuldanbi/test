package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class OrderDAO {
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

	public void input(OrderDTO dto) {
		connect();

		try {
			stmt = conn.createStatement();
			String cmd = String.format(
					"insert into pf.order(date, userId, isbn, cnt, price) values('%s', '%s', '%s', %d, %d);",
					dto.getDate(), dto.getUserId(), dto.getIsbn(), dto.getCnt(), dto.getPrice());

			stmt.executeUpdate(cmd);
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<OrderDTO> select(String userId) {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		connect();

		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from pf.order where userId='" + userId + "' order by date desc;");

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			while (rs.next()) {
				OrderDTO dto = new OrderDTO();
				String date = format.format(rs.getDate("date"));

				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setDate(date);
				dto.setUserId(userId);
				dto.setIsbn(rs.getString("isbn"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setPrice(rs.getInt("price"));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}
	
	public ArrayList<OrderDTO> select10(String id) {
		ArrayList<OrderDTO> list = new ArrayList<OrderDTO>();
		connect();
		
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from pf.order where userId='" + id + "' order by date desc limit 10;");

			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			while (rs.next()) {
				OrderDTO dto = new OrderDTO();
				String date = format.format(rs.getDate("date"));

				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setDate(date);
				dto.setUserId(id);
				dto.setIsbn(rs.getString("isbn"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setPrice(rs.getInt("price"));

				list.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

	public OrderDTO selectOne(int num) {
		OrderDTO dto = new OrderDTO();
		connect();

		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from pf.order where orderNum=" + num + ";");
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			while(rs.next()) {
				String date = format.format(rs.getDate("date"));
				
				dto.setOrderNum(rs.getInt("orderNum"));
				dto.setDate(date);
				dto.setUserId(rs.getString("userId"));
				dto.setIsbn(rs.getString("isbn"));
				dto.setCnt(rs.getInt("cnt"));
				dto.setPrice(rs.getInt("price"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return dto;
	}
}
