<%-- 
    Document   : registre
    Created on : 30-Aug-2018, 1:44:37 AM
    Author     : Diego
--%>

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
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
                            <a class="nav-link" href="login.jsp"><fmt:message key="retourne"/>

                                <span class="sr-only">(current)</span>
                            </a>
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
    <form method="post" action="faireCommande?action=registre">

        <span class="fontawesome-user"></span>
        <input type="text" required placeholder="<fmt:message key='nom'/>" name="nom" autocomplete="off"> 
        <span class="fontawesome-user"></span>
        <input type="text" required placeholder="<fmt:message key='adresse'/>" name="adresse" autocomplete="off">
        <span class="fontawesome-user"></span>
        <input type="text" required placeholder="<fmt:message key='telephone'/>" name="telephone" autocomplete="off">
        <span class="fontawesome-user"></span>
        <input type="text" required placeholder="<fmt:message key='usager'/>" name="usager" autocomplete="off">
        <span class="fontawesome-envelope-alt"></span>
        <input type="text" id="email" required placeholder="Email" name="email" autocomplete="off">
        <span class="fontawesome-lock"></span>
        <input type="password" name="password" id="password" required placeholder="<fmt:message key='motPasse'/>"  autocomplete="off"> 
        <input   type="submit" value="<fmt:message key='registre'/>" title="Registre"/>
    </form>
</body>
</html>
