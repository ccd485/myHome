<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.board2.*"%>
<!-- list.jsp -->
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css"> 
<jsp:useBean id="dao" class="my.board2.Board2DataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="dao" value="<%=pool%>"/>

<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="100%">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="100%">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th width="30%">����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>IP</th>
		</tr>
<%		List<Board2DBBean> list = dao.listBoard(); 
			if (list == null || list.size()==0){%>
		<tr>
			<td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td>
		</tr>	
<%		}else {
				for(Board2DBBean dto : list){%>
		<tr>
			<td><%=dto.getNum()%></td>
			<td><a href="content.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a></td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
		</tr>							
<%			}
			}%>
	</table>
</div>
<%@ include file="../bottom.jsp"%>









