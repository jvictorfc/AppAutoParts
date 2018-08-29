<?php
//require_once 'Produit.php';
//require_once 'Facture.php';
try {
	//Ouverture de la connexion à MySQL:
    $cnx = new PDO('mysql:host=localhost;dbname=ps_joaocarvalho_diegopelaez', "root", "root");
	if (isset($_GET['dc']) && trim($_GET['idm']) && trim($_GET['an']) != "") {//paramètre numero fourni dans la requete HTTP
		$requete = "INSERT INTO commande(dateCommande, idMod,annee)".
				" VALUES ('".$_GET['dc']."','".$_GET['idm']."','".$_GET['an']."')";
		$nb = $cnx->exec($requete);
		if ($nb === FALSE) {
			$rep = "{\"reponse\":0}";
		}
		else {
			$rep = "{\"reponse\":".$nb."}";
		}		
	}
	else {
		$rep = "{\"reponse\":0}";
	}
    $cnx = null;
	echo $rep;	//"Bonjour tout le <b>monde</b>";//$s;
} catch (PDOException $e) {
	echo "{\"reponse\":0}";
}
?>