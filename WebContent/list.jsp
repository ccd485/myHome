<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.student.*"%>
<!-- list.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
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
		ArrayList<StudentDTO> list = stdao.listStudent();
		if (list==null || list.size()==0){%> 
			<tr>
				<td>등록된 학생이 없습니다.</td>
			</tr>		
<%	}else {
			for(StudentDTO dto : list){
%>
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getCname()%></td>
			</tr>			
<%		}
		}
%>
		</table>
	</div>
</body>
</html>













