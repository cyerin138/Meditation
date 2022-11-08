<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
    <!-- 마이페이지 -->
    <section id="mypage">
        <div class="mypage-wrap position-relative">
            <div class="mypage-box sign-box position-absolute">
                <div class="mypage-content sign-content text-center">
                    
                    <h1>마이페이지</h1>
                    
                    <a href="<%=request.getContextPath()%>/member/pwdChange.jsp">비밀번호 변경</a>
                    <a href="<%=request.getContextPath()%>/member/nameChange.jsp">이름 변경</a>
                    <a href="<%=request.getContextPath()%>/member/memberQuit.jsp">계정 삭제</a>
                </div>
            </div>
        </div>
     </section>
   
<%@ include file = "../footer.jsp" %>
