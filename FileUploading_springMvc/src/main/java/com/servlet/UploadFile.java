package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/upload") // name of url mapping and in this case it name of form action used in frontend
@MultipartConfig
public class UploadFile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// first file type therefore using "PART"

		Part p = req.getPart("files");
		String filename = p.getSubmittedFileName();

		// second is remark which string type
		String remark = req.getParameter("remark");
		
		
		//use of session to show msg in the frontend
		HttpSession session=req.getSession();
		
		//database connection
		try {
			 Connection conn=DbConnect.getConn(); 
			/*
			 * Class.forName("com.mysql.jdbc.Driver"); Connection
			 * conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/file_upload",
			 * "root","kumar@2my");//url,user,password
			 */
			PreparedStatement ps=conn.prepareStatement("insert into servlet_file(img_name,remark) values(?,?)");
			
			ps.setString(1, filename);
			ps.setString(2, remark);
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				//storing files into the folder
				String path=getServletContext().getRealPath("")+"img";
				
				File file=new File(path);
				
				//use of part object
				p.write(path+File.separator+filename);
				
				//showing msg
				session.setAttribute("msg", "file uploaded sucessfully");
				
				resp.sendRedirect("index.jsp");
				
			}else {
				System.out.println("Something went wrong");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		

		
	}

}
