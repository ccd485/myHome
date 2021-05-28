<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall_cartList.jsp -->
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session" />
<%@ include file="mall_top.jsp"%>
<table width="100%" border="1" align="center">
	<tr class="m2">
		<td colspan="6" align="center">
			<h3>장바구니 보기</h3>
		</td>
	</tr>
	<tr class="m1">
		<th width="10%">번호</th>
		<th width="30%">상품명</th>
		<th width="14%">수량</th>
		<th width="18%">단가</th>
		<th width="18%">금액</th>
		<th width="10%">삭제</th>
	</tr>
<%
		Hashtable<String, ProductDTO> ht = cart.listCart();
		if (ht==null || ht.size()==0){%>
	<tr>
		<td colspan="6">장바구니가 비었습니다.</td>
	</tr>
<%	}else {
			DecimalFormat df = new DecimalFormat("###,###");
			int cartTotalPrice = 0;
			int cartTotalPoint = 0;
			Enumeration<String> enu = ht.keys();
			while(enu.hasMoreElements()){
				String key = enu.nextElement();
				ProductDTO dto = ht.get(key);
				String upPath = config.getServletContext().getRealPath("/myshop/files");%>
	<tr>
		<td align="center"><%=dto.getPnum()%></td>
		<td align="center">
			<img src="<%=upPath%>/<%=dto.getPimage()%>" width="40" height="40"><br>
			<b><%=dto.getPname()%></b>
		</td>
		<td align="center">
			<form name="cartEdit" method="post" action="mall_cartEdit.jsp">
				<input type="text" size="3" name="pqty" value="<%=dto.getPqty()%>"/>개<br>
				<input type="hidden" name="pnum" value="<%=dto.getPnum()%>"/>
				<input type="submit" value="수정">
			</form>
		</td>
		<td align="right">
			<b><%=df.format(dto.getPrice())%>원</b><br>
			<b>[<%=dto.getPoint()%>]point</b>
		</td>
		<td align="right">
			<font color="red">
				<b><%=df.format(dto.getPrice()*dto.getPqty())%>원</b><br>
				<b>[<%=dto.getPoint()*dto.getPqty()%>]point</b>
			</font>
<%		cartTotalPrice += dto.getPrice() * dto.getPqty();
			cartTotalPoint += dto.getPoint() * dto.getPqty();%>			
		</td>
		<td align="center">
			<a href="mall_cartDel.jsp?pnum=<%=dto.getPnum()%>">삭제</a>
		</td>
	</tr>			
<%		}%>
	<tr class="m1">
		<td colspan="4">
			<b>장바구니 총액</b> :
			<font color="red"><%=df.format(cartTotalPrice)%>원<br></font>
			<b>총 적립 포인트 </b> : 
			<font color="green">[<%=cartTotalPoint%>] point</font>
		</td>
		<td colspan="2">
			<a href="mall_order.jsp">[주문하기]</a>
			<a href="javascript:history.go(-2)">[계속쇼핑]</a>
		</td>
	</tr>
<%	}%>	
</table>
<%@ include file="mall_bottom.jsp"%>








