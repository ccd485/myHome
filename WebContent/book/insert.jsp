<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dto" class="my.book.BookDTO" />
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="dao" class="my.book.BookDAO" />
<%
		if (dto.getBookname()==null || dto.getWriter()==null || dto.getPublisher()==null
		|| dto.getBookname().trim().equals("") || dto.getWriter().trim().equals("") 
		|| dto.getPublisher().trim().equals("") || dto.getPrice()==0){
			response.sendRedirect("book.jsp");
			return;
		}

		int res = dao.insertBook(dto);
		String msg = null, url = null;
		if (res>0){
			msg = "도서등록성공!! 도서목록페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "도서등록실패!! 도서관리페이지로 이동합니다.";
			url = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>




