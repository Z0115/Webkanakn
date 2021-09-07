package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.interfaces.zhy;
import com.java.pojo.User;
import com.java.servise.zhy1;


public class indexnum extends HttpServlet {
	
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		zhy dao=new zhy1();
		int customernum =dao.getAllList();
		int customernums=dao.getALLdd1();
		HttpSession session=request.getSession();
		session.setAttribute("customernum", customernum);
		session.setAttribute("customernums", customernums);
		request.getRequestDispatcher("/manage/index.jsp").forward(request, response);
		
	}

}
