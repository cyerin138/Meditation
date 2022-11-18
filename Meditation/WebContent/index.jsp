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
                        <div class="mouse-move" style="animation-delay: -0.1s;">
                            <div class="arrow-down"></div>
                        </div>
                        <div class="mouse-move" style="animation-delay: -0.5s;">
                            <div class="arrow-down"></div>
                        </div>
                        <div class="mouse-move" style="animation-delay: -1s;">
                            <div class="arrow-down"></div>
                        </div>
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
                <div class="slide" style="opacity: 1;">
                    <div class="position-relative">
                        <img src="./resources/imgs/forest1.jpg" alt="visual">
                    </div>
                </div>
                <div class="slide">
                    <div class="position-relative">
                        <img src="./resources/imgs/forest3.jpg" alt="visual">
                    </div>
                </div>
                <div class="slide">
                    <div class="position-relative">
                        <img src="./resources/imgs/forest.png" alt="visual">
                    </div>
                </div>
            </div>
        </section>
        <!-- 비주얼 끝 -->
        <!-- 글씨 -->
        <section id="text">
            <div class="text-wrap position-relative">
                <div class="text-img1 text-img">
                    <img src="./resources/imgs/meditation1.jpg" alt="명상">
                </div>
                <div class="text-img2 text-img">
                    <img src="./resources/imgs/meditation2.png" alt="명상">
                </div>
                <p class="m-text">Meditation</p>
                <p class="f-text">Frequency</p>
                <p class="p-text">Previous</p>
            </div>
        </section>
        <!-- 글씨 끝 -->
        <!-- 계기 -->
        <section id="reason">
            <div class="reason-wrap text-center position-relative">
                <div class="reason-content">
                    <p class="reason-title">CONCEPT STORY</p>
                    <p class="reason-text1 reason-text">치명상은 당신이 겪은 스트레스를 명상으로 완화하고 마음을 <br>치유하기 위해 만들어졌습니다.</p>
                    <p class="reason-text2 reason-text">당신과 함께하는 치명상, 이 곳에서 당신이<br>펼치지 못한 꿈을 펼쳐보세요.</p>
                </div>
                <div class="reason-back"></div>
                <div class="reason-img">
                    <img src="./resources/imgs/forest6.jpg" alt="forest">
                </div>
            </div>
        </section>
        <!-- 계기 끝 -->
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
        <!-- 시작하기 -->
        <section id="start">
            <div class="start-wrap text-center position-relative">
                <div class="start-content">
                    <p class="start-title">안정의 공간으로<br>당신을 초대 합니다.</p>
                    <div class="start-path">
                        <i class="fa-solid fa-angle-down"></i>
                    </div>
                    <a href="<%=request.getContextPath()%>/category/meditation.jsp" class="start-btn">시작하기</a>
                </div>
            </div>
        </section>
        <!-- 시작하기 끝 -->
        <!-- 인트로  -->
        <section id="intro" class="intro">
            <div class="intro-wrap text-center position-relative">
                <div class="position-absolute">

                    <img src="./resources/imgs/headphone.png" alt="헤드폰" class="headphone"> <br>
                    <img src="./resources/imgs/sound.gif" alt="음파" class="sound">
                    <p>몰입감을 위해 이어폰을 착용 해주세요</p>
                </div>
            </div>
        </section>
        <!-- 인트로 끝 -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.ripples/0.5.3/jquery.ripples.min.js"></script>

        <script>
            //시작하기 쪽 물 효과
            $('.start-wrap').ripples({
                resolution: 512,
                dropRadius: 20,
                perturbance: 0.04,
            });

            //새소리 플레이
            let audio = new Audio(`<%=request.getContextPath()%>/resources/mp3/forest.mp3`);
            audio.volume = 1;

            if (sessionStorage.getItem("loginOK") == null) {
                audioPlay();
            } else {
                $(".intro").addClass('intro-box');
                audio.play();
            }
            const sleep = delay => new Promise(resolve => setTimeout(resolve, delay));
            window.onload = function () {
                async function audioPlay() {
                    $(".intro").fadeOut('slow');
                    audio.play();
                    await sleep(3500);
                    $(".intro").addClass('intro-box');
                }
            }
            // 비주얼 슬라이드 효과
            let slide = $('.slide')
            let sno = 0;
            let eno = slide.length - 1;

            let timer = setInterval("autoslide()", 6000)

            function autoslide() {
                $(slide[sno]).stop().animate({
                    opacity: 0
                }, 2000)
                sno++;
                if (sno > eno) {
                    sno = 0;
                }
                $(slide[sno]).stop().animate({
                    opacity: 1
                }, 2000)
            }  
        </script>
        <%@ include file="footer.jsp" %>