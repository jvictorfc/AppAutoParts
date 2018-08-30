<?php
try {
	//Ouverture de la connexion à MySQL:
  $cnx = new PDO('mysql:host=localhost;dbname=ps_joaocarvalho_diegopelaez', "root", "root");
	$requete = 'SELECT c.idcommande,m.nomMarque,mo.nomModele,c.dateCommande,c.annee FROM commande c, marque m,modele mo WHERE c.idMod=mo.idModele and mo.idMarque=m.idmarque';
	
	
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