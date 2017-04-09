/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pack.Dbconnection;
import pack.decryption;

/**
 *
 * @author Rajashekar
 */
public class download extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String fileId = request.getQueryString();
            String fileName = null, fileKey = null;
            InputStream is = null;

            Connection conection = Dbconnection.getConn();
            Statement stmt = conection.createStatement();
            Statement stmt1 = conection.createStatement();

            HttpSession user = request.getSession();
            String userName = user.getAttribute("username").toString();
            String name = user.getAttribute("name").toString();


            Statement stmt2 = conection.createStatement();
            ResultSet rest2 = stmt2.executeQuery("select * from rights where username_='" + userName + "'");
            if (rest2.next()) {
                String up = rest2.getString("download_");
                if (up.equalsIgnoreCase("yes")) {
                } else {
                    response.sendRedirect("user_page1.jsp?no='yes'");
                }
            }



            ResultSet rt = stmt.executeQuery("select * from file where idfiles='" + fileId + "'");

            if (rt.next()) {
                fileName = rt.getString("filename");
                
                is = (InputStream) rt.getAsciiStream("content");
            } else {
                  out.println("<script type=\"text/javascript\">");
            out.println("alert('Error while retreiving data');");
            out.println("location='user_page1.jsp';");
            out.println("</script>");
                

            }

            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            String temp = null;
            StringBuffer stringBuffer = new StringBuffer();
            while ((temp = br.readLine()) != null) {
                stringBuffer.append(temp);
            }
            String content = new decryption().decrypt(stringBuffer.toString(), fileKey);

            response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
            out.write(content);



            Calendar cal = Calendar.getInstance();
            DateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String time = dateformat.format(cal.getTime());
            System.out.println("download time:" + time);

            stmt1.executeUpdate("insert into downloads (filename,username,time)values('" + fileName + "','" + userName + "','" + time + "')");


        } catch (Exception e) {
             out.println("<script type=\"text/javascript\">");
            out.println("alert('Error while retreiving data');");
            out.println("location='user_page1.jsp';");
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
