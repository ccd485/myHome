<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<!-- writePro.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="dao" class="my.board2.Board2DataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="dao" value="<%=pool%>"/>

<%
		String num = request.getParameter("num");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/board2/files");
		
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
			//(request,��������ġ, �ִ�ũ��, ���ڵ����)
		}catch(IOException e){
			e.printStackTrace();
		}
		int res =  dao.updateBoard(mr,num);
		if (res>0){%>
		<script type="text/javascript">
			alert("�Խñ� ��� ����!! �Խñ� ��� �������� �̵��մϴ�.")
			location.href="list.jsp"
		</script>
<%	}else {%>
		<script type="text/javascript">
			alert("�Խñ� ��� ����!! ��й�ȣ�� Ȯ�����ּ���.")
			history.back(1)
		</script>
<%	}%>











