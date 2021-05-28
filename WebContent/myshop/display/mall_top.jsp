<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<!-- mall_top.jsp -->
<jsp:useBean id="ctdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="ctdao" value="<%=pool%>"/>
<%
		List<CategoryDTO> cateList = ctdao.listCategory();
		if (cateList == null || cateList.size()==0){%>
		<script type="text/javascript">
			alert("쇼핑몰 준비중입니다!!");
			location.href="<%=request.getContextPath()%>/index.jsp";
		</script>
<%		return;
		}
%>
<html>
<head>
	<title>쇼핑몰홈</title>
	<link rel="stylesheet" type="text/css" href="../../style.css">
	<script type="text/javascript">
		function catelist(cname, code){
			document.f.action = "mall_cgProdList.jsp"
			document.f.cname.value = cname
			document.f.code.value = code
			document.f.submit()
		}
	</script>	
</head>
<body>
	<table border="1" align="center" width="800" height="650">
		<tr height="50">
			<td align="center" colspan="2">
				<a href="<%=request.getContextPath()%>/index.jsp">HOME | </a>
				<a href="../admin/main.jsp">관리자홈 | </a>
				<a href="mall.jsp">쇼핑몰홈 | </a>
				<a href="mall_cartList.jsp">장바구니 | </a>
				<a href="<%=request.getContextPath()%>/company.jsp">회사소개</a>
			</td>
		</tr>
		<tr>
			<td width="20%" valign="top" align="center">
				Tree/view
				<table border="1" width="100%">
				<%for (CategoryDTO dto : cateList){ %>
					<tr>
						<td>
							<a href="javascript:catelist('<%=dto.getCname()%>','<%=dto.getCode()%>')">
								<%=dto.getCname()%>[<%=dto.getCode()%>]
							</a>
							<%-- <a href="mall_cgProdList.jsp?code=<%=dto.getCode()%>&cname=<%=dto.getCname()%>">
								<%=dto.getCname()%>[<%=dto.getCode()%>]
							</a> --%>
						</td>
					</tr>
				<%} %>
				</table>
				<form name="f" method="post">
					<input type="hidden" name="cname">
					<input type="hidden" name="code">
				</form>
			</td>
			<td width="80%">