package Web;


import java.io.IOException; 
import java.io.PrintWriter; 
import java.rmi.Remote;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
 import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;


import bean.Information; import DB.DB_Info;

/**
* Servlet implementation class Login
*/ @WebServlet("/login")
public class Login extends HttpServlet {
private static final long serialVersionUID = 1L;


/**
* @see HttpServlet#HttpServlet()
*/
public Login() {
super();

// TODO Auto-generated constructor stub

}


/**
*	@see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
*	response)
*/

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
response.getWriter().append("Served at: ").append(request.getContextPath());


}


/**
*	@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
*	response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

try {
if(request.getParameter("Sign in") != null) { Addevent(request, response);
}
} catch (Exception ex) {
response.reset();

}
}

public void Addevent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
DB_Info db = new DB_Info(); try {
if (request.getParameter("Sign in") != null) {


String ID = request.getParameter("ID");
String password = request.getParameter("password"); Information info = new Information(); info.setID(Integer.parseInt(ID)); info.setPassword(password);
String Quaray = "Select * from Admin where ID = " + ID + " And
Password = '" + password + "'";

if (db.getAcces(Quaray)) { response.sendRedirect("HomePage.jsp");

} else {
response.reset();
}
}
} catch (Exception ex) {
response.reset();
}
}
}
