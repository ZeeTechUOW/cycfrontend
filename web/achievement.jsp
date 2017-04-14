
<%@page import="Model.DBAdmin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String url = DBAdmin.WEB_URL;
    String moduleID = request.getParameter("mid");
%>
<!DOCTYPE>
<html>
    <head>
        <title>Achievements</title>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/coreF.css">
        <link rel="stylesheet" type="text/css" href="css/aStruc.css">
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
            <div id="aStructure">
                <div id="aSTitle">Game: Achievements</div>
                <div id="aSList">4 of 20 unlocked</div>
                <div id="aSDisp">
                    <div id="aSFrame">
                        <table>
                            <tr>
                                <td><div id="aSpic"><div class="aFrame"><img src="resource/placeholder1.png" alt="a1"></div></div></td>
                                <td><b>Who am I?</b><br>Guess the right name</td>
                                <td>Unlocked 16/12/17</td>
                            </tr>
                        </table>
                    </div>
                    <div id="aSFrame">
                        <table>
                            <tr>
                                <td><div id="aSpic"><div class="aFrame"><img src="resource/placeholder2.png" alt="a2"></div></td>
                                <td><b>Who am I?</b><br>Guess the right name</td>
                                <td>Unlocked 16/12/17</td>
                            </tr>
                        </table>
                    </div>
                    <div id="aSFrame">
                        <table>
                            <tr>
                                <td><div id="aSpic"><div class="aFrame"><img src="resource/placeholder1.png" alt="a3"></div></td>
                                <td><b>Who am I?</b><br>Guess the right name</td>
                                <td>Unlocked 16/12/17</td>
                            </tr>
                        </table>
                    </div>
                    <div id="aSFrame">
                        <table>
                            <tr>
                                <td><div id="aSpic"><div class="aFrame"><img src="resource/placeholder2.png" alt="a4"></div></td>
                                <td><b>Who am I?</b><br>Guess the right name</td>
                                <td>Unlocked 16/12/17</td>
                            </tr>
                        </table>
                    </div>
                    <div id="aSFrame">
                        <table>
                            <tr>
                                <td><div id="aSpic"><div class="aFrame"><img src="resource/placeholder1.png" alt="a5"></div></td>
                                <td><b>Who am I?</b><br>Guess the right name</td>
                                <td>Unlocked 16/12/17</td>
                            </tr>
                        </table>
                    </div>
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
