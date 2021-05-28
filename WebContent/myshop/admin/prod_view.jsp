<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="my.shop.*" %>    
<!-- memberAll.jsp -->
<jsp:useBean id="proddao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="proddao" value="<%=pool%>"/>

<%@ include file="top.jsp" %>

<%	//여기에 DB에서 자료를 가져와 출력시켜준다.
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");	//서버단에서 페이지 이동을 시켜주는 명령어
			return;
		}
		
		ProductDTO dto = proddao.getProduct(Integer.parseInt(pnum));
		  
%>
<div align="center">
	<h4>상품상세보기</h4>
	<table align="center" border="1" width="800">
		<tr>
			<th class="m3">카테고리</th>
			<td align="left"><%=dto.getPcategory_fk()%></td>
			<th class="m3">상품번호</th>
			<td align="left"><%=dto.getPnum()%></td>
		</tr>
		<tr>
			<th class="m3">상품명</th>
			<td align="left"><%=dto.getPname()%></td>
			<th class="m3">제조회사</th>
			<td align="left"><%=dto.getPcompany()%></td>
		</tr>
		<tr>
			<th class="m3"  height="30%">상품이미지</th>
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
			<th class="m3">상품수량</th>
			<td align="left"><%=dto.getPqty()%></td>
			<th class="m3">가격</th>
			<td align="left"><%=dto.getPrice()%></td>
		</tr>
		<tr>
			<th class="m3">상품스펙</th>
			<td align="left"><%=dto.getPspec()%></td>
			<th class="m3">상품포인트</th>
			<td align="left"><%=dto.getPoint()%></td>
		</tr>
		<tr>
			<th class="m3" height="30%">상품소개</th>
			<td align="left" colspan="3"><%=dto.getPcontents()%></td>
		</tr>
	</table>
</div>
<%@ include file="bottom.jsp"%>