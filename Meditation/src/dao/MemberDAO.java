package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil;
import vo.MemberVO;

public class MemberDAO {
	public MemberDAO() {

	}
	
	Connection con = null;
	PreparedStatement pstmt   = null;
	ResultSet rs = null;
	
	// 회원추가
	final String INSERT_MEMBER = "insert into member values(?,?,?)";
	// 모든 회원 조회
	final String SELECT_MEMBER = "select * from member";
	//	계정 삭제
	final String DELETE_MEMBER = "delete from member where id = ?";
	// 계정 이름 변경
	final String UPDATE_NAME = "update member set name =? where id = ?";
	// 계정 비밀번호 변경
	final String UPDATE_PWD = "update member set pwd =? where id = ?";
	// 중복 아이디 찾기
	final String MEMBER_CHECK = "select * from member where id =?";
	
	
	// 회원 조회
	public MemberVO getMember(String id) {
		MemberVO vo = null;

		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(MEMBER_CHECK);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo = new MemberVO();
				vo.setId(rs.getString("id"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}

		return vo;
	}
	
	// 중복아이디 찾기
	public boolean existID(String id) {
		boolean isExist = false;
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(MEMBER_CHECK);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				isExist = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt, rs);
		}

		return isExist;
	}
	
	// 계정 삭제
	public int removeMember(String id) {
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(DELETE_MEMBER);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt);
		}
		return result;
	}
	
	//계정 추가
	public int insertMember(MemberVO vo) {
		int result = 0;
		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(INSERT_MEMBER);
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
	
//	계정 이름 변경
	public int updateName(String id, String name) {
		int n = 0;		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(UPDATE_NAME);
			pstmt.setString(1,name);
			pstmt.setString(2, id);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt);
		}

		return n;
	}
	
//	계정 비밀번호 변경
	public int updatePwd(String id, String pwd) {
		int n = 0;		
		try {
			con = JDBCUtil.getConnection();
			pstmt = con.prepareStatement(UPDATE_PWD);
			pstmt.setString(1,pwd);
			pstmt.setString(2, id);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			JDBCUtil.close(con, pstmt);
		}

		return n;
	}
}
