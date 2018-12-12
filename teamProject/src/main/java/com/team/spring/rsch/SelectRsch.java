package com.team.spring.rsch;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SelectRsch
 */
@WebServlet("/rschReply.do")
public class SelectRsch extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("== doGet ==");
		String cd = request.getParameter("cd");
		System.out.println("== doGet cd : " + cd);
		requestPro(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("== doPost ==");
		String cd = request.getParameter("cd");
		System.out.println("== doPost cd : " + cd);
		requestPro(request,response);
	}
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cd = request.getParameter("cd");
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Map> items = null;
		
		String title = "";

		try {
			Class.forName("oracle.jdbc.OracleDriver");
		    con = DriverManager.getConnection
	                           ("jdbc:oracle:thin:@//localhost:1521/orcl2","scott","tiger");

		    String sql1  = " SELECT title FROM rschMain "
		    			 + " WHERE cd = '"+cd+"'";
		    stmt = con.createStatement();
		    rs = stmt.executeQuery(sql1);
		    rs.next();
		    
		    title = rs.getString("title");
		    stmt.close();
		    
		    String sql2  = " SELECT cd,comm FROM rschSub "
		    			+ " WHERE cd LIKE '"+cd+"%'";
		    stmt = con.createStatement();
		    ResultSet rs1 = stmt.executeQuery(sql2);
		    System.out.println("sql2 : " + sql2);
			items = new ArrayList<Map>();
			Map<String,String> map = new HashMap<String,String>();
			while(rs1.next()) {
				map.put("cd", rs1.getString("cd"));
				map.put("comm", rs1.getString("comm"));
				items.add(map);
				map = new HashMap<String,String>();
			}
			stmt.close();
		
		} catch (Exception e) { }
		
		request.setAttribute("title", title);
		request.setAttribute("resultList", items);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/rsch/rschReply.jsp");
		dispatcher.forward(request, response);
		
	}
}





