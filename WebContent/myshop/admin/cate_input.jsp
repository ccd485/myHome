<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- index.jsp -->
<%@ include file="top.jsp"%>
<h2 align="center">ī�װ� ���</h2>
<form name="f" action="cate_input_ok.jsp" method="post">
	<table align="center" border="1">
		<tr align="center">
			<td  width="40%">ī�װ� �ڵ� </td>
			<td width="60%"><input type="text" name="code"></td>
		</tr>
		<tr align="center">
			<td width="40%">ī�װ� �̸� </td>
			<td width="60%"><input type="text" name="cname"></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="���"><input type="reset"value="���"></td>
		</tr>
	</table>
</form>
<%@ include file="bottom.jsp"%>