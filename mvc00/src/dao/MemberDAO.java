package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;
import vo.MemberVO;

public class MemberDAO {
	public ArrayList<MemberVO> selectMember() {
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO member = null;
		
		conn = JDBCUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement("select userid, username from member order by userid");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				member = new MemberVO();
				member.setUserId(rs.getString("userid"));
				member.setUserName(rs.getString("username"));
				memberList.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return memberList;
	}
	
	public int insertMember(MemberVO vo) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into member values(?,?)";
		
		conn = JDBCUtil.getConnection();
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserName());
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return n ;
	}
	public int updateMember(MemberVO vo ) {
		int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "update member set username=? where userid=?";
		conn = JDBCUtil.getConnection();
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUserName());
			pstmt.setString(2, vo.getUserId());
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return n;
	}
	
	public int deleteMember(String userId) {
int n = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "delete from member where userid =?";
		conn = JDBCUtil.getConnection();
		try {
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			n = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt);
		}
		return n;
	}
}
