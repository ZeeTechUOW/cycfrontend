
<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.ModuleUserData"%>
<%@page import="Model.Module"%>
<%@page import="Model.DBAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String url = DBAdmin.WEB_URL;
    
    Module module = (Module) request.getAttribute("module");
    ArrayList<ModuleUserData> userDatas = (ArrayList<ModuleUserData>) request.getAttribute("userDatas");
    ArrayList<User> userList = (ArrayList<User>) request.getAttribute("userList");
%>

<!DOCTYPE>
<html>
    <head>
        <title>Leaderboards</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/coreF.css">
        <link rel="stylesheet" type="text/css" href="css/lStruc.css">
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
            <div id="lStructure">
                <div id="lSTitle">Game: <% out.print(module.getModuleName()); %></div>
                <div id="lSToggle">
                    <select class="selectpicker" style="background: #61b29b">
                        <option>Global Stats</option>
                        <option>User Stats</option>
                    </select>
                </div>
                <div id="lSDisp">
                    <table><tr><td><b>Rank</b></td><td><b>Online ID</b></td><td><b>Score</b></td></tr></table>
                    <%
                        for (int i = 0; i < userDatas.size() && i < 20; i++) {
                    %>
                    <div id="lSFrame"><table><tr><b><td><% out.print(i + 1); %></td><td><% out.print(userList.get(i).getUsername()); %></td><td><% out.print(userDatas.get(i).getmValue()); %></td></b></tr></table></div>
                    <%
                        }
                    %>
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