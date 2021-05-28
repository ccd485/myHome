<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="my.shop.*" %>    
<!-- memberAll.jsp -->
<jsp:useBean id="catedao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="catedao" value="<%=pool%>"/>

<%@ include file="top.jsp" %>
<div align="center">
	<h2>ī�װ����</h2>
	<table align="center" border="1" width="500">
		<tr>
			<th>��ȣ</th>
			<th>ī�װ� �ڵ�</th>
			<th>ī�װ� ��</th>
			<th>����</th>
		</tr>
<%	//���⿡ DB���� �ڷḦ ������ ��½����ش�.
		List<CategoryDTO> listCategory= null;
		 listCategory = catedao.listCategory();
		  
		if (listCategory==null || listCategory.size()==0){%>
		<tr>
			<td colspan="4">��ϵ� ī�װ��� �����ϴ�.</td>
		</tr>
<%	}else { 
			for(CategoryDTO dto : listCategory){%>
		<tr>
			<td><%=dto.getCnum()%></td>
			<td><%=dto.getCode()%></td>
			<td><%=dto.getCname()%></td>
			<td>
			<a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">����</a></td>
		</tr>	
<%		} 			
		} %>		
	</table>
</div>
<%@ include file="bottom.jsp"%>












