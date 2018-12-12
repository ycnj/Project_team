package com.team.spring.apple;

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
 * Servlet implementation class InsertEmp
 */
@WebServlet("/InsertEmp.do")
public class InsertEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEmp() {
        super();
        System.out.println("= insert emp = ");
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

		request.setCharacterEncoding("UTF-8");
		
		String empno = request.getParameter("empno");
		String ename = request.getParameter("ename");
		String sal = request.getParameter("sal");
		String hiredate = request.getParameter("hiredate");
		String deptno = request.getParameter("deptno");
		
		Connection con = null;
		Statement stmt = null;

		int cnt = 0;
		
		String sql = " INSERT INTO emp ("
		    		+ "				empno,"
					+ "				ename,"
					+ "				deptno,"
					+ "				sal,"
					+ "				hiredate,"
					+ "				comm,"
					+ "				job,"
					+ "				mgr )"
					+ " 	VALUES ( '"+empno+"',"
					+ "				 '"+ename+"',"
					+ "				 '"+deptno+"',"
					+ "				 '"+sal+"',"
					+ "				 '"+hiredate+"',"
					+ " 			 '0','CLERK','7788')";
		
		 System.out.println(sql);
		 
		 try {
			Class.forName("oracle.jdbc.OracleDriver");
		    con = DriverManager.getConnection
	                           ("jdbc:oracle:thin:@//localhost:1521/orcl2","scott","tiger");
		    stmt = con.createStatement();
			cnt = stmt.executeUpdate(sql);
		} catch (Exception e) { }
		
		 PrintWriter out = response.getWriter();
		 out.print(cnt);

		/*request.setAttribute("cnt", cnt);
		RequestDispatcher dispatcher = 
				request.getRequestDispatcher("/others/empList.jsp");
		dispatcher.forward(request, response);*/
		
	}
}





