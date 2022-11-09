<%@page import="vo.MemberVO" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>치명상</title>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/css/fontawesome/css/all.min.css">
            <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap/css/bootstrap.min.css">
            <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
            <link href="<%=request.getContextPath()%>/resources/imgs/headerIcon.png" rel="shortcut icon" type="image/x-icon">
            <script src="<%=request.getContextPath()%>/js/jquery-3.1.1.min.js"></script>
        </head>

        <body>
            <div class="wrapper">
                <header>
                    <div class="header-1 header-wrap row align-items-center justify-content-between container-14">
                        <div class="col-2">
                            <div class="logo d-flex align-items-center justify-content-left">
                                <a href="<%=request.getContextPath()%>/index.jsp">
                                    <img src="<%=request.getContextPath()%>/resources/imgs/logo2.png" alt="로고" width="100px">
                                </a>                                
                            </div>
                        </div>
                        <nav class="menuBox col-6">
                            <ul class="m-0 menu d-flex align-items-center justify-content-start">
                                <li><a href="#">명상</a></li>
                                <li><a href="#">전생 체험</a></li>
                                <li><a href="#">주파수</a></li>
                            </ul>
                        </nav>
                        <div class="sign col-4">
                            <div class="d-flex align-items-center justify-content-end w-100">
                            
                            <div class="searchBox">
                                <div class="search">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </div>
                            </div>
                            <% MemberVO login=(MemberVO) session.getAttribute("loginOK"); if(login==null) { %>

                                <div class="login">
                                    <a href="<%=request.getContextPath()%>/member/login.jsp" class="d-flex align-items-center justify-content-center">Login
                                        <span class="d-flex align-items-center justify-content-center ml-3">
                                            <i class="fa-regular fa-user"></i>
                                        </span>
                                    </a>
                                </div>
                                <div class="register">
                                    <a href="<%=request.getContextPath()%>/member/register.jsp" class="d-flex align-items-center justify-content-center">Sign up
                                        <span class="d-flex align-items-center justify-content-center ml-3">
                                            <i class="fa-solid fa-arrow-right-to-bracket"></i>
                                        </span>
                                    </a>
                                </div>

                                <% } else { %>


                                    <div class="login">
                                        <a href="<%=request.getContextPath()%>/member/myPage.jsp?id=<%=login.getId()%>&name=<%= login.getName()%>" class="d-flex align-items-center justify-content-center">
                                            <%=login.getName() %> 
                                            <span class="d-flex align-items-center justify-content-center ml-3">
                                                <i class="fa-regular fa-user"></i>
                                            </span>
                                        </a>
                                    </div>
                                    <div class="register d-flex align-items-center justify-content-center">
                                        <button onclick="logout()" id="logout">Logout</button>
                                        <span class="d-flex align-items-center justify-content-center ml-3">                                            
                                            <i class="fa-solid fa-arrow-right-from-bracket"></i>
                                        </span>
                                    </div>
                                    <% } %>
                        </div></div>
                        <script>
                            function logout() {
                                let bool = confirm('정말 로그아웃 하시겠습니까?')
                                if (bool) {
                                    location.href = "<%=request.getContextPath()%>/logout";
                                    return;
                                } else {
                                    alert("로그아웃이 취소되었습니다.")

                                }
                            }
                        </script>
                    </div>
                </header>