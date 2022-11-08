<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
    <!-- 마이페이지 -->
    <section id="mypage">
        <div class="mypage-wrap position-relative">
            <div class="mypage-box sign-box position-absolute">
                <div class="mypage-content sign-content text-center">
                
                <%
	                String id = request.getParameter("id");
	                String name = request.getParameter("name");
                %>
                    
                    <h1><%=name%></h1>
                    
                    <a href="<%=request.getContextPath()%>/member/pwdChange.jsp?id=<%=id%>">비밀번호 변경</a>
                    <a href="<%=request.getContextPath()%>/member/nameChange.jsp?id=<%=id%>">이름 변경</a>
                    <a href="<%=request.getContextPath()%>/member/memberQuit.jsp?id=<%=id%>">계정 삭제</a>
                </div>
            </div>
        </div>
     </section>
   
<%@ include file = "../footer.jsp" %>
