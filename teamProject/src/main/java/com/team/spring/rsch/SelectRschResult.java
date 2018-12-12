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
 * Servlet implementation class SelectRschResult
 */
@WebServlet("/rschResult.do")
public class SelectRschResult extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cd = request.getParameter("cd");
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Map> items = null;
		
		String title = "";
		int total = 0;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
		    con = DriverManager.getConnection
	                           ("jdbc:oracle:thin:@//localhost:1521/orcl","scott","tiger");

		    String sql1  = " SELECT title FROM rschMain "
		    			 + " WHERE cd = '"+cd+"'";
		    stmt = con.createStatement();
		    rs = stmt.executeQuery(sql1);
		    rs.next();
		    
		    title = rs.getString("title");
		    stmt.close();
		    
		    String totalSql = " SELECT sum(cnt) total FROM rschSub "
		    				+ " WHERE cd LIKE '"+cd+"%'";
		    stmt = con.createStatement();
		    ResultSet totalRs = stmt.executeQuery(totalSql);
		    totalRs.next();
		    
		    total = totalRs.getInt("total");
		    
		    String sql2  = " SELECT cd,comm,cnt FROM rschSub "
		    			 + " WHERE cd LIKE '"+cd+"%'";
		    stmt = con.createStatement();
		    ResultSet rs1 = stmt.executeQuery(sql2);
			
		    items = new ArrayList<Map>();
			
			Map<String,String> map = new HashMap<String,String>();
			while(rs1.next()) {
				map.put("cd", rs1.getString("cd"));
				map.put("comm", rs1.getString("comm"));
				map.put("cnt", rs1.getString("cnt"));
				items.add(map);
				map = new HashMap<String,String>();
			}
			stmt.close();
		
		} catch (Exception e) { }
		
		request.setAttribute("total", total);
		request.setAttribute("title", title);
		request.setAttribute("resultList", items);
		
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/rsch/rschResult.jsp");
		dispatcher.forward(request, response);
		
	}

}
