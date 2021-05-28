<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="catedao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="catedao" value="<%=pool %>"/>
<%
		//1. 넘어온 데이터 받기
		String cnum = request.getParameter("cnum");
		if (cnum==null || cnum.trim().equals("")){
			response.sendRedirect("cate_list.jsp");	//서버단에서 페이지 이동을 시켜주는 명령어
			return;
		}
		int res = catedao.deleteCategory(Integer.parseInt(cnum));
		String msg = null, url = null; 
		if (res>0){
			msg = "카테고리삭제성공!! 목록페이지로 이동합니다.";
			url = "cate_list.jsp";
		}else {
			msg = "카테고리삭제실패!! 목록페이지로 이동합니다.";
			url = "cate_list.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>