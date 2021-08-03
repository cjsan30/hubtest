package test;

import java.sql.*;

import oracle.jdbc.OracleTypes;

public class test {
	public void getcon() {
		Connection con = null;
		CallableStatement csmt = null;
		ResultSet rs = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userID = "FOURWAY";
		String userPass = "1";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(url,userID,userPass);
			
			String strProcName = "{call PKG.PROC(?,?)}";

			csmt = con.prepareCall(strProcName);
			csmt.setString(1, strProcName);
			csmt.registerOutParameter(2, OracleTypes.CURSOR);
			
			rs = (ResultSet)csmt.getObject(2);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}