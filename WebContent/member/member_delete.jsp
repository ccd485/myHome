<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="mbdao" value="<%=pool %>"/>
<%
		//1. �Ѿ�� ������ �ޱ�
		String no = request.getParameter("no");
		if (no==null || no.trim().equals("")){
			response.sendRedirect("memberAll.jsp");	//�����ܿ��� ������ �̵��� �����ִ� ��ɾ�
			return;
		}
		int res = mbdao.deleteMember(Integer.parseInt(no));
		String msg = null, url = null; 
		if (res>0){
			msg = "ȸ����������!! ȸ������������� �̵��մϴ�.";
			url = "memberAll.jsp";
		}else {
			msg = "ȸ����������!! ȸ�������������� �̵��մϴ�.";
			url = "memberAll.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>