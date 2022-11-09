<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
   <!-- 마이페이지 -->
	 <section id="member">
		<div class="member-wrap mypage-wrap position-relative">  
			<div class="member-box position-absolute">
				<div class="member-content text-center">
					<div class="position-absolute">
                        <%
                        String id = request.getParameter("id");
                        String name = request.getParameter("name");
                    %>
						
						<p class="member-title"><%=name%></p>
                        <a href="<%=request.getContextPath()%>/member/pwdChange.jsp?id=<%=id%>">비밀번호 변경</a>
                        <a href="<%=request.getContextPath()%>/member/nameChange.jsp?id=<%=id%>">이름 변경</a>
                        <a href="<%=request.getContextPath()%>/member/memberQuit.jsp?id=<%=id%>">계정 삭제</a>
					</div>
				</div>
			</div>
			<img src="<%=request.getContextPath()%>/resources/imgs/forest1.jpg" alt="forest">
		</div>
	</section>
   
<%@ include file = "../footer.jsp" %>
