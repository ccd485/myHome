<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="my.shop.*" %>    
<!-- memberAll.jsp -->
<jsp:useBean id="proddao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="proddao" value="<%=pool%>"/>

<%@ include file="top.jsp" %>

<%	//���⿡ DB���� �ڷḦ ������ ��½����ش�.
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");	//�����ܿ��� ������ �̵��� �����ִ� ��ɾ�
			return;
		}
		
		ProductDTO dto = proddao.getProduct(Integer.parseInt(pnum));
		  
%>
<div align="center">
	<h4>��ǰ�󼼺���</h4>
	<table align="center" border="1" width="800">
		<tr>
			<th class="m3">ī�װ�</th>
			<td align="left"><%=dto.getPcategory_fk()%></td>
			<th class="m3">��ǰ��ȣ</th>
			<td align="left"><%=dto.getPnum()%></td>
		</tr>
		<tr>
			<th class="m3">��ǰ��</th>
			<td align="left"><%=dto.getPname()%></td>
			<th class="m3">����ȸ��</th>
			<td align="left"><%=dto.getPcompany()%></td>
		</tr>
		<tr>
			<th class="m3"  height="30%">��ǰ�̹���</th>
			<td>
				<% //String upPath = config.getServletContext().getRealPath("/myshop/save");
					//String upPath = request.getServletConext().getRealPath("/myshop/svae");
					String upPath = application.getRealPath("/myshop/files");
				%>
				<a href="prod_view.jsp?pnum=<%=dto.getPnum()%>">
					<img src="<%=upPath%>/<%=dto.getPimage()%>" width="200" height="200">
				</a>
			</td>
		</tr>
		<tr>
			<th class="m3">��ǰ����</th>
			<td align="left"><%=dto.getPqty()%></td>
			<th class="m3">����</th>
			<td align="left"><%=dto.getPrice()%></td>
		</tr>
		<tr>
			<th class="m3">��ǰ����</th>
			<td align="left"><%=dto.getPspec()%></td>
			<th class="m3">��ǰ����Ʈ</th>
			<td align="left"><%=dto.getPoint()%></td>
		</tr>
		<tr>
			<th class="m3" height="30%">��ǰ�Ұ�</th>
			<td align="left" colspan="3"><%=dto.getPcontents()%></td>
		</tr>
	</table>
</div>
<%@ include file="bottom.jsp"%>