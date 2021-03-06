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
package Editor;

import Model.DirectoryAdmin;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Deni Barasena
 */
public class DirectoryServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String op = request.getParameter("op");
        String path = request.getParameter("path");
        String filter = request.getParameter("filter");
        String to = request.getParameter("to");
        String newName = request.getParameter("newName");

        if (path != null && !path.startsWith("/")) {
            path = "/" + path;
        }
        if (to != null && !to.startsWith("/")) {
            to = "/" + to;
        }

//        File folder = new File(request.getSession().getServletContext().getRealPath(path));
        File folder = new File(DirectoryAdmin.getPath(request, path));

        if (null != op) {
            switch (op) {
                case "list":
                    out.print(String.format("{\"files\": [%s]}", DirectoryAdmin.listDirectoryToJSON(folder, path, filter)));
                    break;
                case "move":
//                    File toFolder = new File(request.getSession().getServletContext().getRealPath(to));
                    File toFolder = new File(DirectoryAdmin.getPath(request, to));
                    DirectoryAdmin.moveFiles(folder, toFolder);
                    break;
                case "rename":
                    DirectoryAdmin.renameFile(folder, newName);
                    break;

                case "delete":
                    out.print("Delete Folder " + folder.getAbsolutePath());
                    DirectoryAdmin.deleteFile(folder);
                    break;
                case "newFolder":
                    DirectoryAdmin.createNewDirectory(folder, newName);
                    break;

                default:
                    break;
            }
        }

        out.flush();
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
