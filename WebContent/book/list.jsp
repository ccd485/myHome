<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.book.*"%>
<!-- list.jsp -->
<jsp:useBean id="dao" class="my.book.BookDAO" />
<html>
<head>
	<title>도서목록</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>도 서 목 록 보 기</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<th>도서명</th>
				<th>지은이</th>
				<th>출판사</th>
				<th>판매가</th>
				<th>입고일</th>
			</tr>
<!-- 			여기서부터 DB에서 자료를 가져와 화면에 출력시켜 주면 된다. -->	
<%
		ArrayList<BookDTO> list = dao.listBook();
		if (list==null || list.size()==0){%> 
			<tr>
				<td colspan="5">등록된 도서가 없습니다.</td>
			</tr>		
<%	}else {
			java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
			for(BookDTO dto : list){
%>
			<tr>
				<td align="center"><%=dto.getBookname()%></td>
				<td align="center"><%=dto.getWriter()%></td>
				<td align="center"><%=dto.getPublisher()%></td>
				<td aligh="right"><%=df.format(dto.getPrice())%>원</td>
				<td align="center"><%=dto.getIndate()%></td>
			</tr>			
<%		}
		}
%>
		</table>
	</div>
</body>
</html>