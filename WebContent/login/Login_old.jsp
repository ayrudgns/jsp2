<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");

	// userid="admin@gmail.com", password="12345"로 가정한다.
	
		out.print("<script>");
	// (임시 테스트)		
	if(userid.equals("admin@gmail.com") && password.equals("12345")) {
		// 인증 성공 => session 객체에 필요한 데이터를 애트리뷰트에 저장한다.
		// 여기서 말하는 필요한 데이터는 '사용자 정보'이다.
		session.setAttribute("user", userid);		
		session.setAttribute("sessionId", session.getId());		
		out.print("alert('로그인 완료!');");
		out.print("location.href='home.jsp';");					
	} else {
		// 인증 실패
		out.print("alert('로그인 계정 정보가 다릅니다.');");
		out.print("location.href='loginForm.jsp';");		
	}
		out.print("</script>");
	
	
%>