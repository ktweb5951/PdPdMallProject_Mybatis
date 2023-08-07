package member.model.service;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSession;

import common.SqlSessionTemplate;

import common.JDBCTemplate;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	private MemberDAO mDao;
	
	 public MemberService() {
			mDao = new MemberDAO();
	}

	public int insertMember(Member member) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		int result = mDao.insertMember(session, member);
		if(result > 0) {
			// 성공 - 커밋
			session.commit();
		}else {
			// 실패 - 롤백
			session.rollback();
		}
		session.close();
		return result;
	}

	public int updateMember(Member member) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		int result = mDao.updateMember(session, member);
		if(result > 0) {
			// 성공 - 커밋
			session.commit();
		}else {
			// 실패 - 롤백
			session.rollback();
		}
		session.close();
		return result;
	}

	public int deleteMemberById(String memberId) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		int result = mDao.deleteMemberById(session, memberId);
		if(result > 0) {
			// 성공 - 커밋
			session.commit();
		}else {
			// 실패 - 롤백
			session.rollback();
		}
		session.close();
		return result;
	}


	public Member selectCheckLogin(Member member) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		// DAO 호출(연결도 넘겨줘야 함)
		Member mOne = mDao.selectCheckLogin(session, member);
		session.close();
		return mOne;
	}

	public Member selectOneById(String memberId) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		Member member = mDao.selectOneById(session, memberId);
		return member;
	}
	
		// 연결생성
		// DAO 호출
		// 커밋/롤백
	 
	 
}
