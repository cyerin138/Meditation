package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.VideoDAO;
import vo.MemberVO;
import vo.VideoVO;

/**
 * Servlet implementation class VideoServlet
 */
@WebServlet("/video")
public class VideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VideoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		int result = 0;

		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("loginOK");
		VideoDAO dao = new VideoDAO();
		VideoVO vo = new VideoVO();
		
		vo.setCategory(request.getParameter("category"));
		vo.setName(login.getName());
		vo.setTitle(request.getParameter("title"));
		vo.setText(request.getParameter("text"));
		vo.setVideoUrl(request.getParameter("video"));
		vo.setImgUrl(request.getParameter("img"));

		result = dao.insertVideo(vo);
		if (result > 0) {
			out.println("<script>alert('영상 업로드에 성공했습니다.')</script>");
			out.print("<script> history.back() </script> ");
		} else {
			out.println("<script>alert('영상 업로드에 실패했습니다.')</script>");
			out.print("<script> history.back() </script> ");

		}
	}

}
