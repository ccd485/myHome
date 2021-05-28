<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<jsp:useBean id="proddao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="proddao" value="<%=pool %>"/>

<%
		request.setCharacterEncoding("EUC-KR");
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/myshop/files");
		System.out.println(upPath);
		
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
			//(request,저장할위치, 최대크기, 인코딩언어)
			out.println("업로드성공!");
		}catch(IOException e){
			e.printStackTrace();
		}

		
		int res = proddao.insertProduct(mr);
		if (res>0){%>
		<script type="text/javascript">
			alert("상품등록 성공!!")
			location.href="prod_list.jsp"
		</script>	
<%	}else {%>
		<script type="text/javascript">
			alert("상품 실패!! 카테고리등록페이지로 이동합니다.")
			location.href="prod_input.jsp"
		</script>
<%	}%>