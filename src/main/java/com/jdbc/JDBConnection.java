package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBConnection {
	
	static String uname = "";
	static String upass = "";
	
	
	public static void newUser(String userName, String userPass) {
		User user = new User(userName, userPass);
		
	}
	
	
	public static boolean getConnections(String userNameInput, String userPassInput) throws SQLException {
		

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","root");
		PreparedStatement smt = con.prepareStatement("select * from userdata where userName = ?");
		smt.setString(1, userNameInput);
		
		ResultSet rs = smt.executeQuery();
		while(rs.next()) {
			uname = rs.getString(1);
			upass = rs.getString(2);
		}
		
		if(uname.equals(userNameInput) && upass.equals(userPassInput)) {
			return true;
		}else {
			return false;
		}		
	}


	public static String addUser(User user) throws SQLException {
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","root");
		PreparedStatement smt = con.prepareStatement(" insert into userdata values ( ? , ? );");
		smt.setString(1, user.getUserName());
		smt.setString(2, user.getUserPassword());
		
		smt.executeUpdate();
		
		if(getConnections(user.getUserName(), user.getUserPassword())==true) {
			return "uInserted";
		}else {
			return "uNotInserted";
		}
		
	}
	
	
	
	

	
}
