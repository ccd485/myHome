<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<jsp:useBean id="proddao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="proddao" value="<%=pool %>"/>

<%
		request.setCharacterEncoding("EUC-KR");
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/myshop/files");
		System.out.println(upPath);
		
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
			//(request,��������ġ, �ִ�ũ��, ���ڵ����)
			out.println("���ε强��!");
		}catch(IOException e){
			e.printStackTrace();
		}

		
		int res = proddao.insertProduct(mr);
		if (res>0){%>
		<script type="text/javascript">
			alert("��ǰ��� ����!!")
			location.href="prod_list.jsp"
		</script>	
<%	}else {%>
		<script type="text/javascript">
			alert("��ǰ ����!! ī�װ������������ �̵��մϴ�.")
			location.href="prod_input.jsp"
		</script>
<%	}%>