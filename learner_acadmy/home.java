package Web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Information;

/**
* Servlet implementation class home
*/ @WebServlet("/home")
public class home extends HttpServlet {
private static final long serialVersionUID = 1L;

/**
* @see HttpServlet#HttpServlet()
*/
public home() {
super();
// TODO Auto-generated constructor stub
}

/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException {
// TODO Auto-generated method stub Information info = new Information(); response.getWriter().append("Served at:
").append(request.getContextPath());
PrintWriter out = response.getWriter();



}

/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub doGet(request, response); if(request.getParameter("Lists")!=null) {
response.sendRedirect("Lists.jsp");
}else if(request.getParameter("Edit Lists")!=null) {
response.sendRedirect("Editing.jsp");
}else if (request.getParameter("Sign Out")!=null) { response.sendRedirect("AdminLogin.jsp");
}
}

}
