<%@page import="java.io.PrintWriter"%>
<%@page import="dao.VideoDAO"%>
<%@page import="vo.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	String search = request.getParameter("search");
%>

<!-- 검색 -->
<section id="videos">
	<div class="videos-wrap container-12" style="min-height: 100vh;">
			<%
				VideoDAO viDao = new VideoDAO();
				ArrayList<VideoVO> caList = viDao.search(search);
				// 검색 결과 여부 체크
				
				if (caList.size() == 0) {
					%>
						<h1 class="text-center font-weight-bold" style="padding-top:300px; color: #97B9B9;">검색 결과가 없습니다</h1>
					<%
				}
				%>
		<div class="videos-imgs mt-4">
					
				
			<%
				//검색 영상 띄우기
				for (VideoVO vo : caList) {
			%>

			<a href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%=vo.getViNum()%>&category=<%=vo.getCategory()%>" class="videos-a"> 
				<div class="videos-img">
					<img src="<%=request.getRealPath("/resources/upload")%>\<%=vo.getImgUrl()%>" alt="videos-img">
				</div>
				<div class="d-flex align-items-center justify-content-between">
					<div class="img-title"><%= vo.getTitle()%></div>
					<div class="img-date m-0"><%= vo.getViDate()%></div>
				</div>
			</a>
			<%
				}
			%>
		</div>

	</div>
</section>
<%@ include file="../footer.jsp"%>