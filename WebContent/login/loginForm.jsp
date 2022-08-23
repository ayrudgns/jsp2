<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면 (Form)</title>
</head>


<body>
	<div>
		<!-- <form action="Login.jsp" method="post"> -->
		<form action="Login.jsp?back=${param.back}&idx=${param.mref}&page=${param.page}" method="post">
		<!-- back, idx, page 3개 파라미터는 댓글 작성 옆 로그인 버튼을 클릭했을 때, 로그인 후 돌아갈 detailAction.jsp에 필요한 값이다. -->
			<input name="userid" placeholder="아이디(이메일)을 입력하세요!"><br>
			<input name="password" placeholder="비밀번호를 입력하세요!" type="password"><br>
			<button>로그인</button>		<!-- type="submit" (디폴트) -->
			<!-- 상대경로 지정 : ../는 한단계 위 상위폴더 -->
			<button type="button" onclick="../index.jsp">홈</button>
		</form>
	</div>

</body>
</html>