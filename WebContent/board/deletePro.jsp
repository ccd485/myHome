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
			msg = "�ۻ��� ����!! �۸���������� �̵��մϴ�.";
			url = "list.jsp";
		}else if (res<0){
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!";
			url = "deleteForm.jsp?num="+ num;
		}else {
			msg = "�ۻ��� ����!! �ۺ��� �������� �̵��մϴ�.";
			url = "content.jsp?num="+num;
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>






