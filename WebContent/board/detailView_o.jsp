<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- core : 중요한 기능을 구현하기 위한 태그 라이브러리 설정 (if, for, ...) -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- fmt : 출력 포맷을 사용하기 위한 태그 라이브러리 설정 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- functions : 문자열 함수를 사용하기 위한 태그 라이브러리 설정 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/css/detail.css?v=3">
</head>
<body>		<!-- 메인글 : 익명 게시판으로 가정 (글 비밀번호 사용), 댓글 : 실명 댓글로 가정(로그인 해야 댓글 작성 및 삭제가 가능) -->
<main>
	<h3>우리 동네 커뮤니티 글 상세보기</h3>
	<hr>
	<div style="width: 80%; margin: auto;max-width: 700px;">
		<ul id="main">
			<li>
				<ul class="row">
					<li>제목</li>
					<li>${bean.subject}</li>
					<li>조회수</li>
					<li>${bean.readCount}</li>
				</ul>
			</li>
			<li>
				<ul class="row">
					<li>작성자</li>
					<li>${bean.writer}<span
				style="font-size: 70%; padding-left: 30px;">(${bean.ip})</span></li>
					<li>작성날짜</li>
					<li><fmt:formatDate value="${bean.wdate }" type="both"/></li>
					<!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
														<!-- 날짜만, 시간만, 둘다 -->
				</ul>
			</li>
			<li id="content">
				<ul>
					<li>내용</li>			
					<!-- textarea에 입력한 엔터는 \n db에도 \n으로 저장됩니다.
					     브라우저 출력은 줄바꿈은 <br> 태그 해결1) pre 태그, 해결2) \n을 <br>로 대치 -->	
					<li>
						<pre>${bean.content}</pre>
							<!-- 엔터를 바꿔줌! -->
					</li>				
				</ul>
			</li>
		</ul>
	<div style="text-align: center;margin-bottom: 10px;">
		<a class="button" href="updateAction.jsp?idx=${bean.idx}">수정</a>
		<!-- 예시 : 글 비밀번호 입력해서 삭제하기 -->
		<a class="button" href="javascript:deleteSet()">삭제</a>
		<a class="button" href="listAction.jsp?page=${ page }">목록</a>
	</div>
	<!-- 메인글 출력 끝 -->

	<hr>
	<!-- 댓글 등록 -->
	<form action="commentAction.jsp" method="post">
	<!-- 필요한 파라미터이지만 화면에는 표시하지 않음 : 메인글의 idx, 현재 글의 페이지 번호 (총 2개) -->
	<input type="hidden" name="mref" value="${ bean.idx }">
	<input type="hidden" name="page" value="${ page }">

		<ul id="main">
			<li>
				<ul class="row">
					<li>작성자</li>		<!-- 1) 로그인한 사용자가 작성할 때는 로그인 이메일, 닉네임 가져와서 표시하기 -->
					<li><input name="writer" class="input"></li>
<!-- 					<li>글 비밀번호</li>	댓글 삭제 : 1) 로그인한 사용자가 본인 글 삭제 or 2) 글 비밀번호 사용
					<li><input name="password" class="input" type="password"></li> -->
				</ul>
			</li>
			<li>
				<ul style="display: flex;">
					<li>
						<textarea rows="5" cols="60" name="content" 
							style="resize: none;" placeholder="댓글을 작성하세요."></textarea>
					</li>
					<li style="align-self: center; margin-bottom: 20px;">
					<!--
						sessionScope.user는 session에 저장된 애트리뷰트 user를 가져온다.
						sessionScope를 생략할 수 있지만 request, application 등 다른 영역에 중복된 이름이 있을 때를
						고려하여 명시적으로 지정한다. 
					-->
						<c:if test="${ sessionScope.user != null }">	<!-- 로그인 했을 때 -->
							<button type="submit">저장</button>
							<button type="button" onclick="reset_content()">취소</button>
						</c:if>
						<c:if test="${ sessionScope.user == null }">	<!-- 로그인되지 않았을 때 -->
							<button type="button" onclick="login()">로그인</button>
						</c:if>
					</li>
				</ul>
			</li>
			<li>
				<span>댓글</span>
				<span>[${ bean.commentCount }]</span>		<!-- 댓글 개수 출력 -->
				<hr>
			</li>			
			<!-- 댓글 목록 -->
			<c:forEach var="cmt" items="${ cmtlist }">
			<li>
				<ul class="crow">
					<li>${ cmt.writer }</li>
					<li>${ cmt.ip }</li>
					<li>${ cmt.wdate }</li>
					<!-- 삭제 구현 1) 로그인한 사용자의 글만 삭제 버튼이 보이게 하기 -->
					<li><a href="javascript:deleteCmt('${ cmt.idx }', '${ bean.idx }')">삭제</a></li>
				</ul>
			</li>
			<li>
				<pre>${ cmt.content }</pre>			
			</li>
			</c:forEach>
		</ul>
	</form>
	</div>
	
<!-- 처음에는 display가 none : 보이지 않음 -->
<!-- modal : alert, confirm 함수를 사용하지 않고 추가적인 정보를 받을 때 사용자가 만드는 입력 상자...-->
	<div id="myModal" class="modal">
		<!-- Modal content : 모달 입력창-->
		<div class="modal-content">
			<span class="close" id="close">&times;</span><br>	<!-- 특수기호 코드  &times;는 x 기호 -->
			<div style="padding: 0px 20px;">
				<b>글비밀번호</b><br>
				<br>
				<form action="deleteAction.jsp" method="post" name="frmPassword">
					<input type="hidden" name="idx" value="${bean.idx }"> <!--삭제할 글번호-->
					<input type="hidden" name="page" value="${page }">
					<input
						type="password" name="password" size="10">
					<button style="padding: 5px 20px;">확인</button>
					<br>
					<span style="color:red;font-size:0.8em;" id="err"></span>
				</form>
			</div>
		</div>
	</div>
<!-- 모달 끝 -->
	<script type="text/javascript">
	// 모달 입력상자 닫기
	// let close = document.getElementsByClassName('close')[0];	// getElementsXX 이면 배열 리턴 -> 해당 요소 중 0번 인덱스
	const close = document.getElementById('close');
	close.onclick = function() {
		document.getElementById('myModal').style.display = 'none';		
	}
	
	// 메인글 삭제 함수 : 모달 입력 표시
		function deleteSet() {
			document.getElementById('myModal').style.display = 'block';
		}
	
	// 댓글 삭제 함수
		function deleteCmt(cmtidx, idx) {
			const yn = confirm('댓글 삭제하시겠습니까?');
			if(yn) {
				// 함수의 인자로 전달받은 2개의 값은 파라미터로 전달한다. 추가 파라미터 : del
				location.href = 'commentAction.jsp?del=y&page=${page}&cmtidx=' + cmtidx + '&idx=' + idx;
			} else {
				alert('댓글 삭제 취소합니다.');
			}
		}
		
	// 로그인한 사용자의 이메일을 작성자 입력란에 표시하기(읽기 전용)
		if('${sessionScope.user}' != null) {
			document.forms[0].writer.value = '${sessionScope.user.email}';
			document.forms[0].writer.readonly = true;
		}
	
		function login() {
			document.forms[0].action = '${pageContext.request.contextPath}/login/loginForm.jsp?back=detail';
			// 다시 현재 페이지로 돌아오기 위해 필요한 값 mref, page 요소 값을 전달한다. (textarea는 불필요)
			document.forms[0].content.disabled = true;
			document.forms[0].submit();
		}
		
		function reset_content() {
			documents.forms[0].content.value = "";
		}
		
	</script>
	</main>
</body>
</html>









