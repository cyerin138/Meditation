<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header.jsp" %>
    <!-- 계정 삭제-->
	 <section id="member">
		<div class="member-wrap quit-wrap position-relative">  
			<div class="member-box position-absolute">
				<div class="member-content text-center">
					<div class="position-absolute">
						<%
                    	request.setCharacterEncoding("UTF-8");
                        String id = request.getParameter("id");
                        %>
						
						<p class="member-title">계정삭제</p>
						<form action="<%=request.getContextPath()%>/quit" method="post">
                            <input type="text" name="id" class="q-id" placeholder="ID" minlength="1" value="<%= id %>" readonly maxlength="10"> <br>
                            <input type="password" name="pwd" class="q-pwd" placeholder="PASSWORD" minlength="1" maxlength="10"> <br>
    
                            <input type="submit" value="DELETE" class="quit-btn">
    
                        </form>
					</div>
				</div>
			</div>
			<img src="<%=request.getContextPath()%>/resources/imgs/forest1.jpg" alt="forest">
		</div>
	</section>
<%@ include file="../footer.jsp" %>