/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;

/**
 *
 * @author Rajashekar
 */
public class user_login extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String userName = request.getParameter("username");
            String password = request.getParameter("password");

            Connection connection = Dbconnection.getConn();
            Statement stmt = connection.createStatement();
            ResultSet rt = stmt.executeQuery("select * from user_reg where username='" + userName + "'");
            if (rt.next()) {
                String pass = rt.getString("password");
                String activate = rt.getString("activate");
                String name = rt.getString("name");
                if (password.equalsIgnoreCase(pass)) {
                    if (activate.equalsIgnoreCase("yes")) {
                        HttpSession user = request.getSession(true);
                        user.setAttribute("name", name);
                        user.setAttribute("username", userName);
                        response.sendRedirect("user_page.jsp");
                    } else {

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Your not Yet Activeted');");
                        out.println("location='user.jsp';");
                        out.println("</script>");
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invlid Password');");
                    out.println("location='user.jsp';");
                    out.println("</script>");

                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid UserName');");
                out.println("location='user.jsp';");
                out.println("</script>");

            }
        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Server is busy try again later..');");
            out.println("location='user.jsp';");
            out.println("</script>");


        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
