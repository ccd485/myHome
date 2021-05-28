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
		var isDel = window.confirm("삭제 하시겠습니까?")
		if (isDel){
			location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage
		}
	}
</script>
<div align="center">
	<h4>상품목록</h4>
	<table align="center" border="1" width="800">
		<tr>
			<th width="5%">번호</th>
			<th width="15%">상품코드</th>
			<th width="25%">상품명</th>
			<th width="10%">이미지</th>
			<th width="10%">가격</th>
			<th width="10%">제조사</th>
			<th width="10%">수량</th>
			<th width="15%">수정|삭제</th>
		</tr>
<%	//여기에 DB에서 자료를 가져와 출력시켜준다.
		List<ProductDTO> listProduct= null;
		listProduct = proddao.listProduct();
		  
		if (listProduct==null || listProduct.size()==0){%>
		<tr>
			<td colspan="8">등록된 카테고리가 없습니다.</td>
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
			<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">수정</a>|
			<a href="javascript:checkDel('<%=dto.getPnum()%>','<%=dto.getPimage()%>')">삭제</a></td>
		</tr>
<%		}
		} %>
	</table>
</div>
<%@ include file="bottom.jsp"%>












