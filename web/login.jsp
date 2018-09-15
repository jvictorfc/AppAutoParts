<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <c:if test = "${sessionScope.usager != null}">
        <c:redirect url = "./Redirecting?url=wUser.jsp"/>
    </c:if>
    <fmt:setLocale value="${sessionScope.langueChoisie}"/>
    <fmt:setBundle basename="LangueApp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="Connecter"/></title>
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/css.css" rel="stylesheet" type="text/css"/>
        <link href="css/business-frontpage.css" rel="stylesheet">
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link"><fmt:message key="langue"/></a>
                        </li>
                        <li class="nav-item">
                        <li class="nav-item active">
                            <div class="row">
                                <div class="col-1">
                                    <a class="nav-link" href="user?action=changeLang&langue=fr_CA&page=/login.jsp"><fmt:message key="francais"/>/</a>
                                </div>
                                <div class="col-1">
                                    <a class="nav-link" href="user?action=changeLang&langue=en_US&page=/login.jsp"><fmt:message key="anglais"/></a> 
                                </div>
                            </div>
                        </li>

                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div>
            <form id="loginform" method="POST" action="user" name="login">
                <input type="hidden" name="action" value="login" /> 
                <input type="text" class="input" name="usager" placeholder="<fmt:message key="usager"/>" /> 
                <input type="password" class="input" name="pass" placeholder="<fmt:message key="motPasse"/>" />
                <input type="submit" class="loginbutton" value="<fmt:message key="seConnecter"/>" />
            </form>
            <div class="row text-center">
                <div class="col-12">
                    <a   href="registre.jsp"><fmt:message key="lienRegistre"/></a>
                </div>
            </div>
        </div>


    </body>
</html>
