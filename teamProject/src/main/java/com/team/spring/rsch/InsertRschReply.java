package com.team.spring.rsch;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class InsertRschReply
 */
@WebServlet("/rschReSave.do")
public class InsertRschReply extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cd = request.getParameter("cd");
		System.out.println("== doGet cd : " + cd);
		requestPro(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cd = request.getParameter("cd");
		System.out.println("== doPost cd : " + cd);
		requestPro(request,response);
	}
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cd = request.getParameter("cd");
		
		Connection con = null;
		Statement stmt = null;
		int cnt = 0;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		    con = DriverManager.getConnection
	                           ("jdbc:oracle:thin:@//localhost:1521/orcl2","scott","tiger");

		    String sql   = " UPDATE rschSub SET cnt=cnt+1 "
		    			 + " WHERE cd = '"+cd+"'";
		    stmt = con.createStatement();
		    cnt = stmt.executeUpdate(sql);
			stmt.close();
		
		} catch (Exception e) { }
		
		 PrintWriter out = response.getWriter();
		 out.print(cnt);
	}
}
