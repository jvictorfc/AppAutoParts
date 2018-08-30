<?php
//require_once 'Produit.php';
//require_once 'Facture.php';
try {
	//Ouverture de la connexion à MySQL:
    $cnx = new PDO('mysql:host=localhost;dbname=ps_joaocarvalho_diegopelaez', "root", "root");
	if (isset($_GET['idp']) && trim($_GET['qtt']) && trim($_GET['pos']) && trim($_GET['cot']) != "") {//paramètre numero fourni dans la requete HTTP
		$requete = "INSERT INTO lignecommande(idCommande,idPiece,qtt,position,cote)".
				" VALUES ('".$_GET['idc']."','".$_GET['idp']."','".$_GET['qtt']."','".$_GET['pos']."','".$_GET['cot']."')";
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