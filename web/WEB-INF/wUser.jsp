<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <fmt:setLocale value="${sessionScope.langueChoisie}"/>
    <fmt:setBundle basename="LangueApp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key='bienvenue'/> ${sessionScope.usager.nomClient}</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    <body>

        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-warning">
                <a class="navbar-brand" href="#">AutoParts</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item nav-link active">
                            <a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item nav-link active">
                            <a class="nav-link text-right" href="user?action=logoff"><fmt:message key="Logout"/></a> 
                        </li>

                    </ul>
                </div>
            </nav>


            <H2 class="text-center"><fmt:message key='bienvenue'/> ${sessionScope.usager.nomClient}</H2>
            <H1 class="text-center"><fmt:message key='fairequoi'/></H1>

            <div class="row">
                <div class="col-xl-6 col-xl-offset-6">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="./images/cart.png" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Commander</h5>
                            <p class="card-text">Continue a order or create a new one.</p>
                            <a href="./Redirecting?url=commander.jsp" class="btn btn-primary">Faire Commande</a>
                        </div>
                    </div>
                </div> 

                <div class="col-xl-6 ">
                    <div class="card centered" style="width: 18rem;">
                        <img class="card-img-top" src="./images/orders.png" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Orders</h5>
                            <p class="card-text">Here you will see a list of your other orders</p>
                            <a href="./Redirecting?url=wCommandes.jsp" class="btn btn-primary">My Orders</a>
                        </div>
                    </div>
                </div> 
            </div>

        </div>
    </body>
</html>
