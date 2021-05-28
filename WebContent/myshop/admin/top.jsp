<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" type="text/css" href="../../style.css">
<!-- top.jsp -->
<html>
<head>
	<title>쇼핑몰(관리자용)</title>
</head>
<body>
	<div align="center">
	<h1 align="center">쇼핑몰 (관리자용)</h1>
	<h3 align="center"><a href="<%=request.getContextPath()%>/myshop/display/mall.jsp">쇼핑몰 홈</a> | <a href="main.jsp">메인 홈</a></h3>
		<table border="1" width="800" height="650">
			<tr height="10%">
				<td align="center" width="20%">
					<a href="cate_input.jsp">카테고리등록</a> 
				</td>
				<td align="center" width="20%">
					<a href="cate_list.jsp">카테고리목록</a>
				</td>
				<td align="center" width="20%">
					<a href="prod_input.jsp">상품등록</a>
				</td>
				<td align="center" width="20%">
					<a href="prod_list.jsp">상품목록</a>
				</td>
				<td align="center" width="20%">
					<a href="main.jsp">쇼핑몰홈</a>
				</td>
			</tr>
			<tr height="80%">
				<td colspan="5">
