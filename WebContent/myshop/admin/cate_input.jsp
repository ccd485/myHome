<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- index.jsp -->
<%@ include file="top.jsp"%>
<h2 align="center">카테고리 등록</h2>
<form name="f" action="cate_input_ok.jsp" method="post">
	<table align="center" border="1">
		<tr align="center">
			<td  width="40%">카테고리 코드 </td>
			<td width="60%"><input type="text" name="code"></td>
		</tr>
		<tr align="center">
			<td width="40%">카테고리 이름 </td>
			<td width="60%"><input type="text" name="cname"></td>
		</tr>
		<tr align="center">
			<td colspan="2"><input type="submit" value="등록"><input type="reset"value="취소"></td>
		</tr>
	</table>
</form>
<%@ include file="bottom.jsp"%>