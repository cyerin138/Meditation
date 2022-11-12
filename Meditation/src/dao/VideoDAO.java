package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil;
import vo.MemberVO;
import vo.VideoVO;

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
	final String SELECT_VIDEO = "select * from video where category = ? order by vi_date desc";
	// 특정비디오 조회
	final String SELECT_ONE = "select * from video where vi_num = ? order by vi_date desc";
	// 비디오 검색
	final String SEARCH_VIDEO = "select * from video where (title like ? or text like ?) order by vi_date desc";
	// 비디오 4개 띄우기
	final String SELECT_FOUR = "select * from (select * from video order by vi_date desc) where rownum <= 4";
	

	// 비디오 추가
	public int insertMember(VideoVO vo) {
		int result = 0;

		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(INSERT_VIDEO);
			pstmt.setString(1, vo.getCategory());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getText());
			pstmt.setString(5, vo.getVideoUrl());
			pstmt.setString(6, vo.getImgUrl());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt);
		}
		return result;
	}
	
	// 비디오 조회
		public MemberVO getVideo(String category) {
			VideoVO vo = null;

			try {
				con = JDBCUtil.getConnection();
				pstmt = con.prepareStatement(SELECT_VIDEO);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					vo = new VideoVO();
					vo.setViNum(rs.getInt("vi_num"));
					vo.setCategory(rs.getString("category"));
					vo.setName(rs.getString("name"));
					vo.setViDate(rs.getDate("vi_date"));
					vo.setTitle(rs.getString("title"));
					vo.setText(rs.getString("text"));
					vo.setVideoUrl(rs.getString("video_url"));
					vo.setImgUrl(rs.getString("img_url"));

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(con, pstmt, rs);
			}

			return vo;
		}
		

}
