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
        <title><fmt:message key='bienvenue'/> ${sessionScope.usager.nomClient}</title>
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


            <H2 class="text-center">${sessionScope.com.client.nomClient}, <fmt:message key='msgListCommandes'/></H2>

            <div id="loader"   class="text-center">
                <img src="../images/loader.gif" alt=""/>
            </div>


            <div id="pannier" class="col-lg-12">
                <div class="row">
                    <div class="col-lg-9">
                    <div class="card card border-light mb-3" >

                        <table class="table text-center">
                            
                            <thead class="card-header thead-light">
                                <tr>
                                    <th scope="col">Piece</th>
                                    <th scope="col">Quantite</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody id="lignes">
                                <!-- Pieces vont aller ici -->
                            </tbody>
                        </table>
</div>
                    </div>
                    <div class="col-lg-3 ">
                        <div class="card border-light mb-3" >
                            <div class="card-header">
                                <fmt:message key='infoCommande'/>
                            </div>

                            <div class="card-body text-info">
                                <div>
                                    <p class="font-weight-bold text-center">Info Voiture:</p>
                                    <p class="font-weight-light">
                                    Marque: ${sessionScope.com.idMod.marque.nomMarque}<br/>
                                    Modele: ${sessionScope.com.idMod.nomModele}<br/>
                                    Annee: ${sessionScope.com.annee}<br/>
                                    </p>
                                <hr/>
                                <p class="font-weight-bold text-center">Addresse:</p>
                                                                    <p class="font-weight-light">${sessionScope.com.client.adresse}<br/></p>
                                    
                                </div>
                            </div>


                                <a id="finCommande" type="button" class="btn btn-outline-warning" href="../user?action=envCommande"><fmt:message key='finirCommande'/></a>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('#loader').show();
            $(document).ready(function () {
                
                //Hide pannier to show only when ready
                $('#pannier').hide();
                getPannier();
            });

            function getPannier() {
                $.ajax({
                    url: "../user",
                    type: "get",
                    data: {"action": "getPannier"},
                    success: function (resp) {
                        remplirList(resp);
                        $('#loader').hide();
                        $('#pannier').show();
                    }
                });
            }


            function remplirList(resp) {
                var obj = JSON.parse(resp);
                console.log(obj);
                for (let i = 0; i < obj.length; i++) {
                    var pos = obj[i].position;
                    var cote = obj[i].cote;

                    if (pos !== "na") {
                        pos = " - " + obj[i].position;
                    } else {
                        pos = "";
                    }

                    if (cote !== "na") {
                        cote = " - " + obj[i].cote;
                    } else {
                        cote = "";
                    }

                    $('#lignes').append("<tr>");
                    $('#lignes').append("<th class='text-left' scope='row'>" + obj[i].piece.nomPiece + pos + cote + "</th>");
                    $('#lignes').append("<td>" + "<input id='tb" + i + "'type='text' value='" + obj[i].qtt + "' size='1' /> <a href='#' id='u" + i + "'>Update</a></td>");
                    $('#lignes').append("<td>" + "<a href='#' id='d" + i + "'>Delete</a></td>");
                    $('#lignes').append("</tr>");
                    var ds = "#d" + i;
                    var us = "#u" + i;

                    $(ds).click(function () {
                        $.get("../user?action=remPiece&ligne=" + i);
                        $('#lignes').empty();
                        getPannier();
                        return false;
                    });

                    $(us).click(function () {
                        $.get("../user?action=updQtt&ligne=" + i + "&qtt=" + $('#tb' + i).val());
                        $('#lignes').empty();
                        getPannier();
                        return false;
                    });

                }
                // show only when ready
                //$('#pannier').show();
            }

        </script>
    </body>
</html>
