package my.board2;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oreilly.servlet.MultipartRequest;

import my.db.ConnectionPoolBean;

public class Board2DataBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	private ConnectionPoolBean pool;
	

	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int insertBoard(MultipartRequest mr, String ip) throws SQLException {
		File file = mr.getFile("filename");
		long filesize = 0L;
		if(file !=null){
			filesize = file.length();
		}
		try {
			con = pool.getConnection();
			String sql = "insert into board2 values (board2_seq.nextval, "
					+ "?,?,?,?,sysdate,0,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,mr.getParameter("writer"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("subject"));
			ps.setString(4, mr.getParameter("passwd"));
			ps.setString(5, mr.getParameter("content"));
			ps.setString(6, ip);
			ps.setString(7, mr.getFilesystemName("filename"));
			ps.setInt(8, (int)filesize);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<Board2DBBean> listBoard() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from board2 order by num desc";  //num으로 내림차순 (새글이 맨위로)
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<Board2DBBean> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<Board2DBBean> makeList(ResultSet rs) throws SQLException {
		List<Board2DBBean> list = new ArrayList<>();
		while(rs.next()) {
			Board2DBBean dto = new Board2DBBean();
			dto.setNum(rs.getInt("num"));
			dto.setWriter(rs.getString("writer"));
			dto.setEmail(rs.getString("email"));
			dto.setSubject(rs.getString("subject"));
			dto.setPasswd(rs.getString("passwd"));
			dto.setReg_date(rs.getString("reg_date"));
			dto.setReadcount(rs.getInt("readcount"));
			dto.setContent(rs.getString("content"));
			dto.setIp(rs.getString("ip"));
			dto.setFilename(rs.getString("filename"));
			dto.setFilesize(rs.getInt("filesize"));
			list.add(dto);
		}
		return list;
	}
	protected boolean isPassword(int num, String passwd)throws SQLException{
		try {
			con = pool.getConnection();
			String sql = "select*from board2 where num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbPass = rs.getString("passwd");
				if(dbPass.contentEquals(passwd)) {
					return true;
				}
			}
			return false;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	public int deleteBoard(int num, String filename, String passwd) throws SQLException {
		try {
			if(!isPassword(num,passwd)) {
				return -1;
			}
			con = pool.getConnection();
			String sql = "delete from board2 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int updateBoard(MultipartRequest mr, String num) throws SQLException {
		try {
			if(!isPassword(Integer.parseInt(num),mr.getParameter("passwd"))) {
				return -1;
			}
			con = pool.getConnection();
			String sql = "update board2 set writer=?, email=?, subject=?, content=? ,filename=? where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, mr.getParameter("writer"));
			ps.setString(2, mr.getParameter("email"));
			ps.setString(3, mr.getParameter("subject"));
			ps.setString(4, mr.getParameter("content"));
			String filename = mr.getFilesystemName("filename");
				if(filename ==null) {
					filename = mr.getParameter("filename2");
				}
			ps.setString(5, filename);
			ps.setInt(6, Integer.parseInt(num));
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	protected void plusReadcount(int num)throws SQLException{
		try {
			con = pool.getConnection();
			String sql = "update board2 set readcount = readcount+1 where num=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	public Board2DBBean getBoard(int num, String mode) throws SQLException {
		try {
			if(mode.equals("content")) {
				plusReadcount(num);
			}
			con = pool.getConnection();
			String sql = "select * from board2 where num = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			List<Board2DBBean> list = makeList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
}
