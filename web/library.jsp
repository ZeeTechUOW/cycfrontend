<%@page import="Model.Module"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<Module> modules = (ArrayList<Module>) request.getAttribute("modules");
%>

<!DOCTYPE>
<html>
    <head>
        <title>Library</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/coreF.css">
        <link rel="stylesheet" type="text/css" href="css/mStruc.css">
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
            <div id="structure">
                <div id="sTitle">
                    My Library
                </div>
                <div id="sMore">
                </div>
                <div id="sDisp">
                    <table>
                        <%
                            for (int i = 0; i < modules.size(); i++) {
                                if(i % 6 == 0) {
                        %>
                        <tr>
                        <%
                                }
                        %>
                            <td>
                                <div id="sFrame">
                                    <div class="frame"><img src="<% out.print(modules.get(i).getThumbnailPath()); %>" alt="f1" id="team"></div>
                                </div>
                            </td>
                        <%
                                if(i % 6 == 5) {
                        %>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                </div>
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