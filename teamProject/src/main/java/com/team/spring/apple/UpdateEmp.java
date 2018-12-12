package com.team.spring.apple;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateEmp
 */
@WebServlet("/UpdateEmp.do")
public class UpdateEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmp() {
        super();
        System.out.println("== update ==");
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
		
		String sql  = " UPDATE emp "
					+ " 	SET "
					+ "		ename='"+ename+"',"
					+ "		deptno='"+deptno+"',"
					+ "		sal='"+sal+"',"
					+ "		hiredate='"+hiredate+"'"
					+ " WHERE "
					+ "	    empno='"+empno+"'";
		 
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






