package com.team.spring.rsch;

import java.io.IOException;
import java.io.Reader;
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

import org.apache.ibatis.io.Resources;

/**
 * Servlet implementation class SelectRschJoin
 */
@WebServlet("/rschJoinList.do")
public class SelectRschJoin extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Map> items = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
		    con = DriverManager.getConnection
	                           ("jdbc:oracle:thin:@//localhost:1521/orcl","scott","tiger");
		    stmt = con.createStatement();
			
		    String sql = " SELECT cd,title FROM rschMain ";
			rs = stmt.executeQuery(sql);

			items = new ArrayList<Map>();
			Map<String,String> map = new HashMap<String,String>();
			while(rs.next()) {
				map.put("cd", rs.getString("cd"));
				map.put("title", rs.getString("title"));
				items.add(map);
				map = new HashMap<String,String>();
			}
		
		} catch (Exception e) { }
		
		request.setAttribute("resultList", items);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/rsch/rschJoinList.jsp");
		dispatcher.forward(request, response);
		
	}
}
