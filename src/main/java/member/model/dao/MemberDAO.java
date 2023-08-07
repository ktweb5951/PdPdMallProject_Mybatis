package member.model.dao;

import java.sql.*;

import org.apache.ibatis.session.SqlSession;

import member.model.vo.Member;

public class MemberDAO {

	public int insertMember(SqlSession session, Member member) {
//		String query = "INSERT INTO MALLMEMBER_TBL VALUES(?,?,?,?,?,?,?,?,?,DEFAULT)";
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	public int updateMember(SqlSession session, Member member) {
//		String query = "UPDATE MALLMEMBER_TBL SET MEMBER_PW=?, MEMBER_NICKNAME=?, MEMBER_PHONE=?, MEMBER_ADDRESS=?, POSTALCODE_ONE=?, POSTALCODE_TWO=?, MEMBER_EMAIL=? WHERE MEMBER_ID=?";
		int result = session.insert("MemberMapper.updateMember", member);
		return result;
	}

	public int deleteMemberById(SqlSession session, String memberId) {
//		String query = "DELETE FROM MALLMEMBER_TBL WHERE MEMBER_ID = ?";
		int result = session.insert("MemberMapper.deleteMember", memberId);
		return result;
	}

	public Member selectCheckLogin(SqlSession session, Member member) {
		Member mOne = session.selectOne("MemberMapper.selectCheckLogin", member);
//		String query = "SELECT * FROM MALLMEMBER_TBL WHERE MEMBER_ID = ? AND MEMBER_PW = ?"
		return mOne;
	}

	public Member selectOneById(SqlSession session, String memberId) {
		Member member  = session.selectOne("MemberMapper.selectOneById", memberId);
		return member;
	}
//		String query = "SELECT * FROM MALLMEMBER_TBL WHERE MEMBER_ID = ?";

	

}
