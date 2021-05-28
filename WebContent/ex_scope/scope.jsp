<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="obj" class="my.scope.Counter" scope="request"/>
<jsp:setProperty name="obj" property="*"/>

<h2>request Scope</h2>
<b>obj의 getCount() 호출 값 :</b>
<jsp:getProperty property="count" name="obj"/>
<br>
<jsp:forward page="result.jsp"/>