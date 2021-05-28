package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.db.*;

public class CategoryBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	private ConnectionPoolBean pool;
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int insertCategory(CategoryDTO dto) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "insert into category values"
						+ "(cate_seq.nextval, ?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<CategoryDTO> listCategory() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from category";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<CategoryDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<CategoryDTO> makeList(ResultSet rs) throws SQLException {
		List<CategoryDTO> list = new ArrayList<>();
		while(rs.next()) {
			CategoryDTO dto = new CategoryDTO();
			dto.setCnum(rs.getInt("cnum"));
			dto.setCode(rs.getString("code"));
			dto.setCname(rs.getString("cname"));
			list.add(dto);
		}
		return list;
	}
	
	public int deleteCategory(int cnum) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "delete from category where cnum = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, cnum);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public boolean check(CategoryDTO dto) throws SQLException{
		String sql = "select * from category where code=? or cname=?";
		try{
			con = pool.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getCode());
			ps.setString(2, dto.getCname());
			rs = ps.executeQuery();
			if (rs.next()){
				return true;
			}else {
				return false;
			}
		}finally{
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
}
