<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.book.*"%>
<!-- find.jsp -->
<jsp:useBean id="dao" class="my.book.BookDAO" />
<%
		String search = request.getParameter("search");
		String searchString = request.getParameter("searchString");
		if (search == null || searchString == null || 
				search.trim().equals("") || searchString.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
%>
<html>
<head>
	<title>도서찾기</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>도 서 찾 기<h2>
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
		ArrayList<BookDTO> list = dao.findBook(search, searchString);
		if (list==null || list.size()==0){%> 
			<tr> 
				<td colspan="5">찾으시는 도서가 없습니다.</td>
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
<%		}%>
			<tr>
				<td colspan="5">찾으시는 도서는 총 <%=list.size()%>권 있습니다.</td>
			</tr>
<%	}%>
		</table>
	</div>
</body>
</html>