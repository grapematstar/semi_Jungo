
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tt.product.ProductDTO"%>
<jsp:useBean id="pdto" class="tt.product.ProductDTO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>==== Team 2 ==== 사진 올리기</title>
<script>
function fileUpload(){
	
	var filename = document.upload.upload.value;
			
	document.upload.fname.value = filename;
			
	opener.document.sportReWrite.picpath.value = filename;
	
}
</script>
</head>
<body>
<fieldset>
	<form name="upload" method="post" enctype="multipart/form-data" action="upload_ok.jsp" >
		<legend>사진 올리기</legend>
		사진선택 : <input type="file" name="upload" onchange='fileUpload()' >
		<input type="text" name="fname">
		<input type="submit" value="파일올리기" >
	</form>
</fieldset>
</body>
</html>