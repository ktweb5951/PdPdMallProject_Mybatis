package freeBoard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeBoard.model.service.FreeBoardService;
import freeBoard.model.vo.FreeBoard;

/**
 * Servlet implementation class DetailController
 */
@WebServlet("/bulletinBoard/freeBoard/detail.do")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// SELECT * FROM NOTICE_TBL WHERE NOTICE_NO = ?
		int freeBoardNo = Integer.parseInt(request.getParameter("freeBoardNo"));
		FreeBoardService service = new FreeBoardService();
		FreeBoard freeBoard = service.selectOneByNo(freeBoardNo);
		if(freeBoard != null) {
			request.setAttribute("freeBoard", freeBoard);
			request.getRequestDispatcher("/WEB-INF/views/bulletinBoard/freeBoard/detail.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
