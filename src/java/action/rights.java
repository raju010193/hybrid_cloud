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
import pack.Dbconnection;
import pack.MailUtil;

/**
 *
 * @author Rajashekar
 */
public class rights extends HttpServlet {

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
            String accessToken = request.getParameter("token");
            String userName = request.getParameter("uname");
           
            String fileUpload = request.getParameter("upload");
            String fileUpdate = request.getParameter("update");
            String fileDownload = request.getParameter("download");

            Connection connection = Dbconnection.getConn();
            Statement stmt = connection.createStatement();
            int i = stmt.executeUpdate("update rights  set upload_='" + fileUpload + "',update_='" + fileUpdate + "',download_='" + fileDownload + "' where token_='" + accessToken + "'");
            ResultSet rt = stmt.executeQuery("select mail from user_reg where username='" + userName + "'");

            if (rt.next()) {
                String[] mail = new String[]{rt.getString("mail")};
                String message = "Token:" + accessToken + ";\n " + "Your Rights \n Update: " + fileUpdate + ";\n Upload:" + fileUpload + ";\nDownload:" + fileDownload;
                new MailUtil().sendMail(mail, mail, "Token", message);
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Email Error');");
                out.println("location='users.jsp';");
                out.println("</script>");

            }


            if (i != 0) {
                response.sendRedirect("users.jsp?rights='updated'");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Updating Error');");
                out.println("location='users.jsp';");
                out.println("</script>");

            }

        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Updating Error');");
            out.println("location='users.jsp';");
            out.println("</script>");
            out.println(e);
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
