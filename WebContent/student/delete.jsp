<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- delete.jsp -->
<%
		//1. 넘어온 데이터 받기
		String id = request.getParameter("id");
		if (id==null || id.trim().equals("")){
			response.sendRedirect("student.jsp");	//서버단에서 페이지 이동을 시켜주는 명령어
			return;
		}
		//2. DB 연결하기
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "bigdata3", "bigdata3");
		//3. 쿼리를 전송하여 DB에 값 넣기
		String sql = "delete from student where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		//4. 실패 유무를 판단하여 페이지 이동시키기
		int res = ps.executeUpdate();
		String msg = null, url = null;
		if (res>0){
			msg = "학생삭제성공!! 학생목록페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "학생삭제실패!! 학생관리페이지로 이동합니다.";
			url = "student.jsp";
		}
		//5. DB 닫기
		ps.close();
		con.close();
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>













