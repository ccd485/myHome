<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writePro.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dto" class="my.board.BoardDBBean" />
<jsp:setProperty property="*" name="dto" />
<jsp:useBean id="dao" class="my.board.BoardDataBean" />

<%
		if (dto.getWriter() == null || dto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
	
		dto.setIp(request.getRemoteAddr());
		int res =  dao.insertBoard(dto);
		if (res>0){%>
		<script type="text/javascript">
			alert("�Խñ� ��� ����!! �Խñ� ��� �������� �̵��մϴ�.")
			location.href="list.jsp"
		</script>
<%	}else {%>
		<script type="text/javascript">
			alert("�Խñ� ��� ����!! �Խñ� ��� �������� �̵��մϴ�.")
			location.href="writeForm.jsp"
		</script>
<%	}%>











