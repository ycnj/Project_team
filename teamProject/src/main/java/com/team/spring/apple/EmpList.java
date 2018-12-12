package com.team.spring.apple;

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
 * Servlet implementation class EmpList
 */
@WebServlet("/empList.do")
public class EmpList extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		requestPro(request,response);
	}
	
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Map> items = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		    con = DriverManager.getConnection
	                           ("jdbc:oracle:thin:@//localhost:1521/orcl2","scott","tiger");
		    stmt = con.createStatement();
			
		    String sql = " SELECT 	empno,"
					+ "				ename,"
					+ "				dname,"
					+ "				sal,"
					+ "				to_char(hiredate,'yyyy-mm-dd') hiredate"
					+ " 	FROM "
					+ "			emp e, dept d "
					+ "		WHERE "
					+ "			e.deptno=d.deptno(+)";
			
			rs = stmt.executeQuery(sql);
			
			items = new ArrayList<Map>();
			Map<String,String> map = new HashMap<String,String>();
			while(rs.next()) {
				map.put("empno", rs.getString("empno"));
				map.put("ename", rs.getString("ename"));
				map.put("dname", rs.getString("dname"));
				map.put("sal", rs.getString("sal"));
				map.put("hiredate", rs.getString("hiredate"));
				items.add(map);
				map = new HashMap<String,String>();
			}
			
		} catch (Exception e) { }
		
		request.setAttribute("resultList", items);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/others/empList.jsp");
		dispatcher.forward(request, response);
		
	}
}





