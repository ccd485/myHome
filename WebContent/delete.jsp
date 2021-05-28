<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- delete.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<%
		//1. 넘어온 데이터 받기
		String id = request.getParameter("id");
		if (id==null || id.trim().equals("")){
			response.sendRedirect("student.jsp");	//서버단에서 페이지 이동을 시켜주는 명령어
			return;
		}
		int res = stdao.deleteStudent(id);
		String msg = null, url = null; 
		if (res>0){
			msg = "학생삭제성공!! 학생목록페이지로 이동합니다.";
			url = "list.jsp";
		}else {
			msg = "학생삭제실패!! 학생관리페이지로 이동합니다.";
			url = "student.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>













