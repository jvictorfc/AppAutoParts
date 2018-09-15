$(document).ready(function () {
    $('#loader').show();

    $('#detail').modal('hide');

    //Hide pannier to show only when ready
    $('#listCommandes').hide();
    getCommandes();
});

    function getCommandes() {
        $.ajax({
            url: "./user",
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
            $('#commandes').append("<td>" + "<a href='#' id='c" + i + "'>Detailes</a></td>");
            $('#commandes').append("</tr>");
            var c = "#c" + i;
            let idc = obj[i].idCommande;
            $(c).click(function () {
                $.ajax({
                    url: "./user",
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

            var pos = com.ligneCommande[j].position;
            var cote = com.ligneCommande[j].cote;

            if (pos !== "na") {
                pos = " - " + com.ligneCommande[j].position;
            } else {
                pos = "";
            }

            if (cote !== "na") {
                cote = " - " + com.ligneCommande[j].cote;
            } else {
                cote = "";
            }

            console.log(com.ligneCommande[j].piece.nomPiece);
            $('#itensCommande').append("<tr>");
            $('#itensCommande').append("<th scope='row'>" + com.ligneCommande[j].piece.nomPiece + pos + cote + "" + "</th>");
            $('#itensCommande').append("<td>" + com.ligneCommande[j].qtt + "</td>");
            $('#itensCommande').append("</tr>");
        }
        $('#detail').modal('show');
    }

    function hideModal() {
        $('#detail').modal('hide');
    }


