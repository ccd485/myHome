package my.book;

import java.sql.*;
import java.util.*;

public class BookDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	String url, user, pass;
	
	public BookDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		url = "jdbc:oracle:thin:@localhost:1521:xe";
		user = "bigdata3";
		pass = "bigdata3";
	}
	
	public int insertBook(BookDTO dto) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "insert into book values(?, ?, ? ,?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getBookname());
			ps.setString(2, dto.getWriter());
			ps.setString(3, dto.getPublisher());
			ps.setInt(4, dto.getPrice());
			java.util.Date date = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
			ps.setString(5, sdf.format(date));
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ArrayList<BookDTO> listBook() throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from book";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<BookDTO> list = makeArrayList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ArrayList<BookDTO> makeArrayList(ResultSet rs) throws SQLException {
		ArrayList<BookDTO> list = new ArrayList<>();
		while(rs.next()) {
			BookDTO dto = new BookDTO();
			dto.setBookname(rs.getString("bookname"));
			dto.setWriter(rs.getString("writer"));
			dto.setPublisher(rs.getString("publisher"));
			dto.setPrice(rs.getInt("price"));
			dto.setIndate(rs.getString("indate"));
			list.add(dto);
		}
		return list;
	}
	
	public int deleteBook(String bookname) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "delete from book where bookname=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, bookname);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
	
	public ArrayList<BookDTO> findBook(String search, String searchString) throws SQLException {
		try {
			con = DriverManager.getConnection(url, user, pass);
			String sql = "select * from book where " + search + " like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+searchString+"%");
			rs = ps.executeQuery();
			ArrayList<BookDTO> find = makeArrayList(rs);
			return find;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) con.close();
		}
	}
}







