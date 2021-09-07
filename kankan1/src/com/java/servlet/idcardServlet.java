package com.java.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.java.pojo.Customer;
import com.java.pojo.User;
import com.java.servise.customerServise;

public class idcardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");

		customerServise c=new customerServise();
		Customer s = new Customer();

		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			String msg = "请先登录再进行实名认证";
			request.setAttribute("msg", msg);
			request.getRequestDispatcher("idcard.jsp").forward(request, response);
		}
		int user_ID = (int) session.getAttribute("id");
		// 鎿嶄綔澶勭悊
		if (request.getParameter("item") != null) {
			int item = Integer.valueOf(request.getParameter("item"));
			if (item == 1) {
				String name = request.getParameter("name");
				String IDcard = request.getParameter("IDcard");
				s.setCustomer_nickname(name);
				s.setCustomer_sfz(IDcard);
				s.setUser_ID(user_ID);
				c.updates(s);
			}
		}
		// 鏌ヨ鐢ㄦ埛鏄惁瀹炲悕鍒�
		List<Customer> list = c.query2(user_ID);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("idcard.jsp").forward(request, response);
	}
}
