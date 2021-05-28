<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<jsp:useBean id="proddao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="proddao" value="<%=pool %>"/>
<%
		//1. �Ѿ�� ������ �ޱ�
		request.setCharacterEncoding("EUC-KR");
		String pnum = request.getParameter("pnum");
		String pimage = request.getParameter("pimage");
		if (pnum==null || pnum.trim().equals("") || pimage==null || pimage.trim().equals("")){
			response.sendRedirect("prod_list.jsp");	//�����ܿ��� ������ �̵��� �����ִ� ��ɾ�
			return;
		}
		
		int res = proddao.deleteProduct(Integer.parseInt(pnum));
		String msg = null;
		if (res>0){
			String delPath = application.getRealPath("/myshop/files");
			File file = new File(delPath,pimage);
			if(file.exists()){
				file.delete();
				msg = "��ǰ��������!! ��ǰ����������� �̵��մϴ�.";
			}else{
				msg = "��ǰ��������!!(�̹��� ������ �����߽��ϴ�)! ��ǰ����������� �̵��մϴ�.";
			}
		}else {
			msg = "��ǰ��������!! ����������� �̵��մϴ�.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="prod_list.jsp"
</script>