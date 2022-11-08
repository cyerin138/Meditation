<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
    <!-- 비밀번호 변경 -->
    <section id="login">
        <div class="login-wrap position-relative">
            <div class="login-box position-absolute sign-box">
                <div class="login-content text-center sign-content">

                    <h1>비밀번호 변경</h1>
                    <form action="<%=request.getContextPath()%>/login" method="post">
                        <input type="text" name="id" class="l-id" placeholder="ID"><br>
                        <input type="password" name="pwd" class="l-pwd" placeholder="PASSWORD"> <br>
                        
                        <input type="submit" value="LOGIN" class="login-btn">
                        
                    </form>
                </div>
            </div>
        </div>
    </section>

<%@ include file = "../footer.jsp" %>
