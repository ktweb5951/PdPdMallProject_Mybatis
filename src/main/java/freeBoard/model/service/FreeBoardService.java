package freeBoard.model.service;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import common.JDBCTemplate;
import common.SqlSessionTemplate;
import freeBoard.model.dao.FreeBoardDAO;
import freeBoard.model.vo.FreeBoard;
import freeBoard.model.vo.PageData;

public class FreeBoardService {

	private FreeBoardDAO fDao;
	
	public FreeBoardService() {
		fDao = new FreeBoardDAO();
	}
	
	public int insertFreeBoard(FreeBoard freeBoard) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		int result = fDao.insertFreeBoard(session, freeBoard);
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}



	public int updateFreeBoard(FreeBoard freeBoard) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		int result = fDao.updateFreeBoard(session, freeBoard);
		if(result>0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public int deleteFreeBoard(FreeBoard freeBoard) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		int result = fDao.deleteFreeBoard(session, freeBoard);
		if(result>0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public FreeBoard selectOneByNo(int freeBoardNo) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		FreeBoard freeBoard = fDao.selectOneByNo(session, freeBoardNo);
		session.close();
		return freeBoard;
	}

	//전체 목록 조회
	public PageData selectFreeBoardList(int currentPage) {
		SqlSession session = SqlSessionTemplate.getSqlSession();
		List<FreeBoard> fList = fDao.selectFreeBoardList(session, currentPage);
		String pageNavi = fDao.generatePageNavi(session, currentPage);
		PageData pd = new PageData(fList, pageNavi);
		session.close();
		return pd;
	}
}
