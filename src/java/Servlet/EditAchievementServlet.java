/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.Achievement;
import Model.DBAdmin;
import Model.Module;
import Model.User;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Deni Barasena
 */
public class EditAchievementServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get user session
        User loggedUser = (User) request.getSession().getAttribute("loggedUser");
        if( loggedUser == null ) {
            response.sendRedirect("login");
            return;
        }
        
        // Initialize variable
        String op = request.getParameter("op");
        String newName = request.getParameter("achievementName");
        String newDescription = request.getParameter("achievementDescription");
        int achievementID;
        int moduleID;
        int unlockedModuleCount;
        Module module;
        ArrayList<Achievement> achievements;

        // Parse all parameter
        try {
            moduleID = Integer.parseInt(request.getParameter("mid"));
        } catch (NumberFormatException ex) {
            // Redirect to 404
            response.sendRedirect("main");
            return;
        }
        if (op == null) {
            op = "";
        }

        // Fetch Module
        module = DBAdmin.getModule(moduleID);
        if (module == null) {
            response.sendRedirect("main");
            return;
        }

        if( loggedUser.getUserID() != module.getUserID() ) {
            response.sendRedirect("main");
            return;
        }
        
        switch (op) {
            case "del":
                try {
                    achievementID = Integer.parseInt(request.getParameter("aid"));
                    DBAdmin.removeAchievement(moduleID, achievementID);
                } catch (NumberFormatException e) {
                }

                break;
            case "edit":
                try {
                    achievementID = Integer.parseInt(request.getParameter("aid"));
                    DBAdmin.editAchievement(moduleID, achievementID, newName, newDescription);
                } catch (NumberFormatException e) {
                }

                break;
            case "add":
                DBAdmin.addAchievement(moduleID, newName, newDescription);
                break;
        }

        // Fetch achievement
        if (loggedUser == null) {
            achievements = DBAdmin.getAllAchievement(moduleID);
        } else {
            achievements = DBAdmin.getAllAchievement(moduleID, loggedUser.getUserID());
        }

        // Count unlocked achievement
        unlockedModuleCount = 0;
        for (Achievement a : achievements) {
            if (a.getUnlockTime() != LocalDateTime.MIN) {
                unlockedModuleCount++;
            }
        }

        // Set Atrribute
        request.setAttribute("module", module);
        request.setAttribute("achievements", achievements);
        request.setAttribute("unlockedModuleCount", unlockedModuleCount);

        // Forward to view
        request.getRequestDispatcher("editachievement.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
