<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="header.jsp" %>
        <!-- 비주얼 -->
        <section id="visual">
            <div class="visual-wrap position-relative">
                <div class="position-absolute visual-content">
                    <p class="visual-title">A space of<br>meditation that<br>heals you <span class="line-bottom"></span>
                    </p>
                    <p class="visual-text">당신을 치유하는 명상의 공간</p>
                </div>
                <div class="position-absolute visual-mouse">
                    <div class="mouse">
                        <div class="mouse-wheel"></div>
                    </div>
                    <div class="position-relative">

                        <div class="arrow-down"></div>
                        <div class="arrow-down"></div>
                        <div class="arrow-down"></div>
                    </div>
                </div>
                <div class="visual-scroll position-absolute">
                    <p class="first mb-3">01</p>
                    <div class="progress">
                        <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0"
                            aria-valuemax="100"></div>
                    </div>
                    <p class="second mt-3">02</p>
                </div>
                <img src="./resources/imgs/forest1.jpg" alt="visual">
                <img src="./resources/imgs/forest2.jpg" alt="visual">
                <img src="./resources/imgs/forest3.jpg" alt="visual">
            </div>
        </section>
        <!-- 비주얼 끝 -->
        <!-- 명언 -->
        <section id="famous">
            <div class="famous-wrap text-center">
                <div>
                    <p class="famous-text mb-4 mt-3">The greater the man, <br>the more restrained his anger.</p>
                    <p class="famous-name">&lt;Ovid&gt;</p>
                    <img src="./resources/imgs/forest3.jpg" alt="famous">
                </div>
            </div>
        </section>
        <!-- 명언 끝 -->
        <!-- 계기 -->
        <section id="reason">
            <div class="reason-wrap text-center position-relative">
                <div class="path">
                    <div class="circle circle-l"></div>
                    <div class="line"></div>
                    <div class="circle circle-r"></div>
                </div>
                <div class="reason-content">
                    <p class="reason-text1">치명상은 당신이 겪은 스트레스를 명상으로 <br> 완화하고 마음을 치유하기 위해 만들어졌습니다.</p>
                    <p class="reason-text2">당신과 함께하는 치명상과 함께 <br>오늘을 보다 멋지고 행복하게 시간을 보내보세요.</p>
                </div>
                <div class="reason-img">
                    <img src="./resources/imgs/left.png" alt="left">
                    <img src="./resources/imgs/right1.png" alt="right">
                    <img src="./resources/imgs/right2.png" alt="right">
                </div>
            </div>
        </section>
        <!-- 계기 끝 -->
        <!-- 시작하기 -->
        <section id="start">
            <div class="start-wrap text-center position-relative">
                <h1 class="start-title position-absolute">안정의 공간으로<br>당신을 초대 합니다.</h1>
                <div class="start-path"></div>
                <div class="start-btn">
                    <a href="#">시작하기</a>
                </div>
            </div>
        </section>
        <!-- 시작하기 끝 -->
        <!-- 인트로  -->
        <section id="intro">
            <div class="intro-wrap text-center position-relative">
                <div class="position-absolute">
                                   
                    <img src="./resources/imgs/headphone.png" alt="헤드폰" class="headphone"> <br>
                    <img src="./resources/imgs/sound.gif" alt="음파" class="sound">
                    <p>몰입감을 위해 이어폰을 착용 해주세요</p>
                </div>
            </div>
        </section>
        <!-- 인트로 끝 -->
        <%@ include file="footer.jsp" %>