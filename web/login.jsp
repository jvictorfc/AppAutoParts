<%-- 
    Document   : login
    Created on : 2018-08-29, 13:06:04
    Author     : 1695812
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
        <title><fmt:message key="Connecter"/></title>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="index/css/css.css" rel="stylesheet" type="text/css"/>
        <link href="css/business-frontpage.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-warning fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">AutoParts${sessionScope.langueChoisie}</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp"><fmt:message key="retourne"/>

                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"><fmt:message key="langue"/></a>
                        </li>
                        <li class="nav-item">
                            <form name="formLangue" action="user" method="get">
                                <select name="langue">
                                    <option value="fr_CA"><fmt:message key="francais"/></option>
                                    <option value="en_US"><fmt:message key="anglais"/></option>
                                </select>
                                <input type="hidden" name="src" value="1">
                                <input type="submit" value="<fmt:message key='confirmer'/>" >
                            </form>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>
            <form id="loginform" method="POST" action="user?action=login" name="login">
                <input type="text" class="input" name="usager" placeholder="<fmt:message key="usager"/>" /> 
                <input type="password" class="input" name="pass" placeholder="<fmt:message key="motPasse"/>" />
                <input type="submit" class="loginbutton" value="<fmt:message key="seConnecter"/>" />
            </form>
            <a  class="text-center" href="registre.jsp"><fmt:message key="lienRegistre"/></a>
        </div>


    </body>
</html>
