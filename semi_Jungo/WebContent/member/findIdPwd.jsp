<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2{
	text-align: center;
}
</style>
</head>
<body>
<%@include file="../header.jsp"%>
<section>
<article>
<h2>| 아이디 비밀번호 찾기 |</h2>

<form name="findId" action="findId_ok.jsp">
		<fieldset>
			<legend>아이디 찾기</legend>
			<div><label>이름</label>
			<input type="text" name="name" size="20"></div>
			
			<div><label>전화번호</label>
			<input type="text" name="tel1" size="4">-<input type="text" name="tel2" size="4">-<input type="text" name="tel3" size="4"><div>
			<input type="submit" value="찾기">
		</fieldset>
</form>

<form name="findPwd" action="findPwd_ok.jsp">
		<fieldset>
				<legend>비밀번호 찾기</legend>
			<div><label>아이디</label>
			<input type="text" name="id" size="20"></div>
			
			<div><label>전화번호</label>
			<input type="text" name="tel1" size="4">-<input type="text" name="tel2" size="4">-<input type="text" name="tel3" size="4"><div>
			<input type="submit" value="찾기">
	
		</fieldset>
</form>

</article>
</section>
<%@include file="../footer.jsp"%>
</body>
</html>