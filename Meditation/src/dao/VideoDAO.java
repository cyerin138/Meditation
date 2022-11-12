package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil;
import vo.MemberVO;

public class VideoDAO {

	public VideoDAO() {
		super();
		// TODO Auto-generated constructor stub
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 비디오 추가
	final String INSERT_VIDEO = "insert into video values(video_seq.nextval,?,?,default,?,?,?, ?)";
	// 비디오 조회
	final String SELECT_VIDEO = "select * from video where category = ?";	
	// 비디오 검색
	final String SEARCH_VIDEO = "select * from video where (title like ? or text like ?)";	
	
	//비디오 추가
		public int insertMember(MemberVO vo) {
			int result = 0;
			
			try {
				con = JDBCUtil.getConnection();
				pstmt = con.prepareStatement(INSERT_VIDEO);
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getPwd());
				pstmt.setString(3, vo.getName());
				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(con, pstmt);
			}
			return result;
		}
		

}
