package test;

import java.sql.*;

import oracle.jdbc.OracleTypes;

public class testMain {

	public static void main(String[] args) {

		
		String userId = "busan051";

		Connection con = null;
		CallableStatement csmt = null;
		ResultSet rs = null;
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String userID = "FOURWAY";
		String userPass = "1";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			con = DriverManager.getConnection(url,userID,userPass);
			
			String strProcName = "{call PKG_POLICYS.PROC_MB_SEL(?,?,?)}";
			csmt = con.prepareCall(strProcName);
			csmt.setString(1, userId);
			csmt.registerOutParameter(2, OracleTypes.VARCHAR);
			csmt.registerOutParameter(3, OracleTypes.CURSOR);
			csmt.execute();
			
			int rowcount = csmt.getInt(2);
			
			rs = (ResultSet)csmt.getObject(3);
			
			rowcount = (rowcount + 4) * 29;
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
