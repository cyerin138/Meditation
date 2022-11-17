package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDAO;
import vo.CommentVO;
import vo.MemberVO;

/**
 * Servlet implementation class CommentServlet
 */
@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//댓글 작성 서블렛
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		int result = 0;

		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("loginOK");
		CommentDAO dao = new CommentDAO();
		CommentVO vo = new CommentVO();
		vo.setName(login.getName());
		vo.setText(request.getParameter("text"));
		vo.setViNum(Integer.parseInt(request.getParameter("viNum")));

		result = dao.insertComment(vo);
		if (result > 0) {
			out.println("<script>alert('댓글 작성에 성공했습니다.')</script>");
			out.print("<script>window.location=document.referrer</script> ");
		} else {
			out.println("<script>alert('댓글 작성에 실패했습니다.')</script>");
			out.print("<script>window.location=document.referrer</script> ");

		}

	}

}
