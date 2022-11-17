package biz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class PwdChangeServlet
 */
@WebServlet("/nameChange")
public class NameChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NameChangeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 이름 바꿈 서블렛
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		String id, name;
		MemberVO vo = null;
		MemberDAO dao = new MemberDAO();
		int result = 0;
		id = request.getParameter("id");
		name = request.getParameter("name");

		result = dao.updateName(id, name);
		
		vo = dao.getMember(id);

		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			out.println("<script>alert('닉네임 변경에 성공했습니다.')</script>");
			HttpSession session = request.getSession();
			session.setAttribute("loginOK", vo);

		} else {
			out.print("<script> history.back() </script> ");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
