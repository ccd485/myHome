<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<jsp:useBean id="proddao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="proddao" value="<%=pool %>"/>
<%
		//1. 넘어온 데이터 받기
		request.setCharacterEncoding("EUC-KR");
		String pnum = request.getParameter("pnum");
		String pimage = request.getParameter("pimage");
		if (pnum==null || pnum.trim().equals("") || pimage==null || pimage.trim().equals("")){
			response.sendRedirect("prod_list.jsp");	//서버단에서 페이지 이동을 시켜주는 명령어
			return;
		}
		
		int res = proddao.deleteProduct(Integer.parseInt(pnum));
		String msg = null;
		if (res>0){
			String delPath = application.getRealPath("/myshop/files");
			File file = new File(delPath,pimage);
			if(file.exists()){
				file.delete();
				msg = "상품삭제성공!! 상품목록페이지로 이동합니다.";
			}else{
				msg = "상품삭제성공!!(이미지 삭제는 실패했습니다)! 상품목록페이지로 이동합니다.";
			}
		}else {
			msg = "상품삭제실패!! 목록페이지로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="prod_list.jsp"
</script>