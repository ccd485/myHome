<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<%
	MultipartRequest mr = null;
	String upPath = config.getServletContext().getRealPath("/ex_fileUpload");
	out.println(upPath);
	
	try{
		mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		//(request,��������ġ, �ִ�ũ��, ���ڵ����)
		out.println("���ε强��!");
	}catch(IOException e){
		e.printStackTrace();
	}
%>
<hr color = "blue">
<li> �ø��� : <%=mr.getParameter("name")%> </li>
<li> ���ϸ� : <%=mr.getFilesystemName("filename")%> </li>
<li> ����ƮŸ�� : <%=mr.getContentType("filename")%> </li>
<li> ����ũ�� :
<%
	File file = mr.getFile("filename");
	long filesize = 0L;
	if(file !=null){
		filesize = file.length();
	}
%> 
<%=filesize%>bytes</li>
