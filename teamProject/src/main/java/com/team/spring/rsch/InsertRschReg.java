package com.team.spring.rsch;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InsertRschReg
 */
@WebServlet("/rschWriteSave.do")
public class InsertRschReg extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String[] comm = request.getParameterValues("comm");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String use = request.getParameter("use");
		
		Connection con = null;
		Statement stmt = null;
		
		int cnt = 0;
		System.out.println("11");
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		    con = DriverManager.getConnection
	                           ("jdbc:oracle:thin:@//localhost:1521/orcl","scott","tiger");
		    stmt = con.createStatement();

			String sql1 = "SELECT fn_rschMain_cd() cd from dual";
			ResultSet rs = stmt.executeQuery(sql1);
			rs.next();
			String cd = rs.getString("cd");
	
			String sql2 = " INSERT INTO rschMain ("
			    		+ "				cd,"
						+ "				title,"
						+ "				sdate,"
						+ "				edate,"
						+ "				use,  "
						+ "				rdate) "
						+ "  VALUES ( '"+cd+"',"
						+ "				 '"+title+"',"
						+ "				 '"+sdate+"',"
						+ "				 '"+edate+"',"
						+ "				 '"+use+"',"
						+ "				 sysdate )";
			stmt = con.createStatement();
			cnt =stmt.executeUpdate(sql2);

			String sql3 = "";
			String subCd = "";
			
			if(cnt == 1) {
				for(int i=0; i<comm.length; i++) {
					if(!comm[i].equals("")) {
						subCd = cd;
						if((i+1) < 10) subCd += "0"+(i+1); 
						else 	       subCd +=  ""+(i+1);
						 
						sql3 = "INSERT INTO rschSub(cd,comm,cnt) "
						 		+ " VALUES('"+subCd+"','"+comm[i]+"','0')";
	
						stmt = con.createStatement();
						stmt.executeUpdate(sql3);
					}
				}
			}
		 } catch (Exception e) { }
		
		 PrintWriter out = response.getWriter();
		 out.print(cnt);

		/*request.setAttribute("cnt", cnt);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/others/empList.jsp");
		dispatcher.forward(request, response);*/
		
	}
}
