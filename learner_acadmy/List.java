package Web;


import java.io.IOException; 
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.ResultSet; 
import java.sql.Statement;

import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse;

import DB.DB_Info;


/**
* Servlet implementation class List
*/ @WebServlet("/list")
public class List extends HttpServlet {
private static final long serialVersionUID = 1L;


/**
* @see HttpServlet#HttpServlet()
*/
public List() { super();
// TODO Auto-generated constructor stub

}

/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


}

/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




if (request.getParameter("Get Back")!=null) { response.sendRedirect("HomePage.jsp");
}




}







}
