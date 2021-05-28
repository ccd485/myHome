<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="my.member.*" %>    
<%
		request.setCharacterEncoding("EUC-KR");
		String mode = request.getParameter("mode");
		if (mode==null){
			mode = "all";
		}
%>
<!-- memberAll.jsp -->
<jsp:useBean id="mbdao" class="my.member.MemberDAO" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>"/>

<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<div align="center">
	<hr color="green" width="300">
<%	if (mode.equals("all")){ %>	
	<h2>회 원 목 록 보 기</h2>
<%	}else { %>
	<h2>회 원 찾 아 보 기</h2>
	<form name="f" method="post">
	<!-- form태그에서 action 값이 없으면 자신의 페이지로 그대로 이동한다. -->
		<select name="search">
			<option value="id">아이디</option>
			<option value="name">회원명</option>
		</select>
		<input type="text" name="searchString">
		<input type="submit" value="찾기">
	</form>
	<jsp:setProperty property="*" name="mbdao" />
<%	} %>	
	<hr color="green" width="300">
	<table width="100%" class="outline">
		<tr>
			<th class="m3">번호</th>
			<th class="m3">이름</th>
			<th class="m3">아이디</th>
			<th class="m3">이메일</th>
			<th class="m3">전화번호</th>
			<th class="m3">가입일</th>
			<th class="m3">수정 | 삭제</th>
		</tr>
<%	//여기에 DB에서 자료를 가져와 출력시켜준다.
		List<MemberDTO> listMember = null;
		if (mode.equals("all")) listMember = mbdao.listMember();
		else listMember = mbdao.findMember();
		  
		if (listMember==null || listMember.size()==0){%>
		<tr>
			<td colspan="7">등록된 회원이 없습니다.</td>
		</tr>
<%	}else { 
			for(MemberDTO dto : listMember){%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=dto.getAllHp()%></td>
			<td><%=dto.getJoindate()%></td>
			<td>
			<a href="member_update.jsp?no=<%=dto.getNo()%>">수정</a> | 
			<a href="member_delete.jsp?no=<%=dto.getNo()%>">삭제</a></td>
		</tr>	
<%		} 			
		} %>		
	</table>
</div>
<%@ include file="../bottom.jsp"%>












