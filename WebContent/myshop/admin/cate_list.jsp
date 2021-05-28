<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="my.shop.*" %>    
<!-- memberAll.jsp -->
<jsp:useBean id="catedao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="catedao" value="<%=pool%>"/>

<%@ include file="top.jsp" %>
<div align="center">
	<h2>카테고리목록</h2>
	<table align="center" border="1" width="500">
		<tr>
			<th>번호</th>
			<th>카테고리 코드</th>
			<th>카테고리 명</th>
			<th>삭제</th>
		</tr>
<%	//여기에 DB에서 자료를 가져와 출력시켜준다.
		List<CategoryDTO> listCategory= null;
		 listCategory = catedao.listCategory();
		  
		if (listCategory==null || listCategory.size()==0){%>
		<tr>
			<td colspan="4">등록된 카테고리가 없습니다.</td>
		</tr>
<%	}else { 
			for(CategoryDTO dto : listCategory){%>
		<tr>
			<td><%=dto.getCnum()%></td>
			<td><%=dto.getCode()%></td>
			<td><%=dto.getCname()%></td>
			<td>
			<a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">삭제</a></td>
		</tr>	
<%		} 			
		} %>		
	</table>
</div>
<%@ include file="bottom.jsp"%>












