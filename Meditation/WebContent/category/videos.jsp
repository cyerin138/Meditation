<%@page import="dao.VideoDAO"%>
<%@page import="vo.VideoVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ include file="../header2.jsp" %>
    <!--  동영상들 -->
    
        <section id="videos">
            <div class="videos-wrap container-12">
                <div class="d-flex align-items-center justify-content-start">
                <%
            			String category = request.getParameter("category");
				%>
    
                    <p class="videos-title m-0">전생체험 동영상</p>
                    <a href="<%=request.getContextPath()%>/category/videoWrite.jsp?category=<%=category%>" class="ml-3 videos-write d-flex align-items-center">영상 업로드
                        <div class="d-flex align-items-center justify-content-center ml-2">
                            <i class="fa-solid fa-pen"></i>
                        </div>
                    </a>
                </div>
    
                <div class="videos-imgs mt-4">
                <%
                		VideoDAO viDao = new VideoDAO();
						ArrayList<VideoVO> caList =  viDao.allVideo(category);
						for(VideoVO vo : caList){
				%>

                    <a href="<%=request.getContextPath()%>/category/videoPlay.jsp?num=<%= vo.getViNum()%>&category=<%=category%>" class="videos-img">
                       <img src="<%= vo.getImgUrl()%>" alt="video-img">
                    </a>
                    
                    <% } %>
                </div>
            </div>
        </section>
<%@ include file="../footer.jsp" %>