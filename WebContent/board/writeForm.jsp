<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- writeForm.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<%-- <%@ include file="../loginCheck.jsp"%>  --%>
<script type="text/javascript">
	function check(){
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<%
		int num = 0, re_step = 0, re_level = 0, re_group = 0;
		String snum = request.getParameter("num");
		if (snum != null){		//답글이냐?
				//답글이면 num, re_step, re_level값을 받아오고, 아니면 0으로 전송시켜준다
			num = Integer.parseInt(snum);
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
			re_group = Integer.parseInt(request.getParameter("re_group"));
		}
%>
<div align="center">
	<form name="f" action="writePro.jsp" method="post" onsubmit="return check()">
		<input type="hidden" name="num" value="<%=num%>" />
		<input type="hidden" name="re_step" value="<%=re_step%>"/>
		<input type="hidden" name="re_level" value="<%=re_level%>"/>
		<input type="hidden" name="re_group" value="<%=re_group%>"/>
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td colspan="2" align="center">글 쓰 기</td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">이 름</td>
				<td><input type="text" name="writer" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">제 목</td>
				<td><input type="text" name="subject" size="40" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">Email</td>
				<td><input type="text" name="subject" size="40" class="box"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">내 용</td>
				<td><textarea rows="11" cols="40" name="content" class="box"></textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">비밀번호</td>
				<td><input type="password" name="passwd" class="box"></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="yellow" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>








