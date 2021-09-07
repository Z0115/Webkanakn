package com.java.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.pojo.Advertising;
import com.java.pojo.Announcement;
import com.java.pojo.Carousel;
import com.java.pojo.Discounts;
import com.java.servise.CarouselServise;
import com.java.servise.advertisingServise;
import com.java.servise.announcementServise;
import com.java.servise.discountsServise;


public class homeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		//轮播图
		CarouselServise s =new CarouselServise();
		List<Carousel>list=s.query();
		request.setAttribute("list", list);
		
		//优惠
		discountsServise dis = new discountsServise();
		List<Discounts> disList =dis.query();
		request.setAttribute("disList", disList);
		
		//公告
		announcementServise an = new announcementServise();
		List<Announcement> anList =an.query();
		request.setAttribute("anList", anList);
		
		//广告
		advertisingServise ad = new advertisingServise();
		List<Advertising> adList =ad.query();
		request.setAttribute("adList", adList);

		request.getRequestDispatcher("home.jsp").forward(request, response);

	}

}
