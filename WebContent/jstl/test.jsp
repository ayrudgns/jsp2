<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>


<body>
	<h3>JSTL</h3>
	<hr>
	<ul>
		<li>JavaServer pages Standard Tag Library</li>
		<li>왜 써요? => 스크립트 릿은 자바 코드 조각으로, html 문서의 태그들 사이에 존재할 때 가독성 문제가 발생한다.</li>
		<li>스크립트 릿에 많이 사용되는 for, if 등을 태그로 제공한다.</li>
		<li>JSTL 라이브러리가 필요함!</li>
		<li>JSTL은 el과 함께 사용된다.(el은 라이브러리 추가 없이 사용할 수 있다.)</li>		
		<li>el은 expression language로, 기호 $&#123; &#125;를 사용한다.(<%-- <%= %> --%>기호 대신 사용)</li>
		<li>애트리뷰트 .getAttribute() 메소드 동작 실행 후 출력된다.</li>
	</ul>
	
	<h4>자바 변수처럼 값을 저장하기</h4>
		<c:set var="age" value="13" />
		age : ${age}<br>					<!-- XSS 해킹 공격에 취약한 형식 -->
		age : <c:out value="${ age }" />	<!-- el 출력할 때 사용 (엄격한 형식을 적용하는 방법) -->
	<hr>

	<h4>if : test는 조건식 속성이다.</h4>
		<c:if test="${ age < 20 }">
			<div style="color:green;">청소년입니다.</div>
		</c:if>
			<c:if test="${ age >= 20 }"> 
			<div style="color:red;">성인입니다.</div>
		</c:if>
	<h4>if ~ else 대신에 c:choose</h4>
		<c:choose>
			<c:when test="${ age < 15 }">
			<div style="color: pink;">어린이입니다.</div>
			</c:when>
			<c:when test="${ age < 23 }">		<!-- 첫번째 조건이 거짓일 때만 실행한다. -->
			<div style="color: violet;">청소년입니다.</div>
			</c:when>
			<c:otherwise>
			<div style="color:red;">성인입니다.</div>
			</c:otherwise>
		</c:choose>
	<button onclick="test()">테스트</button>

<script type="text/javascript">
	function test() {
		alert('${age}');			// el
	}		
</script>	

	<h4>forEach</h4>
		<!-- var 속성은 변수 이름 -->
		<c:forEach var="i" begin="1" end="10">		<!-- step="1" 생략됨. -->
			<c:out value="${ i }" />
			<c:out value="${ i * 10 }" /><br>
		</c:forEach>
		<br>
		<!-- varStatus는 현재 상태를 저장할 변수이다. -->
		<c:forEach var="x" begin="10" end="30" step="2" varStatus="status">
			<c:out value="${ x }" />, index = 
			<!-- varStatus의  count 속성은 1에서 시작하여 몇번째 값인지 확인할 수 있다. -->
			<c:out value="${ status.index }" /><br>
		</c:forEach>
		
	<h4>forTokens</h4>
		<c:set var="twice" value="사나,나연,다현,모모" />
		<ul>
			<c:forTokens items="${ twice }" var="member" delims=",">
				<li>
					<c:out value="${ member }" />
				</li>
			</c:forTokens>
		</ul>
	
</body>
</html>