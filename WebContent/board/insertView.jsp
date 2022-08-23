<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리 동네 커뮤니티 글쓰기</title>
<style type="text/css">

table {
	width : 700px;
	margin: auto;
	
}

th {
		text-align: center;
		background-color: #4080bf;
		font-size:90%;
		color: white;
		width: 35%;
		border-radius : 3px;
}


.btn {
	width: 70px;
	cursor : pointer;
}

</style>
</head>

<body>
	<form name="frm1" method="post" action="insertAction.jsp">
	<h3>우리 동네 커뮤니티 글쓰기</h3>
	<hr>
	<%= request.getRemoteAddr() %>
 <table>
 	<tr><th>제목</th>
 		<td><input type="text" name="subject" size="50" required></td>
 	</tr>
 	<tr>
		<th>작성자</th>
 		<td><input type="text" name="writer" size="50" required></td>
 	</tr>
 	
 	<tr><th>글 비밀번호</th>
 		<td><input type="password" name="password" required></td>
 	</tr>
 	<tr><th>내용</th>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td><textarea  rows="20" cols="80" name="content" required></textarea>
 		<!--textarea 는 multi line 입력이 됩니다. (enter로 줄바꿈 가능!)  --></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btn" >
 	<input type="reset"  value="다시쓰기" class="btn">
 	<input type="button" value="목록" onclick="location.href='listAction.jsp?page=${param.page}'" class="btn">
 									<%-- <%= request.getParameter(name) %>를 el 표기로 변경할 때는 param 키워드.파라미터 이름  --%>
 	</td></tr>
 </table>
 </form>
	


</body>
</html>