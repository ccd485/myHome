<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<!-- insert.jsp -->
<%
		//1. 넘어온 데이터 받기
		request.setCharacterEncoding("EUC-KR");//한글설정(post방식일때만 가능)
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cname = request.getParameter("cname");
		
		if (id==null || name==null || cname==null || id.trim().equals("") 
				|| name.trim().equals("") || cname.trim().equals("")){%>
		<script type="text/javascript">
			alert("아이디, 학생명, 학급명을 모두 입력해 주셔야 합니다.!!")
			history.back()
		</script>		
<%		return;//_jspService()메소드를 빠져나가라... 
		}
		//2. DB 연결하기
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection
						("jdbc:oracle:thin:@localhost:1521:xe", "bigdata3", "bigdata3");
		//3. 쿼리를 전송하여 DB에 값 넣기
		String sql = "insert into student values(?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, name);
		ps.setString(3, cname);
		//4. 실패 유무를 판단하여 페이지 이동시키기
		int res = ps.executeUpdate();
		if (res>0){%>
		<script type="text/javascript">
			alert("학생등록성공!! 학생목록페이지로 이동합니다.")
			location.href="list.jsp"
		</script>		
<%	}else {%>
		<script type="text/javascript">
			alert("학생등록실패!! 학생관리페이지로 이동합니다.")
			location.href="student.jsp"
		</script>			
<%	}
		//5. DB 닫기
		ps.close();
		con.close();
%>









