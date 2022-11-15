<%@page import="vo.MCommentVO"%>
<%@page import="vo.VideoVO"%>
<%@page import="vo.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VideoDAO"%>
<%@page import="dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header2.jsp" %>
     <!-- 명상 -->
    <div class="meditation-wrap">
        <!-- 메인 -->
        <section id="main">
            <div class="main-wrap position-relative">
                <div class="position-absolute main-content">
                    <div class="position-relative w-100 h-100">
                        <div class="main-box">
                            <div class="main-text">숨을 내쉬십시오.</div>
                            <div class="main-count">
                                <p class="main-tt">앞으로</p>
                                <p class="main-time">10초</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main-circle position-absolute">
                    <div class="sub-circle position-absolute"></div>
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

                    <p class="recommend-title m-0">명상 동영상</p>
                    <a href="<%=request.getContextPath()%>/category/videos.jsp?category=M" class="view-more ml-3">
                        <span></span>
                        <span></span>
                    </a>
                </div>
                <%		
            			request.setCharacterEncoding("UTF-8");
						VideoDAO viDao = new VideoDAO();
						ArrayList<VideoVO> viList =  viDao.fourVideo("M");
				%>

                <div class="recommend-imgs mt-4">
                
                <%
				for(VideoVO vo : viList){
						
				%>
                    <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%= vo.getViNum()%>&category=<%=vo.getCategory()%>" class="recommend-a">
                        <div class="recommend-img">
                            <img src="<%=request.getContextPath()%>/resources/upload/<%=vo.getImgUrl()%>" alt="videos-img">
                        </div>
                        <div class="d-flex align-items-center justify-content-between">
							<div class="img-title"><%= vo.getTitle()%></div>
							<div class="img-date m-0"><%= vo.getViDate()%></div>
						</div>
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
                    <form action="<%=request.getContextPath()%>/mcomment" class="d-flex align-items-center justify-content-between  h-100 " method="post">
                    	<input type="hidden" value="M" class="category" name="category">
                        <input type="text" name="text" class="comment-input" id="">
                        <button onclick="commentSubmit()" class="comment-btn"><i class="fa-solid fa-paper-plane"></i></button>
                    </form>
                </div>
                <%
			
			CommentDAO coDao = new CommentDAO();
			ArrayList<MCommentVO> coList = coDao.getMain("M");
			
			if (coList.size() == 0) {
				%>
					<h3 class="text-center comment-no">댓글이 없습니다</h3>
				<%
			}
			
			%>
			<div class="comments">
					<%										
					for (MCommentVO vo : coList) {
						
					%>
				<div class="comment-box">
					<div class="d-flex align-items-center justify-content-between">
						<p class="comment-name"><%=vo.getName()%></p>
						<p class="comment-date"><%=vo.getCoDate()%></p>
					</div>
					<p class="comment-text"><%=vo.getText()%></p>
				</div>
				<%
					}
				%>

			</div>
            </div>
        </section>

    </div>

    <script>
    window.onload = function(){
    	let audio = new Audio(`<%=request.getContextPath()%>/resources/mp3/명상.mp3`);
    	audio.volume = 1;
    	setTimeout(function() {    		
			audio.play();
			
    	}, 1000);
    	
    	
    	const CONTENT =  $('.main-content');
    	
    	// CONTENT.animate({width : 1000, height : 1000},1000,
    	// function(){
    	// 	CONTENT.css({'border' :'none' });
    	// }).animate({
    	// 	height : 400, width : 400	
    	// }, 500,function(){
    		
    	// }).animate({
    	// 	height : 700, width : 700
    	// }, 1000, function(){    		
    	// 	CONTENT.css({'border' :'1px solid #333D3D' });
    	// })
    	
    	
    	
    	
	}
    
    function check() {
		alert('로그인을 먼저 해주십시오');
	}
    
    let count = false;
    function commentClick() {
        if(count == true) {
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
        
        if(comment == true) {
            $('.comment-form').hide();
            document.commentForm.submit();
            $('.comment-input').val("");
            count = false;
        } else {
            $('.comment-form').hide();
            $('.comment-input').val("");
        	alert("댓글 작성이 취소 되었습니다")
        	 count = false;
        }
        
    }
    </script>
<%@ include file="../footer.jsp" %>