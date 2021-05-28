<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<h2>result.jsp 페이지 입니다</h2>
<b>request: obj의 getCount() 값 :</b>
<jsp:getProperty property="count" name="obj"/>
<br>
<a href="test_scope.html">처음으로</a>