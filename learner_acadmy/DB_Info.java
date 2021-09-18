package DB;


import java.sql.Connection; import java.sql.DriverManager;
import java.sql.PreparedStatement; import java.sql.ResultSet;
import java.sql.Statement;


import org.apache.catalina.connector.Response;


import bean.Information;


public class DB_Info {


public final String DB_URL = "jdbc:sqlite:C:/Database/Learneracadmy.db"; Connection conn = null;
Statement stmt = null; PreparedStatement pstmt = null; ResultSet rs = null;

public DB_Info() {
}


public void createConnection() throws Exception { Class.forName("org.sqlite.JDBC");
conn = DriverManager.getConnection(DB_URL);
}


public Connection getConnection() {

Connection conn = null; try {
Class.forName("org.sqlite.JDBC");
String DB_URL = "jdbc:sqlite:C:/Database/Learneracadmy.db"; conn = DriverManager.getConnection(DB_URL); System.out.println("Connection IS GOOOD ");
} catch (Exception ex) {
System.out.println(ex.getMessage());
}
return conn;

}


public void releaseResources() throws Exception { if (stmt != null) {
stmt.close();
}
if (conn != null) {
conn.close();
}
if (rs != null) {
rs.close();
}
}


public ResultSet select(String Q) throws Exception { Class.forName("org.sqlite.JDBC");
conn = DriverManager.getConnection(DB_URL); stmt = conn.createStatement();
rs = stmt.executeQuery(Q);

return rs;

}


public boolean getAcces(String quaray) { boolean state = false;
try {
Information info = new Information(); Class.forName("org.sqlite.JDBC");
conn = DriverManager.getConnection(DB_URL); stmt = conn.createStatement();
rs = stmt.executeQuery(quaray); info.setName(rs.getString("Name")); state = true;
} catch (Exception ex) {
System.out.println(ex.getMessage()); return state;
}


return state;
}


public ResultSet select(String Q, String p1) throws Exception { createConnection();
pstmt = conn.prepareStatement(Q); pstmt.setString(1, p1);

rs = pstmt.executeQuery(); return rs;
}


public void releaseResources2() throws Exception { if (pstmt != null) {
pstmt.close();
}
if (conn != null) {
conn.close();
}
if (rs != null) {
rs.close();
}
}


public void InsertUpdateDelete(String Q) throws Exception { createConnection();
stmt = conn.createStatement(); stmt.execute(Q);
if (stmt != null) {
stmt.close();
}
if (conn != null) {
conn.close();
}
}


}
