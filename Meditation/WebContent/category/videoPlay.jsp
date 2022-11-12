<%@page import="vo.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VideoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header2.jsp" %>
    <!-- 영상 -->
    <section id="video">
        <div class="video-wrap container-12">
        
            	<%
						VideoDAO dao = new VideoDAO();
            			int num = Integer.parseInt(request.getParameter("num"));
						VideoVO numVO =  dao.getVideo(num);
				%>
            <video src="<%=numVO.getVideoUrl()%>" class="video-play"></video>
            <div class="video-content">
                <div class="video-top d-flex align-items-center justify-content-between">
                    <p class="video-title"><%=numVO.getTitle()%></p>
                    <div class="video-person d-flex justify-content-between align-items-center">
                        <div class="video-name"><%=numVO.getName()%></div>
                        <div class="video-date"><%=numVO.getViDate()%></div>
                    </div>
                </div>
                <p class="video-text m-0"><%=numVO.getText()%></p>
            </div>
        </div>
    </section>

    <!-- 추천 동영상 -->
    <div class="line d-flex align-items-center justify-content-center">
        <div class="circle"></div>
        <div class="path"></div>
        <div class="circle"></div>
    </div>
    <section id="recommend">
        <div class="recommend-wrap container-12">
            <div class="d-flex align-items-center justify-content-start">

                <p class="recommend-title m-0">관련 동영상</p>
                <a href="<%=request.getContextPath()%>/category/videos.jsp?category=<%=numVO.getCategory()%>" class="view-more ml-3">
                    <span></span>
                    <span></span>
                </a>
            </div>

            	<%
            			String category = request.getParameter("category");
						ArrayList<VideoVO> caList =  dao.fourVideo(category);
				%>

                <div class="recommend-imgs d-flex align-items-center justify-content-between mt-4">
                
                <%
				for(VideoVO vo : caList){
						
				%>
                    <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%= vo.getViNum()%>&category=<%=category%>" class="recommend-img">
                        <img src="<%= vo.getImgUrl()%>" alt="video-img">
                    </a>
                 <% } %>
                </div>
        </div>
    </section>

    <div class="line d-flex align-items-center justify-content-center">
        <div class="circle"></div>
        <div class="path"></div>
        <div class="circle"></div>
    </div>
    <!-- 댓글 -->
    <section id="comment">
        <div class="comment-wrap container-12">
            <div class="d-flex align-items-center justify-content-start">

                <p class="comment-title m-0">댓글</p>
                <a href="#" class="ml-3 comment-write d-flex align-items-center">댓글 작성
                    <div class="d-flex align-items-center justify-content-center">
                        <i class="fa-solid fa-pen"></i>
                    </div>
                </a>
            </div>
            <div class="d-flex align-items-center justify-content-between">

                <div class="comment-box">
                    <div class="d-flex align-items-center justify-content-between">
                        <p class="comment-name">홍길동</p>
                        <p class="comment-date">2022-03-21</p>
                    </div>
                    <p class="comment-text">
                        너무 좋아요~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는
                        기분
                    </p>
                </div>


                <div class="comment-box">
                    <div class="d-flex align-items-center justify-content-between">
                        <p class="comment-name">홍길동</p>
                        <p class="comment-date">2022-03-21</p>
                    </div>
                    <p class="comment-text">
                        너무 좋아요~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는
                        기분
                    </p>
                </div>

            </div>
            <div class="d-flex align-items-center justify-content-between">

                <div class="comment-box">
                    <div class="d-flex align-items-center justify-content-between">
                        <p class="comment-name">홍길동</p>
                        <p class="comment-date">2022-03-21</p>
                    </div>
                    <p class="comment-text">
                        너무 좋아요~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는
                        기분
                    </p>
                </div>


                <div class="comment-box">
                    <div class="d-flex align-items-center justify-content-between">
                        <p class="comment-name">홍길동</p>
                        <p class="comment-date">2022-03-21</p>
                    </div>
                    <p class="comment-text">
                        너무 좋아요~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는
                        기분
                    </p>
                </div>

            </div>
            <div class="d-flex align-items-center justify-content-between">

                <div class="comment-box">
                    <div class="d-flex align-items-center justify-content-between">
                        <p class="comment-name">홍길동</p>
                        <p class="comment-date">2022-03-21</p>
                    </div>
                    <p class="comment-text">
                        너무 좋아요~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는
                        기분
                    </p>
                </div>


                <div class="comment-box">
                    <div class="d-flex align-items-center justify-content-between">
                        <p class="comment-name">홍길동</p>
                        <p class="comment-date">2022-03-21</p>
                    </div>
                    <p class="comment-text">
                        너무 좋아요~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는 기분 ~~ 항상 힐링하는
                        기분
                    </p>
                </div>

            </div>
        </div>
    </section>
<%@ include file="../footer.jsp" %>