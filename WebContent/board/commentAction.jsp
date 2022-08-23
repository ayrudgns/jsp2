<%@page import="board.vo.Comment"%>
<%@page import="board.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	CommentDao dao = CommentDao.getInstance();

	// 댓글 추가와 삭제 dao 메소드를 실행하는 Aciton 클래스
	//		ㄴ 댓글 삭제는 del 파라미터를 전달한다.
	String del = request.getParameter("del");
	if(del != null && del.equals("y")) {	// del이 null일 때, 첫번째 조건 false -> 두번째 조건 equals 메소드 실행 X
		// 댓글 삭제
		int cmtidx = Integer.parseInt(request.getParameter("cmtidx"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		dao.delete(cmtidx);
		response.sendRedirect("detailAction.jsp?idx=" + idx + "&page=" + request.getParameter("page")); 
		
	} else {
		// 댓글 등록
		// 댓글 등록을 위해 mref 컬럼값 가져오기! (반드시 필요함.)
		int mref = Integer.parseInt(request.getParameter("mref"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();
		
		Comment vo = new Comment(0, mref, writer, content, null, ip, 0);		
		dao.insert(vo);
		
		// 댓글 등록 확인을 위해 글 상세보기 페이지로 이동!
		response.sendRedirect("detailAction.jsp?idx=" + mref + "&page=" + request.getParameter("page"));
	}
	
	


%>