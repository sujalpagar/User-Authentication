package com.jdbc;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class UserDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserDataController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String operation = request.getParameter("operation");

		String userName = request.getParameter("uName");
		String password = request.getParameter("pass");
		String passwordRepeat = request.getParameter("pass-repeat");

		if (operation == null) {
			operation = "homePage";
		}

		PrintWriter out = response.getWriter();

		try {

			switch (operation) {

			case "homePage":
				homePage(request, response);
				break;

			case "signin":			
				boolean ans = JDBConnection.getConnections(userName, password);
				if(ans) {
					signIn(request, response);
					
				}else {
					HttpSession session = request.getSession();
					session.setAttribute("invalidUser", "UserName And Password Not Found !");
					response.sendRedirect("index.jsp");
					return;
					
				}
				break;

			case "signup":

				if (password.equals(passwordRepeat)) {
					signUp(request, response);
					break;

				} else {
					HttpSession httpsession = request.getSession();
					httpsession.setAttribute("invalidPass", "Passwords Are Not Same !");
					response.sendRedirect("new-user.jsp");
					return;
				}

			default:
				homePage(request, response);
				break;
			}

		} catch (Exception e) {
			throw new ServletException(e);
		}

	}

	private void signUp(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		String userName = request.getParameter("uName");
		String password = request.getParameter("pass");
		
		User user = new User(userName, password);
		String isTrue = JDBConnection.addUser(user);
		
		if(isTrue == "uInserted") {
//			request.setAttribute("isAdd", isTrue);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
//			dispatcher.forward(request, response);
			
			HttpSession session = request.getSession();
			session.setAttribute("inserted", "success");
			response.sendRedirect("index.jsp");

		}else {
			
		}
		
	}

	private void homePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text");

		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");

		dispatcher.forward(request, response);

	}

	private void signIn(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		String userName = request.getParameter("uName");
		String password = request.getParameter("pass");
		String passwordRepeat = request.getParameter("pass-repeat");

		boolean finalOutput = JDBConnection.getConnections(userName, password);
		
		if (finalOutput==true) {
			request.setAttribute("finalAns", finalOutput);
			RequestDispatcher dispatcher = request.getRequestDispatcher("getdata.jsp");
			dispatcher.forward(request, response);
		} else {
			

			HttpSession httpsession = request.getSession();
			httpsession.setAttribute("invalidUser", finalOutput);
			response.sendRedirect("index.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
