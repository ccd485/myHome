<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="catedto" class="my.shop.CategoryDTO" />
<jsp:setProperty property="*" name="catedto" />
<jsp:useBean id="catedao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="catedao" value="<%=pool %>"/>
<%
		if (catedto.getCode() == null || catedto.getCode().trim().equals("")
				|| catedto.getCname() == null || catedto.getCname().trim().equals("")){
			%>
			<script type="text/javascript">
				alert("ī�װ���� ����!!")
				location.href="cate_list.jsp"
			</script>	
		<%
			response.sendRedirect("cate_input.jsp");
			return;
		}

		boolean isCheck = catedao.check(catedto);
		if (isCheck){%>  
		<script type="text/javascript">
			alert("ī�װ� �ڵ� �Ǵ� �̸��� �ߺ��Ǿ����ϴ�. �ٽ� �Է��ϼ���!!");
			location.href="cate_input.jsp";
		</script>
		<%		return;
		}
		
		int res = catedao.insertCategory(catedto);
		if (res>0){%>
		<script type="text/javascript">
			alert("ī�װ���� ����!!")
			location.href="cate_list.jsp"
		</script>	
<%	}else {%>
		<script type="text/javascript">
			alert("��� ����!! ī�װ������������ �̵��մϴ�.")
			location.href="cate_input.jsp"
		</script>
<%	}%>