
<%@page import="Model.User"%>
<%@page import="Model.DBAdmin"%>
<%@page import="com.sun.xml.internal.ws.util.StringUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Thread"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    private boolean isValidType(String type) {
        return type.equalsIgnoreCase("discussion") || type.equalsIgnoreCase("bug") || type.equalsIgnoreCase("funny") || type.equalsIgnoreCase("other");
    }

    private boolean isValidSort(String sort) {
        return sort.equalsIgnoreCase("week") || sort.equalsIgnoreCase("new") || sort.equalsIgnoreCase("today") || sort.equalsIgnoreCase("month") || sort.equalsIgnoreCase("all");
    }
%>

<%
    String url = DBAdmin.WEB_URL;
    String type = request.getParameter("type");
    String sort = request.getParameter("sort");
    int pageNum;

    ArrayList<Thread> threads = (ArrayList<Thread>) request.getAttribute("threads");
    ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
    ArrayList<String> pageCount = (ArrayList<String>) request.getAttribute("pageCount");
    ArrayList<String> pageCountUrl = (ArrayList<String>) request.getAttribute("pageCountUrl");

    try {
        pageNum = Integer.parseInt(request.getParameter("page"));
    } catch (NumberFormatException ex) {
        pageNum = 1;
    }

    if (type == null || !isValidType(type)) {
        type = "default";
    }

    if (sort == null || !isValidSort(sort)) {
        sort = "new";
    }

    if (threads == null) {
        type = type.toLowerCase();
        sort = sort.toLowerCase();
        response.sendRedirect("forum");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Forums</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/coreF.css">
        <link rel="stylesheet" type="text/css" href="css/fStruc.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <div id="headerSeparator">
        </div>
        <nav class="navbar navbar-findcond navbar-fixed-top" style="height: 78px">
            <div class="container" style="margin-top: 10px; position: relative; width: 80%;">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="logo"><img src="resource/blogo.png" class="img-responsive" style="margin: auto; margin-top: 5px;" alt="front logo"></div>
                </div>
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="nav navbar-nav navbar-left">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-menu-hamburger"></span> Menu 
                                <ul class="dropdown-menu" role="menu" style="background-color: #4fa78b;">
                                    <li><a href="#">Main Menu</a></li>
                                    <li><a href="#">Library</a></li>
                                    <li><a href="#">My modules</a></li>
                                    <li><a href="#">Achievements</a></li>
                                    <li><a href="#">Leaderboards</a></li>
                                    <li><a href="#">Forums</a></li>
                                    <li style="padding-right: 5%"><button class="button" type="button" style="float: right; background-color: #4fa78b;">
                                            <span class="glyphicon glyphicon-cog"></span></button></li>
                                </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="#">Log in <span class="sr-only">(current)</span></a></li>
                        <li class="active"><a href="#">Sign up <span class="sr-only">(current)</span></a></li>
                    </ul>
                    <form class="navbar-form navbar-left search-form" role="search" style="position: absolute; left: 30%; right: 30%">
                        <input type="text" class="form-control" placeholder="Search" style="width: 100%;" />
                    </form>
                </div>
            </div>
        </nav>
        <div id="container">
            <div id="fStructure">
                <%
                    if (type.equalsIgnoreCase("default")) {
                %>
                <div id="fSTitle">
                    <B>Forums</b>
                </div>
                <div id="fListContainer">
                    <table>
                        <tr><th>Discussion</th><th></th><th></th><th></th><th></th></tr>
                        <tr>
                            <td>Topic</td></td><td>
                            <td>Created By</td>
                            <td>Posts</td>
                            <td>Time</td>
                        </tr>
                        <%
                            for (int i = 0; i < threads.size(); i++) {
                                if (threads.get(i).getThreadType().equalsIgnoreCase("discussion")) {
                                    out.println("<tr>");
                                    out.println("<td><a href=\"" + url + "thread?tid=" + threads.get(i).getThreadID() + "\">" + threads.get(i).getThreadTitle() + "</a></td></td><td>");
                                    out.println("<td>" + userList.get(i).getUsername() + "</td>");
                                    out.println("<td>" + threads.get(i).getReplyCount() + "</td>");
                                    out.println("<td>" + threads.get(i).getThreadTimeFormatted()+ "</td>");
                                    out.println("</tr>");
                                }
                            }
                        %>
                        <tr>
                            <td></td><td><a href="<% out.println(url + "forum?type=discussion"); %>">See All Threads</a></td><td></td><td></td><td></td>
                        </tr>
                    </table>
                </div>
                <div id="fListContainer">
                    <table>
                        <tr><th>Funny</th><th></th><th></th><th></th><th></th></tr>
                        <tr>
                            <td>Topic</td></td><td>
                            <td>Created By</td>
                            <td>Posts</td>
                            <td>Time</td>
                        </tr>
                        <%
                            for (int i = 0; i < threads.size(); i++) {
                                if (threads.get(i).getThreadType().equalsIgnoreCase("funny")) {
                                    out.println("<tr>");
                                    out.println("<td><a href=\"" + url + "thread?tid=" + threads.get(i).getThreadID() + "\">" + threads.get(i).getThreadTitle() + "</a></td></td><td>");
                                    out.println("<td>" + userList.get(i).getUsername() + "</td>");
                                    out.println("<td>" + threads.get(i).getReplyCount() + "</td>");
                                    out.println("<td>" + threads.get(i).getThreadTimeFormatted()+ "</td>");
                                    out.println("</tr>");
                                }
                            }
                        %>
                        <tr>
                            <td></td><td><a href="<% out.println(url + "forum?type=funny"); %>">See All Threads</td><td></td><td></td><td></td>
                        </tr>
                    </table>
                </div>
                <div id="fListContainer">
                    <table>
                        <tr><th>Bug</th><th></th><th></th><th></th><th></th></tr>
                        <tr>
                            <td>Topic</td></td><td>
                            <td>Created By</td>
                            <td>Posts</td>
                            <td>Time</td>
                        </tr>
                        <%
                            for (int i = 0; i < threads.size(); i++) {
                                if (threads.get(i).getThreadType().equalsIgnoreCase("bug")) {
                                    out.println("<tr>");
                                    out.println("<td><a href=\"" + url + "thread?tid=" + threads.get(i).getThreadID() + "\">" + threads.get(i).getThreadTitle() + "</a></td></td><td>");
                                    out.println("<td>" + userList.get(i).getUsername() + "</td>");
                                    out.println("<td>" + threads.get(i).getReplyCount() + "</td>");
                                    out.println("<td>" + threads.get(i).getThreadTimeFormatted()+ "</td>");
                                    out.println("</tr>");
                                }
                            }
                        %>
                        <tr>
                            <td></td><td><a href="<% out.println(url + "forum?type=bug"); %>">See All Threads</td><td></td><td></td><td></td>
                        </tr>
                    </table>
                </div>
                <div id="fListContainer">
                    <table>
                        <tr><th>Other</th><th></th><th></th><th></th><th></th></tr>
                        <tr>
                            <td>Topic</td></td><td>
                            <td>Created By</td>
                            <td>Posts</td>
                            <td>Time</td>
                        </tr>
                        <%
                            for (int i = 0; i < threads.size(); i++) {
                                if (threads.get(i).getThreadType().equalsIgnoreCase("other")) {
                                    out.println("<tr>");
                                    out.println("<td><a href=\"" + url + "thread?tid=" + threads.get(i).getThreadID() + "\">" + threads.get(i).getThreadTitle() + "</a></td></td><td>");
                                    out.println("<td>" + userList.get(i).getUsername() + "</td>");
                                    out.println("<td>" + threads.get(i).getReplyCount() + "</td>");
                                    out.println("<td>" + threads.get(i).getThreadTimeFormatted()+ "</td>");
                                    out.println("</tr>");
                                }
                            }
                        %>
                        <tr>
                            <td></td><td><a href="<% out.println(url + "forum?type=other"); %>">See All Threads</td><td></td><td></td><td></td>
                        </tr>
                    </table>
                </div>
                <%
                } else {
                %>
                <div id="fSTitle">
                    <% out.println("<B>" + StringUtils.capitalize(type) + "</b>"); %>
                </div>
                <div id="fListContainer">
                    <table>
                        <tr><th><a href="<% out.print(url + "forum"); %>">Forum</a> ►  <a href="<% out.print(url + "forum?type=" + type); %>"><% out.print(StringUtils.capitalize(type)); %></a></th><th></th><th></th><th></th><th></th></tr>
                        <tr>
                            <td>Topic</td></td><td>
                            <td>Created By</td>
                            <td>Posts</td>
                            <td>Time</td>
                        </tr>
                        <%
                            for (int i = 0; i < threads.size(); i++) {
                                out.println("<tr>");
                                out.println("<td><a href=\"" + url + "thread?tid=" + threads.get(i).getThreadID() + "\">" + threads.get(i).getThreadTitle() + "</a></td></td><td>");
                                out.println("<td>" + userList.get(i).getUsername() + "</td>");
                                out.println("<td>" + threads.get(i).getReplyCount() + "</td>");
                                out.println("<td>" + threads.get(i).getThreadTimeFormatted()+ "</td>");
                                out.println("</tr>");
                            }
                        %>
                        <tr>
                            <td></td><td>
                            <%
                                for (int p = 0; p < pageCount.size(); p++) {
                            %>
                            <a style='text-decoration: none;' href="<% out.print(pageCountUrl.get(p)); %>"><% out.print(pageCount.get(p)); %></a>
                            <%
                                }
                            %>
                            </td><td></td><td></td><td></td>
                        </tr>
                    </table>
                </div>
                <%
                    }
                %>
            </div>
        </div>

        <div id="footer">
            Powered by ZeeTech
        </div>
        <!--<a href="main.html">Main Menu</a>
        <br><a href="library.html">Library</a>
        <br><a href="my_modules.html">My Modules</a>
        <br><a href="achievement.html">Achievements</a>
        <br><a href="leaderboard.html">Leaderboards</a>
        <br><a href="forum.html">Forums</a>
        <br><a href="setting.html">Setting</a>

        <br>Sign In
        <br>Log In-->
    </body>
</html>