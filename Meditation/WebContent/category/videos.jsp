<%@page import="dao.VideoDAO"%>
<%@page import="vo.VideoVO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!--  동영상들 -->

<section id="videos">
	<div class="videos-wrap container-12" style="min-height: 100vh;">
		<div class="d-flex align-items-center justify-content-start">
			<%
				String category = request.getParameter("category");
				
				String categoryName = "";
				switch (category) {
					case "M" :
						categoryName = "명상";
						break;
					case "P" :
						categoryName = "전생체험";
						break;
					case "F" :
						categoryName = "주파수";
						break;
				}
			%>

			<p class="videos-title m-0"><%= categoryName %> 동영상</p>
			<%
				if (login == null) {
			%>
			<div class="ml-3 videos-write d-flex align-items-center"
				onclick="check()">
				영상 업로드
				<div class="d-flex align-items-center justify-content-center ml-2">
					<i class="fa-solid fa-pen"></i>
				</div>
			</div>
			<%
				} else {
			%>
			<a
				href="<%=request.getContextPath()%>/category/videoWrite.jsp?category=<%=category%>"
				class="ml-3 videos-write d-flex align-items-center">영상 업로드
				<div class="d-flex align-items-center justify-content-center ml-2">
					<i class="fa-solid fa-pen"></i>
				</div>
			</a>
			<%
				}
			%>
		</div>

		<div class="videos-imgs mt-4">
			<%
				VideoDAO viDao = new VideoDAO();
				ArrayList<VideoVO> caList = viDao.allVideo(category);
				for (VideoVO vo : caList) {
			%>

			<a
				href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%=vo.getViNum()%>&category=<%=category%>"
				class="videos-img"> <img src="<%=vo.getImgUrl()%>"
				alt="video-img">
			</a>

			<%
				}
			%>
		</div>
	</div>
</section>

<script>
	function check() {
		alert('로그인을 먼저 해주십시오');
	}
</script>
<%@ include file="../footer.jsp"%>