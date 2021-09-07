package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.dao.ProductsBaseDao;
import com.java.interfaces.Productsinterface;
import com.java.pojo.Products;

/**
 * Servlet implementation class Proservlet
 */

public class Proservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Proservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置字符编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");

		Productsinterface dao = new ProductsBaseDao();
		List<Products> list = dao.getAllPro();
		// 把信息放在请求作用域中
		request.setAttribute("Products", list);
		HttpSession session=request.getSession();
		session.setAttribute("pro",list);
		// 关联到对应的jsp页面
		request.getRequestDispatcher("/manage/Products_List.jsp").forward(request, response);
	}
}
