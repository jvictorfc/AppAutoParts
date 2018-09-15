$(document).ready(function(){
        $('#bienvenue').modal('hide');

        $('#registrer').click(function () {
            var nom = $('#nom').val();
            var adresse = $('#adresse').val();
            var telephone = $('#telephone').val();
            var usager = $('#usager').val();
            var name = $('#name').val();
            var password = $('#password').val();
            var courriel = $('#motpasse').val();

            $.ajax({
                url: "user",
                type: "get",
                data: {"action": "registre", "nom": nom, "adresse": adresse, "telephone": telephone, "usager": usager, "name": name, "password": password, "courriel": courriel},
                success: function (resp) {
                    bienvenue(resp);
                }
            });
        });

        function bienvenue(resp) {
            var obj = JSON.parse(resp);
            console.log(obj.isValid);
            if (obj.isValid == 1) {
                $('#bienvenue').modal('show');
            } else {
                alert("Deja utilise(usager)");
            }


        };
        
        //validation mais manque implementation
                function validerChamp(nom,adresse,telephone,usager,password,courriel){
          
            if (nom ===""){
              $('#nom').attr("placeholder","Champ Requis"); 
            }else if (adresse===""){
                $('#adresse').attr("placeholder","Champ Requis");
            }else if (telephone===""){
                $('#telephone').attr("placeholder","Champ Requis");
            }else if (usager===""){
                $('#usager').attr("placeholder","Champ Requis");
            }else if (password===""){
                $('#password').attr("placeholder","Champ Requis");
            }else if(courriel===""){
                $('#courriel').attr("placeholder","Champ Requis");
            };
        };
        });