package com.java.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Customer;
import com.java.pojo.User;
import com.java.servise.UserServise;
import com.java.servise.customerServise;

public class passwordServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		
		UserServise u=new UserServise();
		User users=new User();
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录再修改密码";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("password.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		
		String ypwd=request.getParameter("ypwd");
		String xpwd=request.getParameter("xpwd");
		String qpwd=request.getParameter("qpwd");
		List<User> list=u.queryUser(user_ID);
		String password=null;
		for(User user:list){
			password=user.getUserpwd();
		}
		if(!ypwd.equals(password)){
			String msg = "原密码错误！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("password.jsp").forward(request, response);
		}
		if(!xpwd.equals(qpwd)){
			String msg = "两次输入的密码不一样！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("password.jsp").forward(request, response);
		}
		users.setUserpwd(xpwd);
		users.setId(user_ID);
		u.update(users);

		
		response.sendRedirect("passwords.jsp");
	}

}
