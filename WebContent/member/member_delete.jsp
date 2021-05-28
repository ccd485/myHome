<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" />
<jsp:setProperty property="pool" name="mbdao" value="<%=pool %>"/>
<%
		//1. 넘어온 데이터 받기
		String no = request.getParameter("no");
		if (no==null || no.trim().equals("")){
			response.sendRedirect("memberAll.jsp");	//서버단에서 페이지 이동을 시켜주는 명령어
			return;
		}
		int res = mbdao.deleteMember(Integer.parseInt(no));
		String msg = null, url = null; 
		if (res>0){
			msg = "회원삭제성공!! 회원목록페이지로 이동합니다.";
			url = "memberAll.jsp";
		}else {
			msg = "회원삭제실패!! 회원관리페이지로 이동합니다.";
			url = "memberAll.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>