<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<%
	String id = (String)session.getAttribute("id");
	if(id==null){%>
		<script type="text/javascript">
			alert("로그인을 먼저 해 주세요")
			location.href="sessionTest1.jsp"
		</script>
<%	return;	
	}%>
<title>회원전용페이지</title>
</head>
<body>
	<h1>회원 전용 페이지</h1>
	<h2>회원만 볼 수 있음. 로그인해야만 볼수있음</h2>
	<a href="sessionTest3.jsp">로그아웃</a>
</body>
</html>