<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header.jsp" %>
    <!-- 계정삭제 -->
        <section id="quit">
            <div class="quit-wrap position-relative">
                <div class="quit-box sign-box position-absolute">
                    <div class="quit-content text-center sign-content">

                        <h1>계정 삭제</h1>
                        <form action="<%=request.getContextPath()%>/quit" method="post">
                            <input type="text" name="id" class="q-id" placeholder="ID"> <br>
                            <input type="password" name="pwd" class="q-pwd" placeholder="PASSWORD"> <br>

                            <input type="submit" value="DELETE" class="quit-btn">

                        </form>
                    </div>
                </div>
            </div>
        </section>

<%@ include file="../footer.jsp" %>