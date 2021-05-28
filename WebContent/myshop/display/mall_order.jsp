<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session" /> 
<jsp:useBean id="prodlist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="prodlist" name="cart" value="<%=prodlist%>" />
<%@ include file="mall_top.jsp"%>
<table width="100%" border="1" align="center">
	<tr class="m2">
		<td colspan="3" align="center">
			<h3>���������� ����</h3>
		</td>
	</tr>
	<tr class="m1">
		<th width="45%">��ǰ��</th>
		<th width="20%">����</th>
		<th width="35%">�ݾ�</th>
	</tr>
<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		String qty = request.getParameter("qty");
		
		Hashtable<String, ProductDTO> ht = null;
		if (pnum == null) {
			ht = cart.listCart();
		}else {
			ProductDTO dto = prodlist.getProduct(Integer.parseInt(pnum), select);
			ht = new Hashtable<>();
			dto.setPqty(Integer.parseInt(qty));
			ht.put(pnum, dto);
		}
		if (ht==null || ht.size()==0){%>
		
		<script type="text/javascript">
				alert("��ǰ�� �����ϴ�")
				location.href="mall.jsp"			
		</script>
<%	}else {
			DecimalFormat df = new DecimalFormat("###,###");
			int cartTotalPrice = 0;
			int cartTotalPoint = 0;
			Enumeration<String> enu = ht.keys();
			while(enu.hasMoreElements()){
				String key = enu.nextElement();
				ProductDTO dto = ht.get(key);%>
	<tr>
		<td align="center">
			<%=dto.getPname()%>
		</td>
		<td align="center">
				<%=dto.getPqty()%>��<br>
			</form>
		</td>
		<td align="right">
			<b><%=df.format(dto.getPrice()*dto.getPqty())%>��</b><br>
		</td>
<%		cartTotalPrice += dto.getPrice() * dto.getPqty();
			cartTotalPoint += dto.getPoint() * dto.getPqty();%>			
	</tr>			
<%		}%>
	<tr class="m1">
		<td colspan="3" align="center">
			<b>���� �Ѿ�</b> :
			<font color="red"><%=df.format(cartTotalPrice)%>��<br></font>
		</td>
	</tr>
<%	}%>	
</table>
<div align="center">
	<a href="javascript:"><button>����</button></a>
	<a href="javascript:history.go(-1)"><button>���</button></a>
</div>
<%@ include file="mall_bottom.jsp"%>