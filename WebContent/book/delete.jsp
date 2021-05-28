<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- delete.jsp -->
<jsp:useBean id="dao" class="my.book.BookDAO" />
<%
		String bookname = request.getParameter("bookname");
		if (bookname==null || bookname.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
		int res = dao.deleteBook(bookname);
		String msg = null, url = null; 
		if (res>0){
			msg = "도서삭제성공!! 도서목록페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "도서삭제실패!! 도서관리페이지로 이동합니다.";
			url = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>