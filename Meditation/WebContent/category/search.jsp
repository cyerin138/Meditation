<%@page import="dao.VideoDAO"%>
<%@page import="vo.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header2.jsp" %>
       <!-- 검색 -->
       <section id="videos">
        <div class="videos-wrap container-12">
            <p class="videos-title m-0">명상 동영상</p>
            <div class="videos-imgs mt-4">

                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
            </div>
            <p class="videos-title mt-5 mb-0">전생체험 동영상</p>
            <div class="videos-imgs mt-4">

                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
            </div>
            <p class="videos-title mt-5 mb-0">주파수 동영상</p>
            <div class="videos-imgs mt-4">

                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
                <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="videos-img">
                    <img src="<%=request.getContextPath()%>/resources/imgs/" alt="video-img">
                </a>
            </div>

        </div>
    </section>
<%@ include file="../footer.jsp" %>