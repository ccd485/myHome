<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<!-- deletePro.jsp -->
<jsp:useBean id="dao" class="my.board2.Board2DataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="dao" value="<%=pool%>"/>

<%
		String num = request.getParameter("num");
		String filename = request.getParameter("filename");
		String passwd = request.getParameter("passwd");
		if (num==null || passwd==null || num.trim().equals("") || passwd.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		int res = dao.deleteBoard(Integer.parseInt(num),filename,passwd);
		String msg = null, url = null;
		if (res>0){
			String delPath = application.getRealPath("/board2/files");
			File file = new File(delPath,filename);
			if(file.exists()){
				file.delete();
				msg = "글삭제 성공!! 글목록페이지로 이동합니다.";
				url = "list.jsp";
			}else{
				msg = "글삭제성공!!(파일 삭제는 실패했습니다)! 상품목록페이지로 이동합니다.";
				url = "list.jsp";
			}
		}else if (res<0){
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요!!";
			url =  "content.jsp?num="+num;
		}else {
			msg = "글삭제 실패!! 글보기 페이지로 이동합니다.";
			url = "content.jsp?num="+num;
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>






