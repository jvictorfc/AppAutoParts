<?php
try {
	//Ouverture de la connexion à MySQL:
  $cnx = new PDO('mysql:host=localhost;dbname=ps_joaocarvalho_diegopelaez', "root", "root");
	$requete = 'select p.NomPiece,l.qtt,l.cote,l.position,l.idCommande FROM pieces p JOIN lignecommande l ON l.idPiece=p.IdPiece where l.idCommande= '.$_GET['id'];

	
	$res = $cnx->query($requete);//Si requete de mise à jour, utiliser $cnx->exec();
	$res->setFetchMode(PDO::FETCH_OBJ);
	$s = "[";
	while ($row = $res->fetch()) {
	  if ($s!="[") {
		$s .= ",";
	  }
	  $s = $s.json_encode($row);
    }
	$s .= "]";
	$res->closeCursor();
    $cnx = null;
	echo $s;
		
} catch (PDOException $e) {
	echo "[]";
}

?>

