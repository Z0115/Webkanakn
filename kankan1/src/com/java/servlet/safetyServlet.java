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

public class safetyServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		customerServise s=new customerServise();
		UserServise u = new UserServise();
		
		HttpSession session=request.getSession();
		int user_ID=(int) session.getAttribute("id");

		if(request.getParameter("item")!=null) {
			//淇敼瀹㈡埛淇℃伅

			//鏀堕泦鏁版嵁鐨勫鍣�
			Map<String,Object> map = new HashMap<String, Object>();
			//鍒涘缓纾佺洏宸ュ巶
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//鍒涘缓鏂囦欢涓婁紶鏍稿績瀵硅薄
			ServletFileUpload upload = new ServletFileUpload(factory);
			//瑙ｆ瀽request闆嗗悎
			List<FileItem> parseRequest = null;
			try {
				parseRequest = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			//閬嶅巻request闆嗗悎
			for (FileItem fileItem : parseRequest) {
				//鍒ゆ柇鏄櫘琛ㄥ崟椤硅繕鏄枃浠惰〃鍗曢」
				boolean formField = fileItem.isFormField();
				if(formField){//鏄櫘閫氳〃鍗曢」
					String fieldName = fileItem.getFieldName();//鑾峰彇琛ㄥ崟椤瑰悕瀛�,涔熷氨鏄钩鏃秅etParameter鐨勯偅涓猲ame
					String stringValues = fileItem.getString("utf-8");//鑾峰彇琛ㄥ崟椤圭殑鍊�,骞虫椂getParameter鐨勯偅涓猲ame杩斿洖鐨勫�煎綋鐒惰缂栫爜
					map.put(fieldName, stringValues);//璁剧疆鍒癿ap,鍙栧嚭涓�涓猲ame浣犲氨寰楀皢杩欎釜鍊兼坊鍔犲埌涓婇潰瀹氫箟鐨刴ap涓�,鐢ㄤ簬鍚庨潰杩涜灏佽
				}else{//鏄枃浠朵笂浼犵殑琛ㄥ崟椤�
					//鑾峰彇涓婁紶鐨勬枃浠跺悕瀛�
					String name = fileItem.getName().substring(fileItem.getName().lastIndexOf("."));
					String imgName = UUID.randomUUID() + name;
					//璁剧疆淇濆瓨璺緞,涔熷氨鏄綘鏍硅矾寰勫簳涓嬬殑涓�涓枃浠跺す涓�
					String realPath = getServletContext().getRealPath("images/customer");
					//鑾峰彇杈撳叆娴佽鍙栨枃浠�
					InputStream inputStream = fileItem.getInputStream();
					//鍒涘缓杈撳嚭娴佸啓鍏ユ枃浠�,璺緞/鍥剧墖鍚嶅瓧
					OutputStream outputStream = new FileOutputStream(realPath+"/"+imgName);
					//灏嗘枃浠跺啓鍏ュ埌images涓�
					IOUtils.copy(inputStream, outputStream);
					//锟斤拷锟斤拷
					inputStream.close();
					outputStream.close();
					fileItem.delete();
					//鏍规嵁瀵硅薄淇濆瓨璺緞~(鐩稿璺緞),涓�鑸暟鎹簱涓殑鍥剧墖瀛楁閮芥槸鐩稿璺緞.鎬讳箣娣诲姞鏁版嵁鏃舵牴鎹綘鏁版嵁搴撳浘鐗囧瓧娈电殑鏍煎紡娣诲姞
					map.put("productImg", "http://localhost:8080/kankanjavaweb/images/customer/"+imgName);
					
				}
			}

			
				Customer c= new Customer();
				c.setCustomer_nickname(String.valueOf(map.get("nickname")));
				c.setUser_ID(user_ID);
				s.update(c);
				String imgs =String.valueOf(map.get("productImg"));
				s.updateImg(imgs, user_ID);
			
		}
		
		
		//瀹㈡埛绛夌骇鑾峰彇
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
			grad="钻石会员";
			break;
		case 6:
			grad="至尊会员";
			break;
		default:
			break;
		}
		request.setAttribute("grad", grad);
		
		//瀹㈡埛淇℃伅鑾峰彇
		List<Customer>list=s.query2(user_ID);
		request.setAttribute("list", list);
		


		
		
		request.getRequestDispatcher("safety.jsp").forward(request, response);
	}

}
