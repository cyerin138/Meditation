<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
        <!-- 로그인-->
        <section id="member">
            <div class="member-wrap login-wrap position-relative">  
                <div class="member-box position-absolute">
                    <div class="member-content text-center">
                        <div class="position-absolute">
    
                            
                            <p class="member-title">로그인</p>
                            <form action="<%=request.getContextPath()%>/login" method="post">
                                <input type="text" name="id" class="l-id" placeholder="ID" minlength="1" maxlength="10"><br>
                                <input type="password" name="pwd" class="l-pwd" placeholder="PASSWORD" minlength="1" maxlength="10"> <br>
                                
                                <input type="submit" value="LOGIN" class="login-btn">
                                
                            </form>
                        </div>
                    </div>
                </div>
                <img src="<%=request.getContextPath()%>/resources/imgs/forest1.jpg" alt="forest">
            </div>
        </section>

<%@ include file = "../footer.jsp" %>
