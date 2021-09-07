package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.interfaces.information;
import com.java.interfaces.shopInterface;
import com.java.pojo.Information;
import com.java.pojo.Shop;
import com.java.servise.informationServise;
import com.java.servise.shopServise;

/**
 * Servlet implementation class infomationServletHoutai
 */
@WebServlet("/manage/infomationServletHoutai")
public class infomationServletHoutai extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infomationServletHoutai() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		
		
		information dao = new informationServise(); 
		//商品
		shopInterface shopi = new shopServise();
		
		List<Shop> shop = shopi.query1();
		
		List<Information> list = dao.query();
		request.setAttribute("shop", shop);
		HttpSession session=request.getSession();
		session.setAttribute("infomation", list);
		System.out.println(list);
		
		request.getRequestDispatcher("/manage/Orderform.jsp").forward(request, response);
	}

}
