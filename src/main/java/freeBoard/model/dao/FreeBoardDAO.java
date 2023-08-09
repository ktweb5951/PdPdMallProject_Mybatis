package freeBoard.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import freeBoard.model.vo.FreeBoard;

public class FreeBoardDAO {

	public int insertFreeBoard(SqlSession session, FreeBoard freeBoard) {
			int result = session.insert("FreeBoardMapper.insertFreeBoard", freeBoard);
	//		String query = "INSERT INTO NOTICE_TBL VALUES(SEQ_NOTICENO.NEXTVAL,?,?,'admin',DEFAULT,DEFAULT,DEFAULT)";
			return result;
		}

	public int updateFreeBoard(SqlSession session, FreeBoard freeBoard) {
		int result = session.insert("FreeBoardMapper.updateFreeBoard", freeBoard);
		return result;
	}

	public int deleteFreeBoard(SqlSession session, FreeBoard freeBoard) {
		int result = session.insert("FreeBoardMapper.deleteFreeBoard", freeBoard);
		return result;
	}

	public List<FreeBoard> selectFreeBoardList(SqlSession session, int currentPage) {
		int  limit = 10;
		int offset = (currentPage-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<FreeBoard> fList = session.selectList("FreeBoardMapper.selectFreeBoardList", null,rowBounds);		
		return fList;
	}

//	private FreeBoard rsetToFreeBoard(ResultSet rset) throws SQLException {
//		FreeBoard freeBoard = new FreeBoard();
//		freeBoard.setFreeBoardNo(rset.getInt("FREEBOARD_NO"));
//		freeBoard.setFreeBoardTitle(rset.getString("FREEBOARD_TITLE"));
//		freeBoard.setFreeBoardContent(rset.getString("FREEBOARD_CONTENT"));
//		freeBoard.setFreeBoardWriter(rset.getString("FREEBOARD_WRITER"));
//		freeBoard.setViewCount(rset.getInt("VIEW_COUNT"));
//		freeBoard.setRcmndCount(rset.getInt("RCMND_COUNT"));
//		freeBoard.setFreeBoardDate(rset.getTimestamp("FREEBOARD_DATE"));
//		freeBoard.setUpdateDate(rset.getTimestamp("UPDATE_DATE"));
//		return freeBoard;
//	}

	public FreeBoard selectOneByNo(SqlSession session, int freeBoardNo) {
		FreeBoard freeBoard = session.selectOne("FreeBoardMapper.selectOneByNo",freeBoardNo );
		return freeBoard;
	}

	public String generatePageNavi(SqlSession session, int currentPage) {
		int totalCount = getTotalCount(session);
		int recordCountPerPage = 10;
		int naviTotalCount = 0;
		if(totalCount % recordCountPerPage > 0) {
			naviTotalCount = totalCount / recordCountPerPage + 1;
		} else {
			naviTotalCount = totalCount / recordCountPerPage;
		}
		int naviCountPerPage = 5;
		
		int startNavi = ((currentPage -1) / naviCountPerPage) * naviCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		boolean needPrev = true;
		boolean needNext = true;
		if(startNavi ==1) {
			needPrev = false;
		}
		if(endNavi == naviTotalCount) {
			needNext = false;
		}
		StringBuilder result = new StringBuilder();
		if(needPrev) {
			result.append("<a href='/bulletinBoard/freeBoard/list.do?currentPage="+(startNavi-1)+"'><이전</a>");
		}
		for (int i = startNavi; i<= endNavi; i++) {
			result.append("&nbsp;<a href='/bulletinBoard/freeBoard/list.do?currentPage="+i+"'>"+ i + "</a>&nbsp;&nbsp;");
			
		}
		if(needNext) {
			result.append("<a href='/bulletinBoard/freeBoard/list.do?currentPage="+(endNavi+1)+"'>다음></a>");
		}
		return result.toString();
	}

	private int getTotalCount(SqlSession session) {
		int totalCount = session.selectOne("FreeBoardMapper.getTotalCount");
		return totalCount;
	}


}
