<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- mall_cartAdd.jsp -->
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session" /> 
<jsp:useBean id="prodlist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="prodlist" name="cart" value="<%=prodlist%>" />
<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		int qty = Integer.parseInt(request.getParameter("qty"));
		
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		if (qty < 1){
			response.sendRedirect("mall.jsp");
			return;
		}
		
		boolean isAddCart = cart.addCart(pnum, select, qty);
		if (isAddCart){%>
			<script type="text/javascript">
				location.href="mall_cartList.jsp"			
			</script>	
<%	}else {%>
			<script type="text/javascript">
				alert("장바구니 오류 발생!! 관리자에게 문의해 주세요")
				location.href="mall.jsp"			
			</script>
<%	} %>




