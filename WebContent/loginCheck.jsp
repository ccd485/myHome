<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- loginCheck.jsp -->
<%
		String mbId = (String)session.getAttribute("id");
		String mbName = (String)session.getAttribute("name");
		
		if (mbId==null || mbName==null){%>
		<script type="text/javascript">
			alert("로그인을 먼저 해 주세요!!")
			location.href="<%=request.getContextPath()%>/login/login.jsp"
		</script>	
<%		return;
		}%>