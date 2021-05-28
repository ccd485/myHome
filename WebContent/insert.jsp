<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<!-- my.student.StudentDAO stdao = new my.student.StudentDAO(); -->
<%
		//1. 넘어온 데이터 받기
		request.setCharacterEncoding("EUC-KR");//한글설정(post방식일때만 가능)
%>
<jsp:useBean id="stdto" class="my.student.StudentDTO" />
<jsp:setProperty property="*" name="stdto" />
<!-- stdto.setId(request.getParameter("id")); -->
<%		
		if (stdto.getId()==null || stdto.getName()==null || stdto.getCname()==null || 
			stdto.getId().trim().equals("") || stdto.getName().trim().equals("") || stdto.getCname().trim().equals("")){%>
		<script type="text/javascript">
			alert("아이디, 학생명, 학급명을 모두 입력해 주셔야 합니다.!!")
			history.back()
		</script>		
<%		return;//_jspService()메소드를 빠져나가라... 
		} 
		int res = stdao.insertStudent(stdto.getId(), stdto.getName(), stdto.getCname());
		
		if (res>0){%>
		<script type="text/javascript">
			alert("학생등록성공!! 학생목록페이지로 이동합니다.")
			location.href="list.jsp"
		</script>		
<%	}else {%>
		<script type="text/javascript">
			alert("학생등록실패!! 학생관리페이지로 이동합니다.")
			location.href="student.jsp"
		</script>			
<%	}%>









