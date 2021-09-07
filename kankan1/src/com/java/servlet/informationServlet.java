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
import com.java.servise.UserServise;
import com.java.servise.customerServise;

public class informationServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		customerServise s=new customerServise();
		UserServise u = new UserServise();
		
		HttpSession session=request.getSession();
		if(session.getAttribute("id")==null) {
			String msg = "请先登录再修改个人信息";
			request.setAttribute("msg",msg);
			request.getRequestDispatcher("information.jsp").forward(request, response);
		}
		int user_ID=(int) session.getAttribute("id");

		if(request.getParameter("item")!=null) {
			//修改客户信息

			//收集数据的容器
			Map<String,Object> map = new HashMap<String, Object>();
			//创建磁盘工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//创建文件上传核心对象
			ServletFileUpload upload = new ServletFileUpload(factory);
			//解析request集合
			List<FileItem> parseRequest = null;
			try {
				parseRequest = upload.parseRequest(request);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//遍历request集合
			for (FileItem fileItem : parseRequest) {
				//判断是普表单项还是文件表单项
				boolean formField = fileItem.isFormField();
				if(formField){//是普通表单项
					String fieldName = fileItem.getFieldName();//获取表单项名字,也就是平时getParameter的那个name
					String stringValues = fileItem.getString("utf-8");//获取表单项的值,平时getParameter的那个name返回的值当然要编码
					map.put(fieldName, stringValues);//设置到map,取出一个name你就得将这个值添加到上面定义的map中,用于后面进行封装
				}else{//是文件上传的表单项
					//获取上传的文件名字
					String name = fileItem.getName().substring(fileItem.getName().lastIndexOf("."));
					String imgName = UUID.randomUUID() + name;
					//设置保存路径,也就是你根路径底下的一个文件夹中
					String realPath = getServletContext().getRealPath("images/customer");
					//获取输入流读取文件
					InputStream inputStream = fileItem.getInputStream();
					//创建输出流写入文件,路径/图片名字
					OutputStream outputStream = new FileOutputStream(realPath+"/"+imgName);
					//将文件写入到images中
					IOUtils.copy(inputStream, outputStream);
					//关流
					inputStream.close();
					outputStream.close();
					fileItem.delete();
					//根据对象保存路径~(相对路径),一般数据库中的图片字段都是相对路径.总之添加数据时根据你数据库图片字段的格式添加
					map.put("productImg", "http://localhost:8080/kankanjavaweb/images/customer/"+imgName);
					
				}
			}
			
			if(map.get("nickname")==null ||map.get("name")==null||map.get("sex")==null||map.get("tel")==null||map.get("Email")==null||map.get("years")==null||map.get("mons")==null||map.get("days")==null) {
				String msg = "亲，你有忘记设置的内容";
				request.setAttribute("msg",msg);
				request.getRequestDispatcher("information.jsp").forward(request, response);
			}
			
				Customer c= new Customer();
				c.setCustomer_nickname(String.valueOf(map.get("nickname")));
				c.setCustomer_name(String.valueOf(map.get("name")));
				c.setCustomer_sex(String.valueOf(map.get("sex")));
				c.setCustomer_tel(String.valueOf(map.get("tel")));
				c.setCustomer_emil(String.valueOf(map.get("Email")));
				int years=Integer.valueOf(String.valueOf(map.get("years")));
				int mons=Integer.valueOf(String.valueOf(map.get("mons")))+1;
				int days=Integer.valueOf(String.valueOf(map.get("days")));
				String borthday=years+"-"+mons+"-"+days;
				c.setCustomer_borthday(borthday);
				c.setUser_ID(user_ID);
				s.update(c);
				String imgs =String.valueOf(map.get("productImg"));
				s.updateImg(imgs, user_ID);
			
		}
		
		
		//客户等级获取
		List<User> listUser =u.queryUser(user_ID);
		int grading =0;
		for(User user:listUser) {
			grading =user.getGrading();
		}
		String grad=null;
		switch (grading) {
		case 0:
			grad="普通用户";
			break;
		case 2:
			grad="铜牌会员";
			break;
		case 3:
			grad="银牌会员";
			break;
		case 4:
			grad="金牌会员";
			break;
		case 5:
			grad="砖石会员";
			break;
		case 6:
			grad="至尊会员";
			break;
		default:
			break;
		}
		request.setAttribute("grad", grad);
		
		//客户信息获取
		List<Customer>listCustomer=s.query2(user_ID);
		request.setAttribute("listCustomer", listCustomer);
		


		
		
		request.getRequestDispatcher("information.jsp").forward(request, response);

	}

}
