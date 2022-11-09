<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "../header.jsp" %>
  	 <!-- 이름 변경-->
       <section id="member">
		<div class="member-wrap name-wrap position-relative">  
			<div class="member-box position-absolute">
				<div class="member-content text-center">
					<div class="position-absolute">
                        <%
                        String id = request.getParameter("id");
                        %>
						
						<p class="member-title">이름변경</p>
						<form action="<%=request.getContextPath()%>/nameChange" method="post" name ="memberForm">
                            <input type="text" name="id" class="l-id" placeholder="ID" value="<%= id %>" readonly><br>
                            <input type="text" name="name" class="l-name" placeholder="NEW NAME"> <br>                        
                            <input type="button" value="CHANGE" onclick="check()" class="name-btn">
                            
                        </form>
					</div>
				</div>
			</div>
			<img src="./resources/imgs/forest1.jpg" alt="visual">
		</div>
	</section>
    
    
    <script>
	function check() {
		if(document.memberForm.name.value == "") {
			alert("이름을 입력해주세요")
			document.memberForm.name.focus();
			return;			
		}
		document.memberForm.submit();
		
	}
</script>

<%@ include file = "../footer.jsp" %>
