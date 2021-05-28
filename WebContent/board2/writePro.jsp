<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<!-- writePro.jsp -->

<jsp:useBean id="dao" class="my.board2.Board2DataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="dao" value="<%=pool%>"/>

<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/board2/files");
		
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
			//(request,저장할위치, 최대크기, 인코딩언어)
		}catch(IOException e){
			e.printStackTrace();
%> 		<script type="text/javascript">
				alert("파일 업로드 중 오류 발생!!")
				location.href="list.jsp"
			</script>
<%	}
		
		String ip = request.getRemoteAddr();
		int res =  dao.insertBoard(mr,ip);
		if (res>0){%>
		<script type="text/javascript">
			alert("게시글 등록 성공!! 게시글 목록 페이지로 이동합니다.")
			location.href="list.jsp"
		</script>
<%	}else {%>
		<script type="text/javascript">
			alert("게시글 등록 실패!! 게시글 등록 페이지로 이동합니다.")
			location.href="writeForm.jsp"
		</script>
<%	}%>











