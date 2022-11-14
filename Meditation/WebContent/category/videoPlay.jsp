<%@page import="vo.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VideoDAO"%>
<%@page import="vo.CommentVO"%>
<%@page import="dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header2.jsp" %>
    <!-- 영상 -->
    <section id="video">
        <div class="video-wrap container-12">
        
            	<%
						VideoDAO viDao = new VideoDAO();
            			int num = Integer.parseInt(request.getParameter("num"));
						VideoVO numVO =  viDao.getVideo(num);
				%>
            <video src="<%=request.getContextPath()%>/resources/upload/<%=numVO.getVideoUrl()%>" class="video-play"></video>
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
						ArrayList<VideoVO> caList =  viDao.fourVideo(category);
				%>

                <div class="recommend-imgs mt-4">
                
                <%
				for(VideoVO vo : caList){
						if(num != vo.getViNum()) {
							
				%>
                    <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%= vo.getViNum()%>&category=<%=category%>" class="recommend-img">
                        <img src="<%=request.getContextPath()%>/resources/upload/<%=vo.getImgUrl()%>" alt="videos-img">
                        <div class="d-flex align-items-center justify-content-between">
							<div class="img-title"><%= vo.getTitle()%></div>
							<div class="video-date m-0"><%= vo.getViDate()%></div>
						</div>
                    </a>
                 <% } }%>
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
                <div class="d-flex align-items-center justify-content-start comment-bundle">

				<p class="comment-title m-0">댓글</p>
				<%
					if (login == null) {
				%>
				<div class="ml-3 comment-write d-flex align-items-center"
					onclick="check()">
					댓글 작성
					<div class="d-flex align-items-center justify-content-center ml-2">
						<i class="fa-solid fa-pen"></i>
					</div>
				</div>
				<%
					} else {
				%>

				<div class="ml-3 comment-write d-flex align-items-center"
					onclick="commentClick()">
					댓글 작성
					<div class="d-flex align-items-center justify-content-center ml-2">
						<i class="fa-solid fa-pen"></i>
					</div>
				</div>
				<%
					}
				%>
			</div>
                <div class="comment-form" name="commentForm">
                    <form action="<%=request.getContextPath()%>/comment" class="d-flex align-items-center justify-content-between  h-100 " method="post">
                    	<input type="hidden" value="<%=num%>" class="viNum">
                        <input type="text" name="commentInput" class="comment-input" id="">
                        <button onclick="commentSubmit()" class="comment-btn"><i class="fa-solid fa-paper-plane"></i></button>
                    </form>
                </div>
                <div class="comments">
                   <%
						CommentDAO coDao = new CommentDAO();
						ArrayList<CommentVO> coList =  coDao.getComment(num);
						for(CommentVO vo : coList){
					%>
                    <div class="comment-box">
                        <div class="d-flex align-items-center justify-content-between">
                            <p class="comment-name"><%= vo.getName()%></p>
                            <p class="comment-date"><%= vo.getCoDate()%></p>
                        </div>
                        <p class="comment-text"><%= vo.getText()%></p>
                    </div>  
                    <%} %>
    
                </div>
            </div>
        </section>
    <script>
    function check() {
		alert('로그인을 먼저 해주십시오');
	}
    
        let count = false;
        function commentClick() {
            if(count) {
                count = false;
                $('.comment-form').hide();
                
            } else {            
                count = true;
                $('.comment-form').show();
                $('.comment-input').focus();
            }
            
        }
        
        function commentSubmit() {
            let comment = confirm("정말 이 댓글을 올리시겠습니까?");        
    
            if(comment) {
                $('.comment-form').hide();
                document.commentForm.submit();
            }
        }
    </script>
<%@ include file="../footer.jsp" %>