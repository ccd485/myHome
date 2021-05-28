<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<%
	MultipartRequest mr = null;
	String upPath = config.getServletContext().getRealPath("/ex_fileUpload");
	out.println(upPath);
	
	try{
		mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		//(request,저장할위치, 최대크기, 인코딩언어)
		out.println("업로드성공!");
	}catch(IOException e){
		e.printStackTrace();
	}
%>
<hr color = "blue">
<li> 올린이 : <%=mr.getParameter("name")%> </li>
<li> 파일명 : <%=mr.getFilesystemName("filename")%> </li>
<li> 컨텐트타입 : <%=mr.getContentType("filename")%> </li>
<li> 파일크기 :
<%
	File file = mr.getFile("filename");
	long filesize = 0L;
	if(file !=null){
		filesize = file.length();
	}
%> 
<%=filesize%>bytes</li>
