package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
import vo.CommentVO;

public class CommentDAO {

	public CommentDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 댓글 추가
	final String INSERT_COM = "insert into vi_comment values(?,?,default,?)";
	// 댓글 조회
	final String SELECT_COM = "select * from vi_comment where vi_num = ? order by co_date desc";
	
	// 댓글 추가
		public int insertComment(CommentVO vo) {
			int result = 0;

			try {
				con = JDBCUtil.getConnection();
				pstmt = con.prepareStatement(INSERT_COM);
				pstmt.setInt(1, vo.getViNum());
				pstmt.setString(2, vo.getName());
				pstmt.setString(3, vo.getText());

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(con, pstmt);
			}
			return result;
		}

		// 댓글 조회
		public ArrayList<CommentVO> getComment(String num) {
			ArrayList<CommentVO> list = new ArrayList<CommentVO>();

			try {
				con = JDBCUtil.getConnection();
				pstmt = con.prepareStatement(SELECT_COM);
				pstmt.setString(1, num);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					int viNum = rs.getInt("vi_num");
					String name = rs.getString("name");
					Date coDate = rs.getDate("co_date");
					String text = rs.getString("text");

					CommentVO vo = new CommentVO(viNum, name, coDate,text);

					list.add(vo);

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(con, pstmt, rs);
			}

			return list;
		}
}
