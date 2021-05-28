<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>쿠키테스트2</title>
</head>
<body>
	<h2>클라이언트에서 넘어온 쿠키</h2>
	<%
		Cookie[] cks = request.getCookies();
		if(cks != null && cks.length != 0){
			for(int i=0; i<cks.length; i++){
				String name = cks[i].getName();
				String value = cks[i].getValue();
				out.println("<h3>name ="+ name + ", value = " + value + "</h3>");
			}
		}
	%>
</body>
</html>