package Web;

import java.io.IOException;

import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DB.DB_Info;
import java.sql.*;

/**
* Servlet implementation class Edit
*/ @WebServlet("/edit")
public class Edit extends HttpServlet {
private static final long serialVersionUID = 1L;

/**
* @see HttpServlet#HttpServlet()
*/
public Edit() {
super();
// TODO Auto-generated constructor stub
}

/**
*	@see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
*	response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
// TODO Auto-generated method stub response.getWriter().append("Served at:
").append(request.getContextPath());
}

/**
*	@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
*	response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
// TODO Auto-generated method stub

String page = "";
if (request.getParameter("assign") != null) {

try {
DB_Info db = new DB_Info();

Connection conn = db.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs;
String ClassNumber = request.getParameter("classNum");
String ClassTime = request.getParameter("classTime");
String SubName = request.getParameter("SubjectName");

rs = stmt.executeQuery("UPDATE subject SET class = "
+ Integer.parseInt(ClassNumber) + " , time = "
+ Integer.parseInt(ClassTime) + " WHERE subject.sub = '" + SubName + "'");



} catch (Exception ex) { System.out.println(ex.getMessage().toString());

page = "Editing.jsp";
} finally {
page = "Editing.jsp";

}

RequestDispatcher dd = request.getRequestDispatcher(page); dd.forward(request, response);
} else if (request.getParameter("assignNTeacher") != null) {

try {
DB_Info db = new DB_Info();

Connection conn = db.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs;
String TeacherID = request.getParameter("TeacherID");
String TeacherName = request.getParameter("TeacherName");
String classNumber = request.getParameter("classNumber");
String classTime = request.getParameter("classTime");

rs = stmt.executeQuery("UPDATE teachers SET class ="
+ classNumber + " , time =" + classTime
+ " where ID =" + TeacherID + " and
Name = '" + TeacherName + "'");

} catch (Exception ex) { System.out.println(ex.getMessage().toString());

page = "Editing.jsp";
} finally {

page = "Editing.jsp";

}

RequestDispatcher dd = request.getRequestDispatcher(page); dd.forward(request, response);
} else if (request.getParameter("GetBack") != null)

try {
page = "HomePage.jsp";
} catch (Exception ex) { System.out.println(ex.getMessage().toString());

page = "Editing.jsp";
}
RequestDispatcher dd = request.getRequestDispatcher(page); dd.forward(request, response);
}

}
