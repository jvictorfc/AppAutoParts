<%-- 
    Document   : wUser
    Created on : 2018-08-25, 11:18:28
    Author     : jvict
    Desc       : Welcome page after user authentication
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
        <title><fmt:message key='mesOrders'/> ${sessionScope.usager.nomClient}</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
                    <div class="navbar-nav">
                        <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="#">Features</a>
                        <a class="nav-item nav-link" href="#">Pricing</a>
                        <a class="nav-item nav-link disabled" href="#">Disabled</a>
                    </div>
                </div>
            </nav>


            <H2 class="text-center">${sessionScope.usager.nomClient}, <fmt:message key='msgListCommandes'/></H2>

            <div id="loader"   class="text-center">
                <img src="../images/loader.gif" alt=""/>
            </div>


            <div id="listCommandes" class="col-lg-12">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card card border-light mb-3" >

                            <table class="table text-center">

                                <thead class="card-header thead-light">
                                    <tr>
                                        <th scope="col">Order Id</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Vor detailes</th>
                                    </tr>
                                </thead>
                                <tbody id="commandes">
                                    <!-- Commandes-->
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="modal fade" id="detail" role="dialog" data-backdrop="static">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title"><fmt:message key='detailCommande'/></h4>
                                </div>
                                <div  class="modal-body">
                                    <table class="table text-center">

                                        <thead class="card-header thead-light">
                                            <tr>
                                                <th scope="col">Piece</th>
                                                <th scope="col">Quantite</th>
                                            </tr>
                                        </thead>
                                        <tbody id="itensCommande">
                                            <!-- Pieces vont aller ici -->
                                        </tbody>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" onclick="hideModal()"><fmt:message key='sortir'/></button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
        <script>
            $('#loader').show();
            $(document).ready(function () {
                $('#detail').modal('hide');

                //Hide pannier to show only when ready
                $('#listCommandes').hide();
                getCommandes();
            });

            function getCommandes() {
                $.ajax({
                    url: "../user",
                    type: "get",
                    data: {"action": "getCommandes"},
                    success: function (resp) {
                        var obj = JSON.parse(resp);
                        console.log(obj);
                        remplirList(resp);
                        $('#loader').hide();
                        $('#listCommandes').show();
                    }
                });
            }


            function remplirList(resp) {
                var obj = JSON.parse(resp);
                console.log(obj);
                //NAO ESQUECER DO var vs let
                for (let i = 0; i < obj.length; i++) {

                    $('#commandes').append("<tr>");
                    $('#commandes').append("<th scope='row'>" + obj[i].idCommande + "</th>");
                    $('#commandes').append("<td>" + obj[i].dateCommande + "</td>");
                    $('#commandes').append("<td>+Status+</td>");
                    $('#commandes').append("<td>" + "<a href='#' id='c" + i + "'>Detailes</a></td>");
                    $('#commandes').append("</tr>");
                    var c = "#c" + i;
                    let idc = obj[i].idCommande;
                    $(c).click(function () {
                        $.ajax({
                            url: "../user",
                            type: "get",
                            data: {"action": "getCommande", "id": idc},
                            success: function (resp) {
                                var com = JSON.parse(resp);
                                //remplirList(resp);
                                //$('#loader').hide();

                                showDetail(com);
                            }

                            //return false;
                        });

                    });
                }
            }

            function showDetail(com) {
                $('#itensCommande').empty();
                console.log(com.ligneCommande);
                for (var j = 0; j < com.ligneCommande.length; j++) {
                    console.log(com.ligneCommande[j].piece.nomPiece);
                    $('#itensCommande').append("<tr>");
                    $('#itensCommande').append("<th scope='row'>" + com.ligneCommande[j].piece.nomPiece + "</th>");
                    $('#itensCommande').append("<td>" + com.ligneCommande[j].qtt + "</td>");
                    $('#itensCommande').append("</tr>");
                }
                $('#detail').modal('show');
            }

            function hideModal() {
                $('#detail').modal('hide');
            }


        </script>
    </body>
</html>
