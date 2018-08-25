<%-- 
    Document   : wUser
    Created on : 2018-08-25, 11:18:28
    Author     : jvict
    Desc       : Welcome page after user authentication
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome nomUser</title>
    </head>
    <body>
        <!--METTRE LE FRAGMENT ICI -->
            <a href="commander.jsp">Nouvelle Commande</a><br>
            <a href="maCommande.jsp">Commande</a><br>
            <a href="mesCommandes.jsp">Mes commandes ancienes</a><br>
            <a href="servlet&action=logoff">Logoff</a><br>
    </body>
</html>
