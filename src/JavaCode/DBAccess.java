package JavaCode;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.MessageFormat;

import org.apache.commons.lang3.StringEscapeUtils;


public class DBAccess {
	public DBAccess() {
		
	}
	public static boolean register(User user) throws SQLException {
		Connection conn = null;
		try {
			conn = JDBCUtils.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("获取连接失败");
			return false;
		}
		if(conn == null) {
			System.out.println("无法连接");
			return false;
		}
		String sql = MessageFormat.format("insert into user (uid, upassword, uname, upagenums, upagesset) " +
				"values (\"{0}\", \"{1}\", \"{2}\", {3}, {4});", user.uID, user.uPassWord, user.uName, user.uPageNum, user.uPagesSet);
		Statement smStatement = null;
//		System.out.println(sql);
		int r = 0;
		try {
			smStatement = conn.createStatement();
			r = smStatement.executeUpdate(sql);
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
        //4.执行
		if (r == 0) {
			return false;
		}
		return true;
	}
	public static boolean login(User user) {
		String sql = MessageFormat.format("Select uid,upassword,uname,upagenums,upagesset from user where uID=\"{0}\"", user.uID);
		Connection connection = null;
		Statement statement = null;
		boolean match = false;
//		System.out.println(sql);
		ResultSet rSet = null;
		try {
			connection = JDBCUtils.getConnection();
			if (connection == null) System.out.println("awfawfaw");
			statement = connection.createStatement();
			rSet = statement.executeQuery(sql);
			while(rSet.next()) {
				if(rSet.getString(1).equals(user.uID) && rSet.getString(2).equals(user.uPassWord) ) {
					user.setuName(rSet.getString(3));
					user.setuPageNum(rSet.getInt(4));
					String pagesSetString = rSet.getString(5);
					user.setuPagesSet(pagesSetString);
					match = true;
//					System.out.println(user.uID + "   " + user.uName + "   " + user.uPageNum + "   " + user.uPagesSet + "   " + user.uPassWord);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				rSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return match;
	}
	public static boolean post(Page newPage) {
		Connection conn = null;
		try {
			conn = JDBCUtils.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("获取连接失败");
			return false;
		}
		if(conn == null) {
			System.out.println("无法连接");
			return false;
		}
		System.out.println(newPage.pTitle);
		String sql = MessageFormat.format("insert into website (pid, ptitle, pdate, pintro, pcontent, uid) " +
				"values (\"{0}\", \"{1}\", \"{2}\", \"{3}\", \"{4}\", \"{5}\");", newPage.pUrl, newPage.pTitle, newPage.pDate, newPage.pIntro, StringEscapeUtils.escapeHtml4(newPage.pContent), newPage.pUser);
		Statement smStatement = null;
		System.out.println(sql);	
		int r = 0;
		try {
			smStatement = conn.createStatement();
			r = smStatement.executeUpdate(sql);
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
        //4.执行
		if (r == 0) {
			return false;
		}
		return true;
	}
	public static boolean updateUser(User user) {
		Connection conn = null;
		try {
			conn = JDBCUtils.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("获取连接失败");
			return false;
		}
		if(conn == null) {
			System.out.println("无法连接");
			return false;
		}
		String sql = MessageFormat.format("update user set uid=\"{0}\",upassword=\"{1}\",uname=\"{2}\",upagenums={3},upagesset=\"{4}\" where uid = \"{5}\"; ", user.uID, user.uPassWord, user.uName, user.uPageNum, user.uPagesSet, user.uID);
		Statement smStatement = null;
		int r = 0;
		try {
			smStatement = conn.createStatement();
			r = smStatement.executeUpdate(sql);
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
        //4.执行
		if (r == 0) {
			return false;
		}
		return true;
	}
	public static ResultSet pageOverview() {
		Connection conn = null;
		ResultSet resultSet = null;
		try {
			conn = JDBCUtils.getConnection();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("获取连接失败");
			return null;
		}
		if(conn == null) {
			System.out.println("无法连接");
			return null;
		}
		String sql = "select pid,ptitle,pdate,pintro from website;";
		Statement smStatement = null;
		System.out.println(sql);	
		try {
			smStatement = conn.createStatement();
			resultSet = smStatement.executeQuery(sql);
			if (conn != null) {
//				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return resultSet;
	}
}
