<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<jsp:useBean id="wf" class="tt.wf.WebFolderDAO" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>==== Team 2 ==== 글쓰기</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script>
function imgUpload(){
		window.open('/semi_Jungo/upList/uploadForm_sport.jsp','upload','width=380,height=180');
}
</script>

</head>

<style>
.s_WriteTable {
	border-top: 3px double black;
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;
}

.s_WriteTable th {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	width: 250px;
}

.s_WriteTable_tdcol {
	border-bottom: 1px solid black;
}

.s_Write_Bt {
	background-color: white;
	border: 1px solid black;
	margin: 0px 5px 0px 5px;
}

.s_WriteContent {
	width: 630px;
	padding: 5px;
	border: 1px solid gray;
	margin: 5px;
	border-radius: 5px;
}
</style>
<%
	
	// 로그인이 필요한 메뉴에서는 필수적으로 사용하는 코드이기때문에 따로 저장하게 되면 모듈이 된다.
	String sid = (String) session.getAttribute("sid");
	if (sid == null || sid.equals("")) {
%>
<script>
	window.alert('로그인 후 서비스 이용이 가능합니다.');
	location.href = '/semi_Jungo/login.jsp';
</script>
<%
	return;
	}

	String absPath = this.getServletContext().getRealPath("/");
	String saveFolder = "productImg";
	absPath = absPath + saveFolder;
	System.out.println("absPath="+absPath);
	wf.setUsers_home(absPath);
	wf.setUser(sid);
	
	String path = absPath + "/" + wf.getUser() + "/";
	System.out.println("path="+path);
	
	String cp = request.getParameter("cp");// 사용자의 현재경로 (current path)
	if(cp==null||cp.equals("")){
		cp = wf.getUser();
	}

	wf.setCr_path(cp);
	wf.isExists();
	String sort = request.getParameter("sort");
%>

<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2 align="center"><%=sort%>게시판 글쓰기</h2>
		<form name="sportWrite" action="sportWrite_ok.jsp">
		<input type="hidden" name="writer" value="<%=sid%>">
		<input type="hidden" name="sort" value="<%=sort%>">
			<table class="s_WriteTable">
				<tr>
					<th>제목</th>
					<td class="s_WriteTable_tdcol" colspan="2"><input type="text" name="subject" size="45" required maxlength="33"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="s_WriteTable_tdcol" colspan="2"><textarea class="s_WriteContent" rows="10" cols="45" name="content" id="content" required></textarea>
					</td>
				</tr>
				<tr>
					<th>사진 등록</th>
					<td class="s_WriteTable_tdcol" colspan="2">
					<input class="s_Write_Bt" type="button" value="사진 올리기" onclick="imgUpload()">
				
					<input type="hidden" name="picpath_path" value="/semi_Jungo/<%=saveFolder%>/<%=wf.getCr_path()%>/">
					
					<input type="text" name="picpath" readonly="readonly">
					
					</td>
				</tr>
				<tr>
					<td align="center" colspan="3"><input class="s_Write_Bt" type="submit" value="글쓰기">
					<input class="s_Write_Bt" type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>