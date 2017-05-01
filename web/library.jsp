<%@page import="Model.User"%>
<%@page import="Model.DBAdmin"%>
<%@page import="Model.Module"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String url = DBAdmin.WEB_URL;
    User loggedUser = (User) request.getSession().getAttribute("loggedUser");

    ArrayList<Module> modules = (ArrayList<Module>) request.getAttribute("modules");
%>

<!DOCTYPE>
<html>
    <head>
        <title>Library</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/color1/coreF.css">
        <link rel="stylesheet" type="text/css" href="css/color1/mStruc.css">
        <script src="jquery/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div id="container" >
            <div id="structure">
                <div id="sTitle">
                    My Library
                </div>
                <div id="sMore">
                </div>
                <div id="sDisp">
                    <ul class="list-inline list-unstyled">

                        <%
                            for (int i = 0; i < modules.size(); i++) {
                        %>
                        <li id="sFrame">
                            <a href="<% out.print(url + "module?mid=" + modules.get(i).getModuleID());%>">
                                <div class="frame">
                                    <jsp:include page="moduleThumb.jsp">
                                        <jsp:param name="moduleID" value="<%=modules.get(i).getModuleID()%>"></jsp:param>
                                        <jsp:param name="moduleName" value="<%=modules.get(i).getModuleName()%>"></jsp:param>
                                    </jsp:include>
                                </div>
                            </a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>

        <div id="footer">
            Powered by ZeeTech
        </div>
    </body>
</html>