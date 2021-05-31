<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>홈페이지</title>
	<link rel="stylesheet" type="text/css" href="style.css"> 
	<script type="text/javascript">
		function checkMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp", "check", "width=640, height=400")
		}
	</script>
</head>
<body>
<%
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	boolean isLogin = false;
	if(id != null && name !=null){
		isLogin = true;
	}
%>
	<div align="center">
		<table border="1" width="800" height="650">
			<tr height="10%">
				<td align="center" colspan="2">
					<a href="<%=request.getContextPath()%>/index.jsp">main</a> | 
					<%if(isLogin){ %>
					<a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a> | 
					<%}else{ %>
					<a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a> | 
					<%} %>
					<a href="javascript:checkMember()">회원가입</a> |
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp">회원보기</a> |
					<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">회원찾기</a> |
					<a href="<%=request.getContextPath()%>/myshop/admin/main.jsp">쇼핑몰(관리자)</a> |
					<a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">쇼핑몰</a> |
					<a href="<%=request.getContextPath()%>/board/list.jsp">게시판</a> |
					<a href="<%=request.getContextPath()%>/board2/list.jsp">자료게시판</a> |
					<a href="<%=request.getContextPath()%>/company.jsp">회사소개</a>
				</td>
			</tr>
			<tr height="80%">
				<td width="20%" valign="top">
<%           if(isLogin){    %>
					<b>[<%=name%>]님이 로그인중...</b>
<%          }else{    %>
					<b>로그인을 해주세요</b>
<%           }    %>
					<br><br>
				<jsp:include page="/count/count.jsp"/>
				</td>
				<td>