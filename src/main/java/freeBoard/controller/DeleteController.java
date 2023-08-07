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
 * Servlet implementation class DeleteController
 */
@WebServlet(name = "FreeBoardDeleteController", urlPatterns = { "/bulletinBoard/freeBoard/delete.do" })
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int freeBoardeNo = Integer.parseInt(request.getParameter("freeBoardNo"));
		FreeBoardService service = new FreeBoardService();
		FreeBoard freeBoard = service.selectOneByNo(freeBoardeNo);
		int result = service.deleteFreeBoard(freeBoard);
		if(result>0) {
			//성공시 목록으로 이동
			response.sendRedirect("/bulletinBoard/freeBoard/list.do?currentPage=1");
		} else {
			request.setAttribute("msg", "삭제가 완료되지 않았습니다.");
			request.setAttribute("url", "/bulletinBoard/freeBoard/detail.do?noticeNo" + freeBoardeNo);
			request.getRequestDispatcher("/WEB-INF/views/common/serviceFailed.jsp").forward(request, response);
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
