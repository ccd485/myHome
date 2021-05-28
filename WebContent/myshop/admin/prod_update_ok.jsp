<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<jsp:useBean id="proddao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="proddao" value="<%=pool %>"/>
<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/myshop/files");
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		}catch(IOException e){
			e.printStackTrace();
		}
		
		int res = proddao.updateProduct(mr);
		String msg = null, url = null;
		if (res>0){
			msg = "��ǰ���� ����!! ��ǰ����������� �̵��մϴ�.";
			url = "prod_list.jsp";
		}else {
			msg = "��ǰ���� ����!! ��ǰ������������ �̵��մϴ�.";
			url = "prod_input.jsp?pnum="+mr.getParameter("pnum");
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>