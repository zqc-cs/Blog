package JavaCode;

import java.sql.Connection;
import java.sql.SQLException;

import com.mchange.v2.c3p0.ComboPooledDataSource;
public class JDBCUtils {
    //数据库用户名  
    private static final String USERNAME = "javaweb";  
    //数据库密码  
    private static final String PASSWORD = "";  
    //驱动信息   
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";  
    //数据库地址  
    private static final String JDBCURL = "jdbc:mysql://localhost:3306/javaweb?useUnicode=true&characterEncoding=UTF-8";  
    
    //C3P0连接池 ,也可以采用c3p0-config.xml配置方式
    public static ComboPooledDataSource dataSource;  
    static {  
        try {  
        	System.out.println("static");
            dataSource = new ComboPooledDataSource();  
            dataSource.setUser(USERNAME);  
            dataSource.setPassword(PASSWORD);  
            dataSource.setJdbcUrl(JDBCURL);  
            dataSource.setDriverClass(DRIVER);  
            dataSource.setInitialPoolSize(10);  
            dataSource.setMinPoolSize(5);  
            dataSource.setMaxPoolSize(50);  
            dataSource.setMaxStatements(100);  
            dataSource.setMaxIdleTime(60);
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        
    } 
    
    /** 
     * 从C3P0连接池中获取数据源链接 
     * @return Connection 数据源链接 
     */  
    public static Connection getConnection() {
     Connection conn = null;  
        try {  
        	System.out.println("getting");
         conn = dataSource.getConnection();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        } 
        return conn;  
    }      
    
}