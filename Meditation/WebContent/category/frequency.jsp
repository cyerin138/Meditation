<%@page import="vo.MCommentVO"%>
<%@page import="vo.CommentVO"%>
<%@page import="dao.CommentDAO"%>
<%@page import="vo.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VideoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header2.jsp" %>
     <!-- 주파수 -->
    <div class="frequency-wrap">
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
            </div>
        </section>

        <!-- 추천 동영상 -->
        <section id="recommend">
            <div class="recommend-wrap container-12">
                <div class="d-flex align-items-center justify-content-start ">

                    <p class="recommend-title m-0">주파수 동영상</p>
                    <a href="<%=request.getContextPath()%>/category/videos.jsp?category=F" class="view-more ml-3">
                        <span></span>
                        <span></span>
                    </a>
                </div>

                <%		
            			request.setCharacterEncoding("UTF-8");
						VideoDAO viDao = new VideoDAO();
						ArrayList<VideoVO> list =  viDao.fourVideo("F");
				%>

                <div class="recommend-imgs mt-4">
                
                <%
				for(VideoVO vo : list){
						
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
                    	<input type="hidden" value="F" class="category" name="category">
                        <input type="text" name="text" class="comment-input" id="">
                        <button onclick="commentSubmit()" class="comment-btn"><i class="fa-solid fa-paper-plane"></i></button>
                    </form>
                </div>
                <%
			
			CommentDAO coDao = new CommentDAO();
			ArrayList<MCommentVO> coList = coDao.getMain("F");
			
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

    <script src="<%=request.getContextPath()%>/js/quietflow.min.js"></script>
    <script>
    window.onload = function(){    	
        const TEXT = $('.main-text');
        const COUNT = $('.main-count');
        const COUNTTIME = $('.main-time');
        
    	let audio = new Audio(`<%=request.getContextPath()%>/resources/mp3/주파수.mp3`);
    	audio.volume = 1;
    	setTimeout(function() {    		
			audio.play();
			COUNT.hide();
			textChange();
    	}, 1000);

        $(".main-wrap").quietflow({
            theme: "bouncingBalls",
            specificColors: [
                "rgba(221, 212, 255, .5)",
                "rgba(201, 255, 230, .5)",
                "rgba(186, 247, 255, .5)"
            ]
        })
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
    
    const sleep = delay => new Promise(resolve => setTimeout(resolve, delay));

    async function textChange() {
            TEXT.html("방갑습니다.");
            await sleep(1500);
            TEXT.html("이곳은 당신의 밤을<br>책임지는 주파수 공간입니다.");
            await sleep(4100);
            TEXT.html("주파수는 2.0 델타파이며 <br> 재생의 뇌파소리로 회복수면에<br> 도움이 됩니다.");
            await sleep(6100);
            TEXT.html("무한 반복으로 재생되니 나가고<br> 싶을때 나가셔도 좋습니다.");
            await sleep(4700);
            TEXT.html("당신에게 도움이 되길 바랍니다.");
            await sleep(2800);
            TEXT.html("잠시 눈을 감고 <br>귀를 귀울여 봅니다.");
            await sleep(3300);
            TEXT.html("중간에 잠에 들어도 괜찮습니다.");
            await sleep(5500);
            TEXT.html("진짜 자나요.");           
        }
    </script>
<%@ include file="../footer.jsp" %>