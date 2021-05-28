package my.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginCheck {
	public static final int OK = 0;
	public static final int NOT_ID = 1;
	public static final int NOT_PW = 2;
	public static final int ERROR = -1;
	
	private String id;
	private String passwd;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	
	public int loginCheck() {
		Connection con =null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bigdata3", "bigdata3");
			String sql = "select passwd from member where id =?";
			ps = con.prepareStatement(sql);
			ps.setNString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbPass = rs.getNString(1);
				if(dbPass.equals(passwd)) {
					return OK;
				}else {
					return NOT_PW;
				}
			}else {
				return NOT_ID;
			}
		}catch(Exception e) {
			e.getStackTrace();
			return ERROR;
		}finally {
			try {
				if(rs !=null) rs.close();
				if(ps !=null) ps.close();
				if(con !=null) con.close();
			}catch(SQLException e) {}
		}
	}
}
