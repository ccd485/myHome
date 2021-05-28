<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<!-- mall.jsp -->
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="prodlist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="pool" name="prodlist" value="<%=pool%>"/>

	<div align="center">
		<h2>Welcome to My Mall</h2>
<%	String upPath = config.getServletContext().getRealPath("/myshop/files");
		DecimalFormat df = new DecimalFormat("###,###");

		List<ProductDTO> plist = prodlist.selectBySpec("HIT");
		if (plist == null || plist.size()==0){%>
			<b>HIT상품이 없습니다.</b>
<%	}else {
			int count = 0;
			%>
			<hr color="black" width="80%">
			<font color="red" size="3">H I T</font>
			<hr color="black" width="80%">
			<table border="0" width="100%">
				<tr>
<%		for(ProductDTO dto : plist){
				count++;%>
					<td align="center">
						<a href="mall_prodView.jsp?pnum=<%=dto.getPnum()%>&select=HIT">
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
<%	} 
		
		List<ProductDTO> plist2 = prodlist.selectBySpec("NEW");
		if (plist2 == null || plist2.size()==0){%>
			<b>NEW상품이 없습니다.</b>
<%	}else {
			int count = 0;
			%>
			<hr color="black" width="80%">
			<font color="red" size="3">N E W</font>
			<hr color="black" width="80%">
			<table border="0" width="100%">
				<tr>
<%		for(ProductDTO dto : plist2){
				count++;%>
					<td align="center">
						<a href="mall_prodView.jsp?pnum=<%=dto.getPnum()%>&select=NEW">
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
<%	}
		
		List<ProductDTO> plist3 = prodlist.selectBySpec("BEST");
		if (plist3 == null || plist3.size()==0){%>
			<b>BEST상품이 없습니다.</b>
<%	}else {
			int count = 0;
			%>
			<hr color="black" width="80%">
			<font color="red" size="3">B E S T</font>
			<hr color="black" width="80%">
			<table border="0" width="100%">
				<tr>
<%		for(ProductDTO dto : plist3){
				count++;%>
					<td align="center">
						<a href="mall_prodView.jsp?pnum=<%=dto.getPnum()%>&select=BEST">
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
<%	}	%>
	</div>
<%@ include file="mall_bottom.jsp" %>







			