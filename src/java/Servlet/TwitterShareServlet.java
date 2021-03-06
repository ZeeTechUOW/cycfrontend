/*
 * Copyright 2017 Andree Yosua.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package Servlet;

import Model.DirectoryAdmin;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import twitter4j.StatusUpdate;
import twitter4j.Twitter;
import twitter4j.TwitterException;

/**
 *
 * @author Andree Yosua
 */
public class TwitterShareServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String share = request.getParameter("share");

        if (share.equalsIgnoreCase("post")) {
            int threadID;
            int page;

            try {
                threadID = Integer.parseInt(request.getParameter("tid"));
            } catch (NumberFormatException ex) {
                threadID = 0;
                Logger.getLogger(TwitterShareServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                page = Integer.parseInt(request.getParameter("page"));
            } catch (NumberFormatException ex) {
                page = 1;
                Logger.getLogger(TwitterShareServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            Twitter twitter = (Twitter) request.getSession().getAttribute("twitter");
            StatusUpdate su = new StatusUpdate(DirectoryAdmin.getURLContextPath(request) + "/thread?tid=" + threadID + "&page=" + page);

            try {
                twitter.updateStatus(su);
            } catch (TwitterException ex) {
                Logger.getLogger(TwitterShareServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (share.equalsIgnoreCase("module")) {
            int moduleID;
            
            try {
                moduleID = Integer.parseInt(request.getParameter("mid"));
            } catch (NumberFormatException ex) {
                moduleID = 0;
                Logger.getLogger(TwitterShareServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            Twitter twitter = (Twitter) request.getSession().getAttribute("twitter");
            StatusUpdate su = new StatusUpdate(DirectoryAdmin.getURLContextPath(request) + "/module?mid=" + moduleID);
            
            try {
                twitter.updateStatus(su);
            } catch (TwitterException ex) {
                Logger.getLogger(TwitterShareServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
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
