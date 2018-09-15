
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="./javascript/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="./javascript/jscommander.js" type="text/javascript"></script>
        <title>JSP Page</title>
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
                        <a class="nav-item nav-link active" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="Redirecting?url=wCommandes.jsp">My Orders</a>                     
                    </div>
                </div>
            </nav>


            <div class="row">
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="marque" class="col-sm-2 control-label "><h2>Marque</h2></label>
                        <div class="col-sm-10">
                            <select id="marque" class="form-control selcls" >

                            </select>          
                        </div>
                    </div>      
                </div>

                <div class="col-lg-4">    
                    <div class="form-group">
                        <label for="modele" class="col-sm-2 control-label"><h2>Modele</h2></label>
                        <div class="col-sm-10">
                            <select id="modele" class="form-control selcls" >

                            </select>          
                        </div>
                    </div>   
                </div>

                <div class="col-lg-4">  
                    <div class="form-group">
                        <label for="annee" class="col-sm-2 control-label"><h2>Annee</h2></label>
                        <div class="col-sm-10">
                            <select id="annee" class="form-control selcls" hidden>
                                <option>Sélectionnez une année</option>
                                <option>2015</option>
                                <option>2018</option>
                            </select>          
                        </div>
                    </div>
                </div>
            </div>

            <div class="container-fluid text-center">
                <button id="Fairecommande" type="button" class="btn btn-success btn-lg " disabled="true" >Commencer a Commander</button>
            </div> 
            </br>

            <div class="row   navbar navbar-expand-lg navbar-ligh bg-warning "text-align:top>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label id="labelCatgorie" class="col-sm-2 control-label"hidden ><h2>Catégories</h2></label>
                        <select class="form-control selcl" id="categorie" hidden >

                        </select>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="form-group">
                        <label id="lablePieces" class="col-sm-2 control-label " hidden><h2 class="">Pieces</h2></label>
                        <select class="form-control selcl" id="nav-tabContent" hidden >

                        </select>
                    </div>
                </div>
                <table  id="table" class="table col-lg-4" hidden>
                    <thead class="thead-dark ">
                        <tr>
                            <th class="text-center" scope="col" >Position</th>


                        </tr>
                    </thead>
                    <tbody id="position"> 
                        <tr class="text-center">           
                            <td id="positiontd">

                            </td>
                        </tr>
                        <tr class="text-center">
                            <td id="cote">
                                >
                            </td>
                        </tr>
                        <tr>
                            <td id="qtt" class="text-center" >
                                <label class=" ">QTT</label>
                                <input class=" control-label col-lg-3 " type="text"  value="1" id="qte">
                            </td>

                        </tr>
                    </tbody>
                </table>                     

            </div>

            <div class="row ">
                <div class="col">
                    </br>
                    <button id="confirmer"   type="button" class="btn btn-success btn-lg center " disabled="true">Ajouter</button>
                </div> 

                <div class="col-lg-3 text-center border border-dark">   
                    </br>

                    <a id="checkout" type="button" class="btn btn-outline-success" href="./Redirecting?url=pannier.jsp">Checkout</a>
                    <img src="./images/hombre-empujando-un-carrito-de-la-compra (1).png" alt=""/><span  id="tqtt" ></span></br>
                    </br>
                    <a id="annuler" href="./Redirecting?url=commander.jsp" class="text-danger">Annuler Commande</a>

                    </br>
                    </br>
                </div>


            </div>


        </div>

    </body>

</html>
