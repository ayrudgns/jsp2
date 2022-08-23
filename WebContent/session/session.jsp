<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 테스트</title>
</head>

<body>
	<div>http 프로토콜은 stateless(상태정보 유지 X), 비연결지향 (참고 : 카카오톡(메신저)은 연결지향)<br>
	     -> 웹서버와 브라우저 사이의 연결 정보(사용자 구분)를 저장하는 방법을 사용한다. (session 객체에 저장)<br>
	     -> request를 통해서 브라우저의 세션 ID가 부여되고  그 값으로 구별.<br>
	     -> 로그인 기능 구현에 활용한다.<br>
	     -> 톰캣은 이름 JSESSIONID 값을 만든다.<br>
	     -> 세션 유효 시간은 서버에서 설정 : web.xml 확인(모든 프로젝트에 적용)<br>
	     -> 또는 session.setMaxInactiveInterval(초 단위 시간 지정)으로 할 수 있다.<br>
	</div>
	<hr>
	<!--  
	    <session-config>
      	 	 <session-timeout>30</session-timeout>
    	</session-config>
    	마지막 요청시간으로부터 30분간 session이 유효하다.
	-->
	<h3>session 정보 확인</h3>
<%
		String id = session.getId();
		out.print("session ID : " + id);		// 16진수 32자리 (32*4비트 = 128비트)
		out.print("<br>");
		
		long create = session.getCreationTime();	// session 객체가 만들어진 시간 (첫번째 요청)
		out.print("session 생성 시간 : " + create);	// timestamp(1970년 1월 1일 기준, 단위는 ms)
		out.print("<br>");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		out.print("session 생성 시간 : " + df.format(create));
		out.print("<br>");
		
		long last = session.getLastAccessedTime();	// session 객체에 대한 최근 요청 시간
		out.print("session 마지막 접근 시간 : " + last);
		out.print("<br>");
		out.print("session 마지막 접근 시간 : " + df.format(last));
		out.print("<br>");
		// session ID를 개발자 도구 > 애플리케이션 > 쿠키 가서 삭제하고 새로고침 하면 session ID가 새로 생성됨.
		
		// 메소드를 활용하여 timeout 시간 변경하기
		session.setMaxInactiveInterval(180);		// 180초
		session.setAttribute("session_user", "김땡땡");
%>
		<br><a href="sessionAttr.jsp">세션 애트리뷰트 확인</a>
</body>
</html>