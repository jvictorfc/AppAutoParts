$(document).ready(function () {
    var actionValue = null;
    var valuParam = null;
    var pos = null;

    actionValue = "marque";

    ajax(actionValue);

    var i = 0;


    function ajax(actionValue, valuParam) {
        $.ajax({
            url: "./user",
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

    function ajaxCommande(idmodele, annee) {
        $.ajax({
            url: "./user",
            type: "get",
            data: {"action": "nCommande", "idModele": idmodele, "annee": annee},
            success: function (resp) {
                console.log("ok");

            }
        });

    }
    function ajaxPiece(idPecesSelec, qttSelec, posSelec, coteSelec) {
        $.ajax({
            url: "./user",
            type: "get",
            data: {"action": "ajPiece", "idPecesSelec": idPecesSelec, "qttSelec": qttSelec, "posSelec": posSelec, "coteSelec": coteSelec},
            success: function (resp) {
                var tqtt = JSON.parse(resp);
                $('#tqtt').empty();
                $('#tqtt').append(tqtt);
                console.log("okpiece");
            }
        });

    }

    $('#annuler').click(function () {
        $.ajax({
            url: "./user",
            type: "get",
            data: {"action": "annuler"},
            success: function (resp) {

            }
        });
    });


    //confirmer commmande 
    $('#commande').click(function () {
        //var marqueSelec =$('#marque option:selected').html();
        //var modeleSelec =$('#modele option:selected').html();
        var idModeleSelec = $('#modele option:selected').val();
        var anneSelec = $('#annee option:selected').html();
        //var categorieSelec=$('#categorie option:selected').html();
        //var pieceSelec=$('#nav-tabContent option:selected').html();
        ajaxCommande(idModeleSelec, anneSelec);
    });

    $('#Fairecommande').click(function () {
        $("#marque").attr('disabled', 'disabled');
        $("#modele").attr('disabled', 'disabled');
        $("#annee").attr('disabled', 'disabled');
        $('#categorie').removeAttr("hidden");
        $('#labelCatgorie').removeAttr("hidden");
        var idModeleSelec = $('#modele option:selected').val();
        var anneSelec = $('#annee option:selected').html();
        ajaxCommande(idModeleSelec, anneSelec);
    });


    $('#confirmer').click(function () {
                   if(pos=="pc"){
               if( ($("#positiontd input[name='pos']:radio").is(':checked')) && ($("#positiontd input[name='cote']:radio").is(':checked')) ){
                   ajouterPiece();
               }else {
                   alert("Selectione une position et une côté pour la pièce");
               }
           }else if (pos=="p"){
                if ($("#positiontd input[name='pos']:radio").is(':checked')){
                   ajouterPiece();   
                }else {
                   alert("Selectione une position pour la pièce");
               }
           }else if (pos=="c"){
               if ($("#positiontd input[name='cote']:radio").is(':checked')){
                   ajouterPiece(); 
               }else {
                   alert("Selectione une côté pour la pièce");
               }
           }else if (pos=="na"){
               ajouterPiece(); 
           }
       
    });


    function ajouterPiece() {
        var coteSelec = ($('input:radio[name=cote]:checked').val());
        var posSelec = ($('input:radio[name=pos]:checked').val());
        var qttSelec = ($('#qte').val());
        var idPecesSelec = $('#nav-tabContent option:selected').val();
        ajaxPiece(idPecesSelec, qttSelec, posSelec, coteSelec);
    }
    ;


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
        $('#Fairecommande').attr("disabled", false);
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
        $('#confirmer').attr("disabled", false);
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
                if (pos == "pc") {

                    $('#positiontd').append("<input type='radio' name='pos'   value ='Avant'>Avant &nbsp;&nbsp;");
                    $('#positiontd').append("<input type='radio' name='pos' value ='Arrier'>Arrier");
                    $('#cote').append("<input type='radio' name='cote'  value='Droite' >Droite &nbsp;&nbsp;");
                    $('#cote').append("<input type='radio' name='cote'  value='Gauche' >Gauche");

                } else if (pos == "p") {
                    $('#positiontd').append("<input type='radio' name='pos'   value ='Avant'>Avant &nbsp;&nbsp;");
                    $('#positiontd').append("<input type='radio' name='pos' value ='Arrier'>Arrier");
                } else if (pos == "c") {
                    $('#cote').append("<input type='radio' name='cote'  value='Droite' >Droite &nbsp;&nbsp;");
                    $('#cote').append("<input type='radio' name='cote'  value='Gauche' >Gauche");
                }
            }
            ;
        }
        ;

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
    }
    ;

});