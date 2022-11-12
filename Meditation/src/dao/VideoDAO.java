package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.JDBCUtil;
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
	final String SELECT_FOUR = "select * from (select * from video where category = ? order by vi_date desc) where rownum <= 4";

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
	public ArrayList<VideoVO> allVideo(String category) {
		ArrayList<VideoVO> list = new ArrayList<VideoVO>();

		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_VIDEO);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int viNum = rs.getInt("vi_num");
				String viCategory = rs.getString("category");
				String name = rs.getString("name");
				Date viDate = rs.getDate("vi_date");
				String title = rs.getString("title");
				String text = rs.getString("text");
				String videoUrl = rs.getString("video_url");
				String imgUrl = rs.getString("img_url");

				VideoVO vo = new VideoVO(viNum, viCategory, name, viDate, title, text, videoUrl, imgUrl);

				list.add(vo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}

		return list;
	}

	// 특정 비디오 조회
	public VideoVO getVideo(String num) {
		VideoVO vo = null;

		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(SELECT_ONE);
			pstmt.setString(1, num);
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
	
	// 비디오 검색
	public ArrayList<VideoVO> search(String search) {
		ArrayList<VideoVO> list = new ArrayList<VideoVO>();
		String value = '%'+search+'%';

		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(SEARCH_VIDEO);
			pstmt.setString(1, value);
			pstmt.setString(2, value);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int viNum = rs.getInt("vi_num");
				String viCategory = rs.getString("category");
				String name = rs.getString("name");
				Date viDate = rs.getDate("vi_date");
				String title = rs.getString("title");
				String text = rs.getString("text");
				String videoUrl = rs.getString("video_url");
				String imgUrl = rs.getString("img_url");

				VideoVO vo = new VideoVO(viNum, viCategory, name, viDate, title, text, videoUrl, imgUrl);

				list.add(vo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}

		return list;
	}
	
	// 비디오 4개 띄우기
		public ArrayList<VideoVO> fourVideo(String category) {
			ArrayList<VideoVO> list = new ArrayList<VideoVO>();

			try {
				con = JDBCUtil.getConnection();
				pstmt = con.prepareStatement(SELECT_FOUR);
				pstmt.setString(1, category);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					int viNum = rs.getInt("vi_num");
					String viCategory = rs.getString("category");
					String name = rs.getString("name");
					Date viDate = rs.getDate("vi_date");
					String title = rs.getString("title");
					String text = rs.getString("text");
					String videoUrl = rs.getString("video_url");
					String imgUrl = rs.getString("img_url");

					VideoVO vo = new VideoVO(viNum, viCategory, name, viDate, title, text, videoUrl, imgUrl);

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
