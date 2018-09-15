
            $('#loader').show();
            $(document).ready(function () {
                
                //Hide pannier to show only when ready
                $('#pannier').hide();
                getPannier();
            });

            function getPannier() {
                $.ajax({
                    url: "./user",
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
                        $.get("./user?action=remPiece&ligne=" + i);
                        $('#lignes').empty();
                        getPannier();
                        return false;
                    });

                    $(us).click(function () {
                        $.get("./user?action=updQtt&ligne=" + i + "&qtt=" + $('#tb' + i).val());
                        $('#lignes').empty();
                        getPannier();
                        return false;
                    });

                }
                // show only when ready
                //$('#pannier').show();
            }
