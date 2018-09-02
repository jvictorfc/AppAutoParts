<%-- 
    Document   : commander
    Created on : 2018-08-25, 12:13:53
    Author     : jvict
    Desc       : Page pour faire une commande
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="javascript/jquery-3.3.1.min.js" type="text/javascript"></script>
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
                        <a class="nav-item nav-link active" href="#">Home <span class="sr-only">(current)</span></a>
                        <a class="nav-item nav-link" href="#">Features</a>
                        <a class="nav-item nav-link" href="#">Pricing</a>
                        <a class="nav-item nav-link disabled" href="#">Disabled</a>
                    </div>
                </div>
            </nav>
            <div class="row">
                <div class="col-lg-4">
                    <div class="form-group">
                        <label for="marque" class="col-sm-2 control-label"><h2>Marque</h2></label>
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
            <div class="row   navbar navbar-expand-lg navbar-ligh bg-warning">
                <div class="col-lg-4">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"hidden ><h2>Catégories</h2></label>
                        <select class="form-control selcl" id="categorie" hidden >
                        </select>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label" hidden><h2>Pieces</h2></label>
                        <select class="form-control selcl" id="nav-tabContent" hidden >
                        </select>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div id="position">
                    </div>
                    <div class="form-group">

                        <label  class="col-lg-12 control-label " hidden><h2 class="col-lg-5">Qtt:</h2>
                            <input class="col-lg-4 control-label " type="text"  value="1" id="qte">
                        </label>
                    </div>
                </div>
            </div>


            <!--        <div class="row">
                <div class="col-lg-4">    
                    <div  class="container bg-warning">
                        <h2>catégories</h2>
                        <select class="list-group col-lg-10"  role="tablist"  id="categorie"   style="overflow:hidden;" hidden="">
                            
                        </select>
                    </div>
                    <br id="esp" hidden/>
                </div>

                <div class="col-8">
                    <div class="container bg-warning">
                    <select class="tab-content" id="nav-tabContent">
                        
                    </select>
                    </div>
                </div>
            </div> -->   








    </body>
    <script>

        var actionValue = null;
        var valuParam = null;

        $(document).ready(function () {
            actionValue = "marque";

            ajax(actionValue);

        });



        function ajax(actionValue, valuParam) {
            $.ajax({
                url: "user",
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
        }
        ;

        //demande de marque evoyee au serveur
        $('#marque').change(function () {

            var idmarque = $(this).val();
            //console.log(idmarque);
            actionValue = "model";
            valuParam = idmarque;
            ajax(actionValue, valuParam);

        });
        //demande  de categories evoyee au serveur
        $('#annee').change(function () {
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

        $('#nav-tabContent').change(function () {
            var idpiece = $(this).val();
            //console.log(idpiece);
            for (var i = 0; i < listPiece.length; i++) {

                var idP = listPiece[i].idpiece;
                console.log(idP);
                if (idP === idpiece) {
                    var pos = listPiece[i].description;

                    console.log(pos);
                }
            }

            // console.log(listPiece);
            // if ()

        });


        //$('#categorie').on('click',function(e){
        //  var idCategorie=$('#lestCate').val();
        // console.log(idCategorie);
        //actionValue="piece";
        //valuParam=idCategorie;
        //ajax(actionValue,valuParam);          
        //  }); 

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
                $('#categorie').removeAttr("hidden");
                $('label').removeAttr("hidden");
                $('#categorie').append($(" <option class='list-group-item list-group-item-action'></option>")
                        //        <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Profile</a>
                        //<a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Messages</a>
                        //<a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab" aria-controls="settings">Settings</a>
                        .attr("id", "listCate")
                        //.attr("aria-controls",value.nomCategorie)
                        .attr("value", idCat)
                        //.attr("href","#"+value.nomCategorie)
                        .text(value.nomCategorie));
                size = (size + 1);
            });
            $('#categorie').attr("size", size);
        }
        ;


        //afiicher <selec annee> 

        function afficherAnne() {
            $('#annee').removeAttr('hidden');
        }
        ;

        //aficher piece
        function affichePiece(resp) {
            //console.log(resp);
            $('#nav-tabContent').empty();
            //variable global pour prendrer position 
            listPiece = JSON.parse(resp);
            // var categorie=listPiece[0].categorie.nomCategorie;
            $('#nav-tabContent').removeAttr("hidden");
            $.each(listPiece, function (key, value) {
                $('#nav-tabContent').append($("<option class='list-group-item list-group-item-action ' ></option>")

                        .attr("value", value.idPiece)
                        .text(value.nomPiece));

            });
            $('#nav-tabContent').attr("size", size);
            //console.log(listPiece);
            //console.log(categorie);
        }
        ;






    </script>
</html>
