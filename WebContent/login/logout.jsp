<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// logout을 하게 되면!
	// 현재 세션(ID)를 무효화하거나 세션에 저장된 애트리뷰트 삭제하기

	session.invalidate();		// 방법 1) 현재 세션 무효화
//	session.removeAttribute("user");	// 방법 2) 세션에 저장된 애트리뷰트 삭제

	response.sendRedirect("../index.jsp");
	// 로그아웃된 상태를 확인할 수 있게 home.jsp로 redirect 해준다!
				// 자바 코드로 새로운 요청을 보낸다. (서버 단(톰캣)에서 처리함)
				// 자바스크립트로 새로운 요청을 보낼 때는 location.href 활용 (클라이언트 단에서 처리함)
				
//	out.print("<script>");			
//	out.print("location.href='home.jsp';");
//	out.print("</script>");
//	이렇게 처리하면 서버 단에서 처리하는 것이 아닌 클라이언트 단에서 처리하게 되므로 처리 시간이 더 오래 걸린다.
//	(저기까지 갔다와야 됨)
				
%>
