<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall_cgProdList.jsp -->
<%
		request.setCharacterEncoding("EUC-KR");
		String code = request.getParameter("code");
		String cname = request.getParameter("cname");
		if (code==null || code.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
%>
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="prodlist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="pool" name="prodlist" value="<%=pool%>"/>

	<div align="center">
		<h2>Welcome to My Mall</h2>
<%	String upPath = config.getServletContext().getRealPath("/myshop/files");
		DecimalFormat df = new DecimalFormat("###,###");

		List<ProductDTO> plist = prodlist.selectByCode(code);
		if (plist == null || plist.size()==0){%> 
			<b>찾으시는 카테고리에 상품이 없습니다.</b>
<%	}else {
			int count = 0;
			%>
			<hr color="green" width="80%">
			<font color="red" size="3"><%=cname%></font>
			<hr color="green" width="80%">
			<table border="0" width="100%">
				<tr>
<%		for(ProductDTO dto : plist){
				count++;%>
					<td align="center">
						<a href="mall_prodView.jsp?pnum=<%=dto.getPnum()%>&select=<%=code%>">
							<img src="<%=upPath%>/<%=dto.getPimage()%>" width="80" height="60">
						</a>
						
						<br>
						<%=dto.getPname()%><br>
						<font color="red"><%=df.format(dto.getPrice())%></font><br>
						<font color="blue">[<%=dto.getPoint()%>]</font>point
					</td>
<%			if (count%3 == 0){%>
					</tr><tr>	
<%			} 
			}%>
				</tr>
			</table>
<%	} %>
	</div>
<%@ include file="mall_bottom.jsp" %>
