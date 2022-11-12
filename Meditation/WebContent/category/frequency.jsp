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
        <div class="line d-flex align-items-center justify-content-center">
            <div class="circle"></div>
            <div class="path"></div>
            <div class="circle"></div>
        </div>
        <section id="recommend">
            <div class="recommend-wrap container-12">
                <div class="d-flex align-items-center justify-content-start ">

                    <p class="recommend-title m-0">주파수 동영상</p>
                    <a href="<%=request.getContextPath()%>/category/videos.jsp?category=" class="view-more ml-3">
                        <span></span>
                        <span></span>
                    </a>
                </div>

                <div class="recommend-imgs d-flex align-items-center justify-content-between mt-4">

                    <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="recommend-img">
                        <img src="./resources/imgs/" alt="video-img">
                    </a>
                    <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="recommend-img">
                        <img src="./resources/imgs/" alt="video-img">
                    </a>
                    <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="recommend-img">
                        <img src="./resources/imgs/" alt="video-img">
                    </a>
                    <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?video=" class="recommend-img">
                        <img src="./resources/imgs/" alt="video-img">
                    </a>
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
                    <a href="#" class="ml-3 comment-write d-flex align-items-center">댓글 작성
                        <div class="d-flex align-items-center justify-content-center ml-2">
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

    </div>
<%@ include file="../footer.jsp" %>