<%@page import="vo.MCommentVO"%>
<%@page import="vo.VideoVO"%>
<%@page import="vo.CommentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VideoDAO"%>
<%@page import="dao.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!-- 명상 -->
<div class="meditation-wrap">
	<!-- 메인 -->
	<section id="main">
		<div class="main-wrap position-relative">
			<div class="position-absolute main-content">
				<div class="position-relative w-100 h-100">
					<div class="main-box">
						<div class="main-text">반갑습니다.</div>
					</div>
				</div>
			</div>
			<div class="circle-box">
				<div class="circle-1 main-circle"></div>
				<div class="circle-2 main-circle"></div>
				<div class="circle-3 main-circle"></div>
				<div class="circle-4 main-circle"></div>
			</div>
		</div>
	</section>

	<!-- 추천 동영상 -->

	<section id="recommend">
		<div class="recommend-wrap container-12">
			<div class="d-flex align-items-center justify-content-start">

				<p class="recommend-title m-0">명상 동영상</p>
				<a
					href="<%=request.getContextPath()%>/category/videos.jsp?category=M"
					class="view-more ml-3"> <span></span> <span></span>
				</a>
			</div>
			<%
				//관련 영상 띄우기
				request.setCharacterEncoding("UTF-8");
				VideoDAO viDao = new VideoDAO();
				ArrayList<VideoVO> viList = viDao.fourVideo("M");
			%>

			<div class="recommend-imgs mt-4">

				<%
					for (VideoVO vo : viList) {
				%>
				<a
					href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%=vo.getViNum()%>&category=<%=vo.getCategory()%>"
					class="recommend-a">
					<div class="recommend-img">
						<img
							src="<%=request.getRealPath("/resources/upload")%>\<%=vo.getImgUrl()%>"
							alt="videos-img">
					</div>
					<div class="d-flex align-items-center justify-content-between">
						<div class="img-title"><%=vo.getTitle()%></div>
						<div class="img-date m-0"><%=vo.getViDate()%></div>
					</div>
				</a>
				<%
					}
				%>
			</div>
		</div>
	</section>

	<!-- 댓글 -->
	<section id="comment">
		<div class="comment-wrap container-12">
			<div
				class="d-flex align-items-center justify-content-start comment-bundle">

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
				<form action="<%=request.getContextPath()%>/mcomment"
					class="d-flex align-items-center justify-content-between  h-100 "
					method="post">
					<input type="hidden" value="M" class="category" name="category">
					<input type="text" name="text" class="comment-input" id="" minlength="1" maxlength="50">
					<button onclick="commentSubmit()" class="comment-btn">
						<i class="fa-solid fa-paper-plane"></i>
					</button>
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
        	const TEXT = $('.main-text');
    	    const CIRCLE1 = $('.circle-1');
            const CIRCLE2 = $('.circle-2');
            const CIRCLE3 = $('.circle-3');
            const CIRCLE4 = $('.circle-4');

        //오디오 틀기
    	let audio = new Audio(`<%=request.getContextPath()%>/resources/mp3/명상.mp3`);
    	audio.volume = 1;
    	
    	setTimeout(function() { 
			audio.play();
			textChange();
    	}, 1000);
    	
			//대사 뒤에 효과 틀기
            setInterval(function () {
                CIRCLE1.animate({ width: 720, height: 720 , opacity :0.3}, 2000, 'swing'
                    ).animate({ width:900, height: 900 , opacity :0.1}, 2000, 'swing'
                    ).animate({ width:950, height: 950 , opacity :0.2}, 2000, 'swing'
                    ).animate({ width:600, height: 600 , opacity :0.4}, 2000, 'swing'
                    )
                CIRCLE2.animate({ width: 900, height:900 , opacity :0.1}, 2000, 'swing'
                    ).animate({ width:950, height: 950 , opacity :0.2}, 2000, 'swing'
                    ).animate({ width:600, height: 600 , opacity :0.4}, 2000, 'swing'
                    ).animate({ width:720, height: 720 , opacity :0.3}, 2000, 'swing'
                    )
                CIRCLE3.animate({ width: 950, height: 950 , opacity :0.2}, 2000, 'swing'
                    ).animate({ width:600, height: 600 , opacity :0.4}, 2000, 'swing'
                    ).animate({ width:720, height: 720 , opacity :0.3}, 2000, 'swing'
                    ).animate({ width:900, height: 900 , opacity :0.1}, 2000, 'swing'
                    )
                CIRCLE4.animate({ width: 600, height: 600 , opacity :0.4}, 2000, 'swing'
                    ).animate({ width:720, height: 720 , opacity :0.3}, 2000, 'swing'
                    ).animate({ width:900, height: 900 , opacity :0.1}, 2000, 'swing'
                    ).animate({ width:950, height: 950 , opacity :0.2}, 2000, 'swing'
                    )
            })    
            
            const sleep = delay => new Promise(resolve => setTimeout(resolve, delay));
	
         //대사 띄우기
    async function textChange() {
        TEXT.html("반갑습니다.");
        await sleep(1600);
        TEXT.html("이곳은 당신의 피로와 스트레스를 완화 하는 곳입니다.");
        await sleep(4300);
        TEXT.html("대략 2분 정도에<br>소요시간이 걸립니다.");
        await sleep(3300);
        TEXT.html("부디 당신에게 도움이<br> 되기를 바랍니다.");
        await sleep(3900);
        TEXT.html("살며시 눈을 감습니다.");
        await sleep(3000);
        TEXT.html("눈썹 사이 긴장을 풀고 입가에 살며시 미소를 지어 보시면서");
        await sleep(4900);
        TEXT.html("얼굴 근육을 편안하게<br> 만들어 봅니다.");
        await sleep(3800);
        TEXT.html("이제 나의 의식의 모든 부분을 내 호흡으로 가져갑니다.");
        await sleep(5100);
        TEXT.html("코로 들이마시고<br> 다시 코로 내쉽니다.");
        await sleep(3700);
        TEXT.html("혹은 코로 마시고 <br>입으로 내쉬어도 됩니다.");
        await sleep(4200);
        TEXT.html("들이 마시고 내쉽니다.");
        await sleep(2900);
        TEXT.html("들이 마시고 내쉽니다.");
        await sleep(2900);
        TEXT.html("들이 마시고 내쉽니다.");
        await sleep(2900);
        TEXT.html("호흡을 하는 도중 <br>다른 생각이 떠올라도");
        await sleep(3600);
        TEXT.html("머리를 억지로 비우려<br> 하지 않아도 됩니다.");
        await sleep(4000);
        TEXT.html("그 생각들을 멀리서 지켜보며"); 
        await sleep(2700);
        TEXT.html("자연스럽게 흘러 갈수<br> 있게 내버려 두세요.");
        await sleep(4100);
        TEXT.html("그리고 나의 의식을 <br>호흡으로 가져옵니다."); 
        await sleep(4100);
        TEXT.html("온몸에 힘을 풀고"); 
        await sleep(2000);
        TEXT.html("허리 끝까지 공기를<br> 채운다고 생각하면서.");
        await sleep(3600);
        TEXT.html("숨을 크게 들이 마십니다."); 
        await sleep(2900);
        TEXT.html("내쉴때는 배가 쏙 들어갈때 까지 길게 숨을 내뱉어 봅니다.");
        await sleep(5400);
        TEXT.html("( •̀ ω •́ )y"); 
        await sleep(3100);
        TEXT.html("(๑•̀ㅂ•́)و✧");
        await sleep(4000);
        TEXT.html(`¯\_( ͡° ͜ʖ ͡°)_/¯`);
        await sleep(3600);
        TEXT.html("ヾ(^▽^*)))");
        await sleep(3000);
        TEXT.html("손끝과 발끝에 힘을<br> 주어 움직여 봅니다.");
        await sleep(4100);
        TEXT.html("입가에 미소를 지어 봅니다.");
        await sleep(3000);
        TEXT.html("수고하셨습니다.");
        await sleep(2300);
        TEXT.html("");
    }
    	
	}
    
    //로그인 체크
    function check() {
		alert('로그인을 먼저 해주십시오');
	}
    
    //댓글 창 숨겼다가 보였다가
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
    
    //댓글 작성 여부 확인 및 등록
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
<%@ include file="../footer.jsp"%>