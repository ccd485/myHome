<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
	<title>파일내용보기</title>
</head>
<body>
	<div align="center">
		<h2>파일업로드 테스트</h2>
		<h3>전송되는 데이터의 형태를 화면에 그대로 출력하기</h3>
		<hr color="red">
<%
		String type=request.getContentType();
		int len = request.getContentLength();
%>
		ContentType = <%=type%> , len = <%=len%><br>		
		<hr color="blue">
<xmp>		
<%
		ServletInputStream in = request.getInputStream();
		byte data[] = new byte[1024];
		int n = 0;
		while((n=in.read(data)) != -1){
			String str = new String(data, 0, n);
			out.println(str);
		}
		in.close();
%>
</xmp>
	</div>
</body>
</html>