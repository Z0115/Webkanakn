package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Comment;
import com.java.servise.commentServise;
import com.java.servise.informationServise;

public class commentServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		//调用接口方法
		commentServise comments=new commentServise();
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录在查看你的评论！";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("comment.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");
		

		List<Comment>listcomment=comments.query2(user_ID);
		request.setAttribute("listcomment", listcomment);
		
		
		request.getRequestDispatcher("comment.jsp").forward(request, response);
		
	}

}
