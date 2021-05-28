<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- deletePro.jsp -->
<jsp:useBean id="dao" class="my.board.BoardDataBean" />

<%
		String num = request.getParameter("num");
		String passwd = request.getParameter("passwd");
		if (num==null || passwd==null || num.trim().equals("") || passwd.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		int res = dao.deleteBoard(Integer.parseInt(num), passwd);
		String msg = null, url = null;
		if (res>0){
			msg = "글삭제 성공!! 글목록페이지로 이동합니다.";
			url = "list.jsp";
		}else if (res<0){
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요!!";
			url = "deleteForm.jsp?num="+ num;
		}else {
			msg = "글삭제 실패!! 글보기 페이지로 이동합니다.";
			url = "content.jsp?num="+num;
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>






