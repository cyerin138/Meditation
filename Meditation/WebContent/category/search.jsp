<%@page import="java.io.PrintWriter"%>
<%@page import="dao.VideoDAO"%>
<%@page import="vo.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>

<%
	String search = request.getParameter("search");
%>

<!-- 검색 -->
<section id="videos">
	<div class="videos-wrap container-12" style="min-height: 100vh;">
			<%
				VideoDAO viDao = new VideoDAO();
				ArrayList<VideoVO> caList = viDao.search(search);

				if (caList.size() == 0) {
					%>
						<h1 class="text-center font-weight-bold" style="padding-top:300px;">검색 결과가 없습니다</h1>
					<%
				}
				%>
		<div class="videos-imgs mt-4">
					
				
			<%
				for (VideoVO vo : caList) {
			%>

			<a
				href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%=vo.getViNum()%>&category=<%=vo.getCategory()%>"
				class="videos-img"> <img src="<%=vo.getImgUrl()%>"
				alt="video-img">
			</a>
			<%
				}
			%>
		</div>

	</div>
</section>
<%@ include file="../footer.jsp"%>