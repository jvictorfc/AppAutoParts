
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../javascript/jquery-3.3.1.min.js" type="text/javascript"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

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
                        <a class="nav-item nav-link active" href="wUser.jsp">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="wCommandes.jsp">My Orders</a>
                        <a class="nav-item nav-link" href="#">Your account</a>
                        
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
                <button id="Fairecommande" type="button" class="btn btn-success btn-lg " disabled="true" >Commande de Pieces</button>
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
                <button id="confirmer"   type="button" class="btn btn-success btn-lg center " disabled="true">Confirmer</button>
                </div> 
                
        <div class="col-lg-3 text-center border border-dark">   
                </br>
                
                <a id="checkout" type="button" class="btn btn-outline-success" href="pannier.jsp">Checkout</a>
                <img src="../images/hombre-empujando-un-carrito-de-la-compra (1).png" alt=""/><span  id="tqtt" ></span></br>
                </br>
                <a id="annuler" href="commander.jsp" class="text-danger">Annuler Commande</a>
               
            </br>
            </br>
            </div>
              
              
            </div>
    

            </div>

    </body>
    <script>

        var actionValue = null;
        var valuParam = null;
        var pos=null;
     
        $(document).ready(function () {
            actionValue = "marque";

            ajax(actionValue);
              
        });
         var i=0;   


        function ajax(actionValue, valuParam) {
            $.ajax({
                url: "../user",
                type: "get",
                data: {"action": actionValue, "id": valuParam},
                success: function (resp) {
                    if (actionValue === "marque") {
                        afficheMarque(resp);
                    } else if (actionValue === "model") {

                        afficheModele(resp);
                        afficherAnne();
                    } else if (actionValue === "categories") {
                        afficheCategories(resp);

                    } else if (actionValue === "piece") {
                        affichePiece(resp);

                    }
                }
            });
        };
        
        function ajaxCommande(idmodele,annee){
            $.ajax({
                url:"../user",
                type:"get",
                data:{"action":"nCommande","idModele":idmodele,"annee":annee},
                success:function(resp){
                    console.log("ok");
                                      
                }
            });
            
        }
        function ajaxPiece(idPecesSelec,qttSelec,posSelec,coteSelec){
            $.ajax({
                url:"../user",
                type:"get",
                data:{"action":"ajPiece","idPecesSelec":idPecesSelec,"qttSelec":qttSelec,"posSelec":posSelec,"coteSelec":coteSelec},
                success:function(resp){
                    var tqtt=JSON.parse(resp);
                    $('#tqtt').empty();
                    $('#tqtt').append(tqtt);
                    console.log("okpiece");
                }
            });
            
        }        
        
        $('#annuler').click(function(){
             $.ajax({
                url:"../user",
                type:"get",
                data:{"action":"annuler"},
                success:function(resp){
                    
                }
            });
        });
        
        
        //confirmer commmande 
        $('#commande').click(function(){
          //var marqueSelec =$('#marque option:selected').html();
          //var modeleSelec =$('#modele option:selected').html();
          var idModeleSelec=$('#modele option:selected').val();
          var anneSelec =$('#annee option:selected').html();
          //var categorieSelec=$('#categorie option:selected').html();
          //var pieceSelec=$('#nav-tabContent option:selected').html();
          ajaxCommande(idModeleSelec,anneSelec);
        });
        
        $('#Fairecommande').click(function(){
            $("#marque").attr('disabled', 'disabled');
            $("#modele").attr('disabled', 'disabled');
            $("#annee").attr('disabled', 'disabled');
            $('#categorie').removeAttr("hidden");
            $('#labelCatgorie').removeAttr("hidden");
             var idModeleSelec=$('#modele option:selected').val();
             var anneSelec =$('#annee option:selected').html();
             ajaxCommande(idModeleSelec,anneSelec);
        });
        
        
        $('#confirmer').click(function(){
            ajouterPiece();
            
        });
        
        
        function ajouterPiece(){
        var coteSelec=($('input:radio[name=cote]:checked').val());
        var posSelec=($('input:radio[name=pos]:checked').val());  
        var qttSelec=($('#qte').val());
        var idPecesSelec=$('#nav-tabContent option:selected').val();
         ajaxPiece(idPecesSelec,qttSelec,posSelec,coteSelec);
        };
        
        
        //demande de marque evoyee au serveur
        $('#marque').change(function () {

             var idMarque = $(this).val();
             
            //console.log(nomMarque);
            console.log(idMarque);
            actionValue = "model";
            valuParam = idMarque;
            ajax(actionValue, valuParam);

        });
        //demande  de categories evoyee au serveur
        $('#annee').change(function () {
            $('#Fairecommande').attr("disabled",false);
            actionValue = "categories";
            ajax(actionValue);
            
        });

        //demande  de pieces evoyee au serveur
        $('#categorie').change(function () {
            var idCategorie = $(this).val();
            //console.log(idCategorie);
            actionValue = "piece";
            valuParam = idCategorie;
            ajax(actionValue, valuParam);
        });
            
        $('#nav-tabContent').click(function () {
            $('#confirmer').attr("disabled",false);
            $('#positiontd').empty();
             $('#cote').empty();
            var idpiece = $(this).val();
            console.log(idpiece);
            
           
            for (var i = 0; i < listPiece.length; i++) {

             var idP = listPiece[i].idPiece;
             console.log(idP);
             console.log(listPiece);
            if (idP == idpiece) {
                var pos = listPiece[i].description;
                if(pos=="pc"){

                        $('#positiontd').append("<input type='radio' name='pos'   value ='Avant'>Avant &nbsp;&nbsp;");
                        $('#positiontd').append("<input type='radio' name='pos' value ='Arrier'>Arrier");
                        $('#cote').append("<input type='radio' name='cote'  value='Droite' >Droite &nbsp;&nbsp;");
                        $('#cote').append("<input type='radio' name='cote'  value='Gauche' >Gauche");
                            
                    }else if(pos=="p"){
                        $('#positiontd').append("<input type='radio' name='pos'   value ='Avant'>Avant &nbsp;&nbsp;");
                        $('#positiontd').append("<input type='radio' name='pos' value ='Arrier'>Arrier");                        
                    }else if (pos=="c"){
                        $('#cote').append("<input type='radio' name='cote'  value='Droite' >Droite &nbsp;&nbsp;");
                        $('#cote').append("<input type='radio' name='cote'  value='Gauche' >Gauche");                
                    }
                };
                    };

                });


        //affichage marque
        function afficheMarque(resp) {
            $('#marque').append($("<option>Sélectionnez une Marque</option>"));
            var listmarque = JSON.parse(resp);
            $.each(listmarque, function (key, value) {
                var id = value.idMarque;
                //  console.log(id);
                $('#marque').append($("<option id= value=></option>")
                        .attr("value", id)
                        .attr("id", value.nomMarque)
                        .text(value.nomMarque));
            });

        }
        ;

        //afichage model
        function afficheModele(resp) {
            $('#modele').empty();
            // console.log(resp);
            $('#modele').append($("<option>Sélectionnez une Modele</option>"));

            var listModele = JSON.parse(resp);
            $.each(listModele, function (key, value) {
                var id = value.idModele;
                // console.log(id);
                $('#modele').append($("<option id= value=></option>")
                        .attr("value", id)
                        .attr("id", value.nomModele)
                        .text(value.nomModele));
            });

        }
        ;
        //afiiche des categories et preparer les div pour le piees
        function afficheCategories(resp) {
            //console.log(resp);
            size = 0;
            var listCat = JSON.parse(resp);
            $.each(listCat, function (key, value) {
                var idCat = value.idCategorie;
                //$('#categorie').removeAttr("hidden");
                //$('#labelCatgorie').removeAttr("hidden");
                $('#categorie').append($(" <option class='list-group-item list-group-item-action'></option>")
                        .attr("id", "listCate")
                        .attr("value", idCat)
                        .text(value.nomCategorie));
                size = (size + 1);
            });
            $('#categorie').attr("size", size);
        };


        //afiicher <selec annee> 

        function afficherAnne() {
            $('#annee').removeAttr('hidden');
        };

        //aficher piece
        function affichePiece(resp) {
            //console.log(resp);
            $('#nav-tabContent').empty();
            //variable global pour prendrer position 
            listPiece = JSON.parse(resp);
            // var categorie=listPiece[0].categorie.nomCategorie;
            $('#nav-tabContent').removeAttr("hidden");
            $('#lablePieces').removeAttr("hidden");
            $('#table').removeAttr("hidden");
            $.each(listPiece, function (key, value) {
                $('#nav-tabContent').append($("<option class='list-group-item list-group-item-action ' ></option>")

                        .attr("value", value.idPiece)
                        .text(value.nomPiece));

            });
            $('#nav-tabContent').attr("size", size);
            //console.log(listPiece);
            //console.log(categorie);
        };
        






    </script>
</html>
