<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<h2>result.jsp ������ �Դϴ�</h2>
<b>request: obj�� getCount() �� :</b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="test_scope.html">ó������</a>