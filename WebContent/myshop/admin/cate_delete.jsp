<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="catedao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="catedao" value="<%=pool %>"/>
<%
		//1. �Ѿ�� ������ �ޱ�
		String cnum = request.getParameter("cnum");
		if (cnum==null || cnum.trim().equals("")){
			response.sendRedirect("cate_list.jsp");	//�����ܿ��� ������ �̵��� �����ִ� ��ɾ�
			return;
		}
		int res = catedao.deleteCategory(Integer.parseInt(cnum));
		String msg = null, url = null; 
		if (res>0){
			msg = "ī�װ���������!! ����������� �̵��մϴ�.";
			url = "cate_list.jsp";
		}else {
			msg = "ī�װ���������!! ����������� �̵��մϴ�.";
			url = "cate_list.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>