<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board2.*"%>
<!-- updateForm.jsp -->
<jsp:useBean id="dao" class="my.board2.Board2DataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="dao" value="<%=pool%>"/>

<%
		String num = request.getParameter("num");
		if (num == null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		Board2DBBean dto = dao.getBoard(Integer.parseInt(num), "update");		
%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css"> 
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("�̸��� �Է��� �ּ���!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("������ �Է��� �ּ���!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("������ �Է��� �ּ���!!")
			f.content.focus()
			return false
		}
		
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<div align="center">
	<form name="f" action="updatePro.jsp?num=<%=num%>" method="post" 
		enctype="multipart/form-data" onsubmit="return check()">
		<table border="1" width="500">
			<tr bgcolor="yellow">
				<td colspan="2" align="center">�� �� ��</td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">�� ��</td>
				<td><input type="text" name="writer" class="box" value="<%=dto.getWriter()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">�� ��</td>
				<td><input type="text" name="subject" size="40" class="box" value="<%=dto.getSubject()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">Email</td>
				<td><input type="text" name="email" size="40" class="box" value="<%=dto.getEmail()%>"></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">�� ��</td>
				<td><textarea rows="11" cols="40" name="content" class="box"><%=dto.getContent()%></textarea></td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">����</td>
				<td>
				<input type="file" name="filename" size="40" class="box">
				<input type="hidden" name="filename2" value="<%=dto.getFilename()%>">
				</td>
			</tr>
			<tr>
				<td align="center" width="20%" bgcolor="yellow">��й�ȣ</td>
				<td><input type="password" name="passwd" class="box"></td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="yellow" align="center">
					<input type="submit" value="�ۼ���">
					<input type="reset" value="�ٽ��ۼ�">
					<input type="button" value="��Ϻ���" onclick="window.location='list.jsp'">
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>







