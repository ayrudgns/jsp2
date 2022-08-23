<%@page import="board.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="board.dao.CommentDao"%>
<%@page import="board.vo.Freeboard"%>
<%@page import="board.dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	// 글 상세보기를 클릭한 페이지 번호를 파라미터로 가져오는 이유 : 글 상세보기에서 다시 글 목록으로 돌아갈 때를 위해서!
	// '목록으로' : 보고 있던 글 목록 페이지로 돌아가기
	
	// 메인글 idx의 댓글 목록을 애트리뷰트에 저장 (먼저 처리해야 할 부분 : 댓글 개수 update)
	CommentDao cmtdao = CommentDao.getInstance();
	cmtdao.updateCmtCount(idx);		// idx 값이 comment 테이블에서는 mref 값이므로!
	List<Comment> cmtlist = cmtdao.getComments(idx);
	request.setAttribute("cmtlist", cmtlist);	
	
	FreeboardDao freedao = FreeboardDao.getInstance();
	freedao.readcountUp(idx);
	Freeboard bean = freedao.getDetail(idx);
	
	request.setAttribute("page", pageNo);
	request.setAttribute("bean", bean);
	
	pageContext.forward("detailView.jsp");		// 화면 페이지로 애트리뷰트와 함께 요청 전달
%>