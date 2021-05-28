<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- list.jsp -->
<html>
<head>
	<title>학생목록</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>학 생 목 록 보 기</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>아이디</th>
				<th>학생명</th>
				<th>학급명</th>
			</tr>
<!-- 			여기서부터 DB에서 자료를 가져와 화면에 출력시켜 주면 된다. -->	
<%
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe", "bigdata3", "bigdata3");
			String sql = "select * from student";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String id = rs.getString("id");
				String name = rs.getString("name");
				String cname = rs.getString("cname");%>
			<tr>
				<td><%=id%></td>
				<td><%=name%></td>
				<td><%=cname%></td>
			</tr>			
<%		}
			rs.close();
			ps.close();
			con.close();
%>
		</table>
	</div>
</body>
</html>













