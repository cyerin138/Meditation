<%@page import="vo.MCommentVO"%>
<%@page import="vo.VideoVO"%>
<%@page import="vo.CommentVO"%>
<%@page import="dao.CommentDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.VideoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header2.jsp"%>
<!-- 전생체험 -->
<div class="previous-wrap">
	<!-- 메인 -->
	<section id="main">
		<div class="main-wrap position-relative">
			<canvas id="canvas"></canvas>
			<div class="position-absolute main-content">
				<div class="position-relative w-100 h-100">
					<div class="main-box">
						<div class="main-text">반갑습니다.</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 추천 동영상 -->

	<section id="recommend">
		<div class="recommend-wrap container-12">
			<div class="d-flex align-items-center justify-content-start">

				<p class="recommend-title m-0">전생체험 동영상</p>
				<a
					href="<%=request.getContextPath()%>/category/videos.jsp?category=P"
					class="view-more ml-3"> <span></span> <span></span>
				</a>
			</div>

			<%	
				//관련 영상 띄우기
				request.setCharacterEncoding("UTF-8");
				VideoDAO viDao = new VideoDAO();
				ArrayList<VideoVO> list = viDao.fourVideo("P");
			%>

			<div
				class="recommend-imgs mt-4">

				<%
					for (VideoVO vo : list) {
				%>
				<a href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%=vo.getViNum()%>&category=<%=vo.getCategory()%>" class="recommend-a"> 
					<div class="recommend-img">
						<img src="<%=request.getContextPath()%>/resources/upload/<%=vo.getImgUrl()%>" alt="videos-img">
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
				<form action="<%=request.getContextPath()%>/mcomment"
					class="d-flex align-items-center justify-content-between  h-100 "
					method="post">
					<input type="hidden" value="P" class="category" name="category">
					<input type="text" name="text" class="comment-input" id="" minlength="1" maxlength="50">
					<button onclick="commentSubmit()" class="comment-btn">
						<i class="fa-solid fa-paper-plane"></i>
					</button>
				</form>
			</div>
			
			<%
			
			CommentDAO coDao = new CommentDAO();
			ArrayList<MCommentVO> coList = coDao.getMain("P");
			
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
<script src="<%=request.getContextPath()%>/js/stripe-gradient.js"></script>
<script>
	window.onload = function(){
        const TEXT = $('.main-text');
        
        // 오디오 틀기
		let audio = new Audio(`<%=request.getContextPath()%>/resources/mp3/전생체험.mp3`);
		audio.volume = 1;
		setTimeout(function() {    		
			audio.play();
			textChange();
    	}, 1000);

		// 대사 뒤에 효과 띄우기
		$('#canvas').gradient({
                  colors: ['#fff', '#c2f0e1', '#fff', '#bee6ed']
		});
		
		 const sleep = delay => new Promise(resolve => setTimeout(resolve, delay));
		
		 //대사 띄우기
		    async function textChange() {
		        TEXT.html("반갑습니다.");
		        await sleep(1500);
		        TEXT.html("이곳은 당신의 전생을<br> 체험할 수 있는 공간입니다.");
		        await sleep(4500);
		        TEXT.html("대략 소요시간은 <br>3분 30초 입니다.");
		        await sleep(3500);
		        TEXT.html("원래는 20분이 걸리지만<br> 빠른 진행을 위해 소요시간을<br> 줄인 점 양해 부탁드립니다.");
		        await sleep(6500);
		        TEXT.html("당신에게 도움이 되길 바랍니다.");
		        await sleep(2600);
		        TEXT.html("모든 긴장을 풀고 몸과 마음을 풀고 이완시킵니다.");
		        await sleep(5200);
		        TEXT.html("눈을 감고 의식 <br>하면서 이완 시킵니다.");
		        await sleep(4300);
		        TEXT.html("눈에 긴장이 풀리는<br> 것이 느껴집니다.");
		        await sleep(3800);
		        TEXT.html("이제 의식을 얼굴로 옮겨옵니다.");
		        await sleep(4100);
		        TEXT.html("얼굴의 한부위씩 <br>의식이 옮겨가며<br> 모든 긴장이 풀리고");
		        await sleep(5800);
		        TEXT.html("완전히 이완 됩니다.");
		        await sleep(2800);
		        TEXT.html("목과 어깨의 긴장이 풀리고");
		        await sleep(3500);
		        TEXT.html("마음이 아주 편안 해집니다.");
		        await sleep(3000);
		        TEXT.html("팔에 긴장이 풀립니다.");
		        await sleep(2800);
		        TEXT.html("가슴과 배의 긴장이 풀립니다.");
		        await sleep(3400);
		        TEXT.html("등의 긴장이 풀립니다."); 
		        await sleep(2900);
		        TEXT.html("두 다리와 발의 <br>긴장이 풀립니다.");
		        await sleep(3500);
		        TEXT.html("이제 머리끝에서 발끝까지 <br>몸 전체가 무거워 지고<br> 이완되는 것을 느낍니다."); 
		        await sleep(6600);
		        TEXT.html("숨을 참았다가 내쉬면서"); 
		        await sleep(3200);
		        TEXT.html("이전 보다 10배는 더 <br>이완되는 것을 느낍니다.");
		        await sleep(4700);
		        TEXT.html("이제 당신의 머리끝에서 <br>치유와 보호에 하얀 빛이 <br>빛나고 있다고 상상하십시오."); 
		        await sleep(6500);
		        TEXT.html("그 빛이 천천히 <br>당신의 몸을 감쌉니다.");
		        await sleep(4000);
		        TEXT.html("최면 과정 중에는 선한<br> 영적스승이나 안내자가 <br>당신을 지켜줄것입니다."); 
		        await sleep(6700);
		        TEXT.html("이제 당신은 빛에 감싸인체<br> 깊이 휴식하면서도 의식을 깨어<br>나 전생 기억의 문을 엽니다.");
		        await sleep(7700);
		        TEXT.html("아름답고 화창한 날 온몸에<br> 햇살을 받으면서 약 백미터 <br>상공으로 천천히 날아오릅니다.");
		        await sleep(7900);
		        TEXT.html("구름에 감촉이 매우<br> 부드럽고 따스합니다.");
		        await sleep(4200);
		        TEXT.html("그 감촉을 느끼고 <br>경험 하십시오.");
		        await sleep(3800);
		        TEXT.html("이제 슬슬 힘드네요 <br>영상들으면서 받아 적는데");
		        await sleep(5000);
		        TEXT.html("제가 다 졸립니다.");
		        await sleep(2700);
		        TEXT.html("준비가 되었으면 다시<br> 지상으로 내려옵니다.");
		        await sleep(4200);
		        TEXT.html("그곳은 당신의 전생이 <br>펼쳐져 있는 곳이자 당신이<br> 과거 생을 보낸 곳 입니다.");
		        await sleep(6600);
		        TEXT.html("이곳은 잠재의식이<br> 당신을 위해 선택한<br> 전생의 환경입니다.");
		        await sleep(5900);
		        TEXT.html("느낌과 생각들이 자유<br>로이 떠오르게 하십시오.");
		        await sleep(4300);
		        TEXT.html("다섯을 세는 동안 몸이<br> 무거워 지면서 천천히 <br>아래로 내려옵니다.");
		        await sleep(5800);
		        TEXT.html("다섯, 몸이 점점 무거워집니다.");
		        await sleep(3800);
		        TEXT.html("넷, 아래로, 아래로 내려져가는 자신의 모습을 봅니다.");
		        await sleep(5100);
		        TEXT.html("셋, 발 아래로 산과 <br>들이 보입니다.");
		        await sleep(3900);
		        TEXT.html("둘, 지상이 조금씩 <br>가까워 집니다.");
		        await sleep(4000);
		        TEXT.html("하나, 이제 당신의 몸이 완전히 지상에 내려왔습니다.");
		        await sleep(5200);
		        TEXT.html("발에 촉감을 느껴보십시오.");
		        await sleep(3200);
		        TEXT.html("신발을 신으셨습니까?<br> 아니면 맨발입니까.");
		        await sleep(4700);
		        TEXT.html("천천히 움직이며<br> 자신의 몸을 찬찬히<br> 살펴 봅니다.");
		        await sleep(4900);
		        TEXT.html("당신의 이름은 무엇입니까?<br> 사는곳은 어느나라 <br>어느시대 입니까?");
		        await sleep(5800);
		        TEXT.html("부모님은 누구입니까?<br> 부모님의 얼굴과 <br>이름을 생각해봅니다.");
		        await sleep(5900);
		        TEXT.html("잘보고 현생에서 닮은<br> 사람을 생각해보십시오.");
		        await sleep(4700);
		        TEXT.html("이제 시간이 흘러 갑니다.");
		        await sleep(3000);
		        TEXT.html("그 생에서 중요한 경험을 했던 장면들을 떠올리십시오.");
		        await sleep(5600);
		        TEXT.html("이제 천천히 전생을 즐겨보세요.");
		        await sleep(7700);
		        TEXT.html("아 힘들다.");
		        await sleep(1600);
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