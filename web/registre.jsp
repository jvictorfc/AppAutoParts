<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <fmt:setLocale value="${sessionScope.langueChoisie}"/>
    <fmt:setBundle basename="LangueApp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/business-frontpage.css" rel="stylesheet" type="text/css"/>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <script src="javascript/jquery-3.3.1.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="javascript/jsreg.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-warning fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">AutoParts</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="./">Home</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="login.jsp"><fmt:message key="Connecter"/>

                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"><fmt:message key="langue"/></a>
                        </li>
                        <li class="nav-item">
                        <li class="nav-item active">
                            <div class="row">
                                <div class="col-1">
                                    <a class="nav-link" href="user?action=changeLang&langue=fr_CA&page=/registre.jsp"><fmt:message key="francais"/>/</a>
                                </div>
                                <div class="col-1">
                                    <a class="nav-link" href="user?action=changeLang&langue=en_US&page=/registre.jsp"><fmt:message key="anglais"/></a> 
                                </div>
                            </div>
                        </li>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <p class="texto" ><fmt:message key="registre"/></p>

        <div class="Registro">

            <form method="post" action="user?action=registre">
                <span class="fontawesome-user"></span>
                <input id="nom" type="text" required placeholder="<fmt:message key='nom'/>" name="nom" autocomplete="off"> 
                <span class="fontawesome-user"></span>
                <input id="adresse" type="text" required placeholder="<fmt:message key='adresse'/>" name="adresse" autocomplete="off">
                <span class="fontawesome-user"></span>
                <input id="telephone" type="text" required placeholder="<fmt:message key='telephone'/>" name="telephone" autocomplete="off">
                <span class="fontawesome-user"></span>
                <input id="usager" type="text" required placeholder="<fmt:message key='usager'/>" name="usager" autocomplete="off">
                <span class="fontawesome-envelope-alt"></span>
                <input id="courriel" type="text" id="email" required placeholder="Courriel" name="courriel" autocomplete="off">
                <span class="fontawesome-lock"></span>
                <input id="password" type="password" name="password" id="password" required placeholder="<fmt:message key='motPasse'/>"  autocomplete="off"> 
                <button id="registrer" type="button" class="btn btn-warning btn-lg"><fmt:message key='registre'/></button>
            </form>
        </div>

        <div class="modal fade" id="bienvenue" role="dialog" data-backdrop="static">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><fmt:message key='bienvenue'/></h4>
                    </div>
                    <div class="modal-body">
                        <p><fmt:message key='msgregistre'/></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" onclick="location.href = 'login.jsp';"><fmt:message key='fairelogin'/></button>
                    </div>
                </div>
            </div>
        </div>
                    
    </div>	

</body>
</html>
