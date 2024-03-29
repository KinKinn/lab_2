/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author TGDD
 */
@WebServlet(name="SettingController", urlPatterns={"/setting"})
public class SettingController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        if(request.getSession().getAttribute("User") == null) {
            response.sendRedirect("index");
            return;
        }
        request.getRequestDispatcher("setting.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String confirm = request.getParameter("confirmNewPassword");
        String password = request.getParameter("newPassword");
        String OldPassword = request.getParameter("oldPassword");
        if(!password.equals(confirm)) {
            request.setAttribute("error", "Confirm password not match!");
        } else {
            if(OldPassword.equals(password)) {
                request.setAttribute("error", "New password cannot be the same as old password!");
                request.getRequestDispatcher("setting.jsp").forward(request, response);
                return;
            }
            User u = (User)request.getSession().getAttribute("User");
            try {
                boolean check = UserDAO.changePass(u.getId(), OldPassword, password);
                if(check) {
                    request.setAttribute("error", "Change password successfully!");
                    request.getRequestDispatcher("setting.jsp").forward(request, response);
                    return;
                }
            } catch(Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("error", "Old password not match!");
            request.getRequestDispatcher("setting.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("setting.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
