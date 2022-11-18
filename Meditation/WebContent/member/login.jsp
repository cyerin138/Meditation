<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header.jsp" %>
        <!-- 로그인-->
        <section id="member">
            <div class="member-wrap login-wrap position-relative">
                <div class="member-box position-absolute">
                    <div class="member-content text-center">
                        <div class="position-absolute">


                            <p class="member-title">로그인</p>
                            <form action="<%=request.getContextPath()%>/login" method="post" name="memberForm">
                                <input type="text" name="id" class="l-id" placeholder="ID" minlength="1"
                                    maxlength="10"><br>
                                <input type="password" name="pwd" class="l-pwd" placeholder="PASSWORD" minlength="1"
                                    maxlength="10"> <br>

                                <input type="button" onclick="check()" value="LOGIN" name="login-btn" class="login-btn">

                            </form>
                        </div>
                    </div>
                </div>
                <img src="<%=request.getContextPath()%>/resources/imgs/forest1.jpg" alt="forest">
            </div>
        </section>
        <script>
            // 값이 비었는지 체크
            function check() {
                if (document.memberForm.id.value == "") {
                    alert("아이디를 입력해주세요")
                    document.memberForm.id.focus();
                    return;

                } if (document.memberForm.pwd.value == "") {
                    alert("비밀번호를 입력해주세요")
                    document.memberForm.pwd.focus();
                    return;

                }

                document.memberForm.submit();
                sessionStorage.setItem("loginOK", true)
            }
        </script>


        <%@ include file="../footer.jsp" %>