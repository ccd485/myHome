<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="my.shop.*" %>    
<!-- memberAll.jsp -->
<jsp:useBean id="proddao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="proddao" value="<%=pool%>"/>
<%@ include file="top.jsp" %>
<script type="text/javascript">
	function checkDel(pnum,pimage){
		var isDel = window.confirm("���� �Ͻðڽ��ϱ�?")
		if (isDel){
			location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage
		}
	}
</script>
<div align="center">
	<h4>��ǰ���</h4>
	<table align="center" border="1" width="800">
		<tr>
			<th width="5%">��ȣ</th>
			<th width="15%">��ǰ�ڵ�</th>
			<th width="25%">��ǰ��</th>
			<th width="10%">�̹���</th>
			<th width="10%">����</th>
			<th width="10%">������</th>
			<th width="10%">����</th>
			<th width="15%">����|����</th>
		</tr>
<%	//���⿡ DB���� �ڷḦ ������ ��½����ش�.
		List<ProductDTO> listProduct= null;
		listProduct = proddao.listProduct();
		  
		if (listProduct==null || listProduct.size()==0){%>
		<tr>
			<td colspan="8">��ϵ� ī�װ��� �����ϴ�.</td>
		</tr>
<%	}else { 
			for(ProductDTO dto : listProduct){%>
		<tr>
			<td><%=dto.getPnum()%></td>
			<td><%=dto.getPcategory_fk()%></td>
			<td><%=dto.getPname()%></td>
			<td>
				<% //String upPath = config.getServletContext().getRealPath("/myshop/save");
					//String upPath = request.getServletConext().getRealPath("/myshop/svae");
					String upPath = application.getRealPath("/myshop/files");
				%>
				<a href="prod_view.jsp?pnum=<%=dto.getPnum()%>">
					<img src="<%=upPath%>/<%=dto.getPimage()%>" width="40" height="40">
				</a>
			</td>
			<td align="right"><%=dto.getPrice()%></td>
			<td><%=dto.getPcompany()%></td>
			<td><%=dto.getPqty()%></td>
			<td align="right">
			<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">����</a>|
			<a href="javascript:checkDel('<%=dto.getPnum()%>','<%=dto.getPimage()%>')">����</a></td>
		</tr>
<%		}
		} %>
	</table>
</div>
<%@ include file="bottom.jsp"%>












