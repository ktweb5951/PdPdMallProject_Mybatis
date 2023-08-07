package freeBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import freeBoard.model.service.FreeBoardService;
import freeBoard.model.vo.FreeBoard;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet(name = "FreeBoardUpdateController", urlPatterns = { "/bulletinBoard/freeBoard/update.do" })
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeBoardService service = new FreeBoardService();
		int freeBoardNo = Integer.parseInt(request.getParameter("freeBoardNo"));
		FreeBoard freeBoard = service.selectOneByNo(freeBoardNo);
		
		if(freeBoard!=null) {
			request.setAttribute("freeBoard", freeBoard);
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/bulletinBoard/freeBoard/modify.jsp");
			view.forward(request, response);	
		} else {
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String freeBoardTitle = request.getParameter("freeBoard-title");
		String freeBoardContent = request.getParameter("freeBoard-content");
		int freeBoardNo = Integer.parseInt(request.getParameter("freeBoardNo"));
		FreeBoard freeBoard = new FreeBoard(freeBoardNo, freeBoardTitle, freeBoardContent);
		FreeBoardService service = new FreeBoardService();
		int result = service.updateFreeBoard(freeBoard);
		if(result>0) {
			response.sendRedirect("/bulletinBoard/freeBoard/list.do");
		} else {
			request.setAttribute("msg", "공지사항 수정이 완료되지 않았습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/serviceFaild.jsp").forward(request, response);
		}
	}
		

}
