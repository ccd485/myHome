<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall_prodView.jsp -->
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="prodlist" class="my.shop.mall.ProductList" scope="session"/>
<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		if (pnum==null || select==null){
			response.sendRedirect("mall.jsp");
			return;  
		}
		ProductDTO pdto = prodlist.getProduct(Integer.parseInt(pnum), select);
		String upPath = config.getServletContext().getRealPath("/myshop/files");
		DecimalFormat df = new DecimalFormat("###,###");
%>
<script type="text/javascript">
	function goCart(){
		document.cartAdd.action = "mall_cartAdd.jsp"
		document.cartAdd.submit()
	}
	function goOrder(){
		document.cartAdd.action = "mall_order.jsp"
		document.cartAdd.submit()
	}
</script>
<div align="center">
<table width="99%" border="0" class="outline">
	<tr class="m1">
		<td colspan="2" align="center">
			<b>[<%=pdto.getPname()%>] 상품 정보</b>
		</td>
	</tr>
	<tr>
		<td align="center" class="m3">
			<img src="<%=upPath%>/<%=pdto.getPimage()%>" width="200" height="200" border="0">
		</td>
		<td class="m3">
			<form name="cartAdd" method="post">
				상품번호 : <%=pnum%><br>
				상품이름 : <%=pdto.getPname()%><br>
				상품가격 : <font color="red"><%=pdto.getPrice()%></font>원<br>
				상품포인트 : <font color="red">[<%=pdto.getPoint()%>]</font>point<br>
				상품갯수 : <input type="text" name="qty" size="3" value="1">개<br><br>
				<input type="hidden" name="pnum" value="<%=pnum%>"/>
				<input type="hidden" name="select" value="<%=select%>"/>
				<a href="javascript:goCart()">장바구니</a>
				<a href="javascript:goOrder()">즉시구매</a>
			</form>	
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="left">
			<b>상품 상세 설명</b><br>
			<%=pdto.getPcontents()%>
		</td>
	</tr>		
</table>	
</div>
<%@ include file="mall_bottom.jsp" %>