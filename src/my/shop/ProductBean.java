package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oreilly.servlet.MultipartRequest;

import my.db.*;

public class ProductBean {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	private ConnectionPoolBean pool;
	
	public void setPool(ConnectionPoolBean pool) {
		this.pool = pool;
	}
	
	public int insertProduct(MultipartRequest mr) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "insert into product values"
						+ "(prod_seq.nextval, ?,?,?,?,?,?,?,?,?,sysdate)";
			ps = con.prepareStatement(sql);
			ps.setString(1,mr.getParameter("pname"));
			String pcategory_fk = mr.getParameter("pcategory_fk");
			String pcode = mr.getParameter("pcode");
			pcategory_fk += pcode;
			ps.setString(2, pcategory_fk);
			ps.setString(3, mr.getParameter("pcompany"));
			ps.setString(4, mr.getFilesystemName("pimage"));
			ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(6, Integer.parseInt(mr.getParameter("price")));
			ps.setString(7, mr.getParameter("pspec"));
			ps.setString(8, mr.getParameter("pcontents"));
			ps.setInt(9, Integer.parseInt(mr.getParameter("point")));
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<ProductDTO> listProduct() throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from product";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			List<ProductDTO> list = makeList(rs);
			return list;
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public List<ProductDTO> makeList(ResultSet rs) throws SQLException {
		List<ProductDTO> list = new ArrayList<>();
		while(rs.next()) {
			ProductDTO dto = new ProductDTO();
			dto.setPnum(rs.getInt("pnum"));
			dto.setPname(rs.getString("pname"));
			dto.setPcategory_fk(rs.getString("pcategory_fk"));
			dto.setPcompany(rs.getString("pcompany"));
			dto.setPimage(rs.getString("pimage"));
			dto.setPqty(rs.getInt("pqty"));
			dto.setPrice(rs.getInt("price"));
			dto.setPspec(rs.getString("pspec"));
			dto.setPcontents(rs.getString("pcontents"));
			dto.setPoint(rs.getInt("point"));
			dto.setPinputdate(rs.getString("pinputdate"));
			list.add(dto);
		}
		return list;
	}
	
	public int deleteProduct(int pnum) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "delete from product where pnum = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, pnum);
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public ProductDTO getProduct(int pnum) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "select * from product where pnum = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, pnum);
			rs = ps.executeQuery();
			List<ProductDTO> list = makeList(rs);
			return list.get(0);
		}finally {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
	public int updateProduct(MultipartRequest mr) throws SQLException {
		try {
			con = pool.getConnection();
			String sql = "update product set pname=?,pcompany=?,pimage=?,pqty=?"
					+ ",price=?,pspec=?,pcontents=?,point=? where pnum=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,mr.getParameter("pname"));
			ps.setString(2, mr.getParameter("pcompany"));
			String pimage = mr.getFilesystemName("pimage");
			if(pimage ==null) {
				pimage = mr.getParameter("pimage2");
			}
			ps.setString(3, pimage);
			ps.setInt(4, Integer.parseInt(mr.getParameter("pqty")));
			ps.setInt(5, Integer.parseInt(mr.getParameter("price")));
			ps.setString(6, mr.getParameter("pspec"));
			ps.setString(7, mr.getParameter("pcontents"));
			ps.setInt(8, Integer.parseInt(mr.getParameter("point")));
			ps.setInt(9, Integer.parseInt(mr.getParameter("pnum")));
			int res = ps.executeUpdate();
			return res;
		}finally {
			if (ps != null) ps.close();
			if (con != null) pool.returnConnection(con);
		}
	}
	
}
