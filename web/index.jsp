<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <fmt:setLocale value="${sessionScope.langueChoisie}"/>
    <fmt:setBundle basename="LangueApp"/>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>AutoParts</title>

        <!-- Bootstrap core CSS -->

        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <!-- Custom styles for this template -->

        <link href="css/business-frontpage.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>

        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-warning fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">AutoParts</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <c:if test = "${sessionScope.usager != null}"> 
                        <li class="nav-item active">
                            <c:if test = "${sessionScope.usager != null}"> 
                            <li class="nav-item active">
                                <a class="nav-link" href="./Redirecting?url=wUser.jsp"><fmt:message key="Commande"/></a>
                            </li>
                               </c:if>
                                <a class="nav-link" href="./user?action=logoff"><fmt:message key="Logout"/></a>
                                </c:if>
                                <c:if test = "${sessionScope.usager == null}"> 
                                    <a class="nav-link" href="login.jsp"><fmt:message key="Connecter"/></a>
                                    </c:if>
                                
                        </li>
                        <li class="nav-item active">
                            <div class="row">
                                <div class="col-1">
                                    <a class="nav-link" href="user?action=changeLang&langue=fr_CA&page=/index.jsp"><fmt:message key="francais"/>/</a>
                                </div>
                                <div class="col-1">
                                    <a class="nav-link" href="user?action=changeLang&langue=en_US&page=/index.jsp"><fmt:message key="anglais"/></a> 
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Header with Background Image -->
        <header class="business-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">		    
                        <h1 class="display-3 text-center text-white mt-4"><fmt:message key="en-tete1"/></h1>
                    </div>
                </div>
            </div>
        </header>

        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <div class="col-sm-8">
                    <h2 class="mt-4"><fmt:message key="title1"/></h2>
                    <p><fmt:message key="paragraphe1"/></p>
                    <p>

                    </p>
                </div>
                <div class="col-sm-4">
                    <h2 class="mt-4"><fmt:message key="contactezNous"/></h2>
                    <address>
                        <br>3481 Melrose Place
                        <br>Montreal, QC H2K2K3
                        <br>
                    </address>
                    <address>
                        <abbr title="Phone"><fmt:message key="telephone"/>:</abbr>
                        (438) 456-7890
                        <br>
                        <abbr title="Email">E-mail:</abbr>
                        <a href="mailto:#">pieces@auto.com</a>
                    </address>
                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright &copy; AutoParts 2018</p>
            </div>
            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
