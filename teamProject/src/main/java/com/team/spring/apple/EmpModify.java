package com.team.spring.apple;

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
 * Servlet implementation class EmpModify
 */
@WebServlet("/empModify.do")
public class EmpModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpModify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestPro(request,response);
	}

	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String empno = request.getParameter("empno");

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
					+ "				deptno,"
					+ "				sal,"
					+ "				to_char(hiredate,'yyyy-mm-dd') hiredate"
					+ " 	FROM "
					+ "			emp"
					+ "		WHERE "
					+ "			empno='"+empno+"'";
			
			rs = stmt.executeQuery(sql);
			Map<String,String> map = new HashMap<String,String>();
			while(rs.next()) {
				map.put("empno", rs.getString("empno"));
				map.put("ename", rs.getString("ename"));
				map.put("deptno", rs.getString("deptno"));
				map.put("sal", rs.getString("sal"));
				map.put("hiredate", rs.getString("hiredate"));
			}
			request.setAttribute("resultList", map);
			
		} catch (Exception e) { }

		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/others/empModify.jsp");
		dispatcher.forward(request, response);
		
	}
	
}







