## Troisiéme partie :

1. Dans cette dérniére partie nous avons implementé le décryptage du codage de Huffman 
	(le texte codé dans la deuxiéme partie ou bien un codage saisi par l'utilisateur)
	selon l'arbre de Huffman qu'on a construit dans la deuxiéme partie.
		> Si le codage correspond au texte codé dans la 2éme partie, 
			on doit d'abord vérifier que le codage a été codé selon l’arbre binaire construit dans la 2éme partie (ce qui est logique), 
			Puis on va décrypter le texte codé(Suite de 0 et 1) lettre par lettre(codé),
			à la fin on retourne le resultat final de décryptage.
			
		> Si le codage a été saisi par l'utilisateur, on doit vérifier que le codage de chaque "lettre codé" est correcte,
			et on renvoit le resultat décryptage de la lettre au même temps,
			ainsi de suite jusqu'on décrypte tout le texte codé puis on retourne le resultat final, 
			Si on trouve un codage qui n'a pas été reconnu(par exemple se retrouver sur un noeud intermédiaire à la fin de notre parcours du code)
			on renvoit une chaine vide.
	 
2. REMARQUE IMPORTANTE : Le caractére '$' n'est pas reconnu par notre programme, 
	il faut éviter de le saisir (il nous sert à detecter un cas probléme)!!!

3. Fonctions utlisées :
	> char Decryptage_lettre_rec(long unsigned int& curseur, string str_huf) : La fonction qui vérifie et décode une suite de 0 et 1 correspondant à une lettre.
	> string Decryptage_huffman(string str_huf,string& str_reponse ,bool user_entry) : La fonction qui vérifie et retourne le resultat final de l'opération de décryptage.
	> void verification_code_cryp(string str,string code) : Fonction qui vérifie si le codage de la 2éme partie correspond à l'arbre Huffman.

#Interface graphique :

1. Nous avons enrichie notre interface graphique comme nous vous l'avons promis dans la deuxiéme partie, 
	nous avons réussi à implémenter dans notre interface les éléments suivants :
	
	> Afficher l'arbre de Huffman correspondant au texte saisie (2éme partie partie).
	> Afficher chaque lettre avec son codage sous forme de couple.
	> Afficher le codage du texte saisi par l'utilisateur selon le code de Huffmann(2éme partie).
	> Afficher le resultat de décryptage (par défaut on décrypte le codage du texte saisi par l'utilisateur).
	> Donner l'accés à l'utilisateur pout saisir un codage(Suite de 0 et 1)
	> Afficher le resultat de décryptage du code saisi si il a été reconnu par l'arbre de Huffman construit auparavant.


2. Note: Les seules erreurs soulevés par notre valgrind concerne notre interface QT, nous manquons d'elements
    et de documentation approfondi pour toutes les regler.
		
# METHODES DE COMPILATION :

- Deux méthodes :
	1. Lancer "qmake", le makefile est alors automatiquement généré,
		lancer "make", puis "./Main".
	2. Si la premiére méthode ne fonctionne pas, veuillez s'il vous plaît importer directement le "src.pro" 
		de notre dossier depuis l'interface "Qtcreator".
- Notes :
	> Nous avons essayé de nous documenter sur "cmake", mais nous n'avons malheureusement 
		pas pu proposer une hiérarchie propre au "cmake".








###################################################

## Premiére partie :

1. Pour la structure Sommet :
    - On a implémenté l'objet avec 2 attributs int etiquette, char lettre.
    L'attribut  lettre ne nous interesse pas pour la première partie (on l'utilisera par la suite).

    - Les fonctions utilisées sont des fonctions simple de manipulation de classes,
    > On à implémenté 4 constructeurs de classe,
        Sommet();
        Sommet(int etiquette);
        Sommet(int etiquette,char lettre);
        Sommet(Sommet& s);
    > Et un destructeur.

    > Ainsi que des Accesseurs pour accéder à nos attributs privés de la classe sans briser l'encapsulation.

    > On a également surchargé deux opérateur : "+=" et "=" (le "<<" est juste optionnel vu qu'on ne l'utilisera que rarement).

1. Pour la structure ArbreB : (La structure d'un arbre Peigne pour les fonctions d'ajouts)
    - On a implémenté l'objet avec 3 attributs qui sont :
    >    Sommet* racine; // Représente un pointeur vers le noeud courant (racine courante).
    >    ArbreB* fils_gauche; // Représente un pointeur vers le sous arbre gauche.
    >    ArbreB* fils_droit;  // Représente un pointeur vers le sous arbre droit.

    - On a implémenté 3 constructeurs pour l'objet arbre :
        ArbreB();
        ArbreB(Sommet& s);
        ArbreB(ArbreB& arb);
    
    > void copie_arbre(ArbreB*arb1, ArbreB*arb2); // Est la fonction qui nous permet de copier nos arbre
    en interne (par nos méthodes constructeur par recopie..), On a préféré la mettre dans le .hpp pour ne pas 
    avoir à casser l'encapsulation (on aurait pu utiliser une fonction ami !).

    - Deux fonctions d'ajout : 
    >ArbreB& Arbre_ajouter_sommet(Sommet& s);
    >ArbreB& Arbre_ajouter_sommet(int etiquette);

    - Une fonction de modification d'etiquette et de recherche:
    >void modifier_sommet(int saisie,int etiquette);
    >bool rechercher_element(int num_sommet);
    

    - Une fonction de suppression de sommet :
    >ArbreB& Arbre_supprimer_sommet(int s); // Pour note : on essaye de garder une structure arbre peigne pour les suppression sur un arbre peigne simple. Ce qui fait que si on essaye de faire la fusion et que l'on supprime notre racine, on libére tout le sous arbre droit!

    - Fusion décomposition : 
    >ArbreB& Arbre_fusion(ArbreB& arb1, ArbreB& arb2); // On a essayer de preparer le terrain pour la partie 2, en effet pour la fusion on copie les 2 arbre dans un nouvel arbre qui a pour racine une etiquette = la somme des etiquette des deux sous arbres.

    >void Arbre_decomposition(ArbreB &arb1 , ArbreB& arb2); // Meme raisonnement que la fusion ici on recopie nos deux sous arbre gauche et droit dans les arbres donnés en référence de la fonction.

    - On a aussi surchargé l'operateur =

    - Des accesseurs : qu'on utilisera surtout dans l'interface graphique afin de ne pas briser l'encapsulation.
    >ArbreB* getFils_gauche();
    >ArbreB* getFils_droit();
    >Sommet* getSommet();

    - On a 3 fonctions d'affichage:
    >void affiche(string prefixe=""); //Utilisé dans le scénario du terminale, nous permet d'afficher un joli arbre horizontale.
    >void afficher(QPainter& painter, int x, int y); // Typiquement la fonction la plus importante pour notre affichage sur l'interface graphique, on passe le QPainter de la méthode appelante en parametres et on déssine à partir de là
    >void afficher_infixe(); // simple fonction d'affichage infixe


## Deuxiéme partie :

1. Dans cette partie on a enrichie les Classes déja utilisées en premiere partie, on notera quelques ajouts sur la classe ArbreB : 
    > Nous avons ajouté une structure Codage_Huffman à notre implémentation de base, cette derniere permet de stocker les lettres à coder (apparus dans le texte) et leurs encodages respectifs.
    > Nous n'avons pas opté pour la création d'une nouvelle classe pour notre Codage huffman, car les fonctions implémentaient en première partie sur nos arbres nous ont permis de réflechir à une maniere de trouver l'encodage de chaque lettre juste en construisant l'arbre de l'encodage (aucune compléxité supplémentaire) => Complexité de l'algorithme en O(n^2) au pire des cas (car on parcours la dequeu pour inserer le nouvel arbre Fusionné ce qui nous fait n^2/2 operations). Mais en pratique on se rapproche d'une compléxité en O(nlog(n)) (comme la deque est trié on la parcours que tres rarement jusqu'a la fin).

1. Fonctions utilisés:
2. ArbreB& Arbre_cryptage(string str) : Fonction principale de la partie 2, apres que l'utilisateur ait inserer une chaine on transforme chaque caractere et son occurence en ArbreB(feuille) qu'on ajoute à une deque, on tri cette dernière, et on suit un cheminement: Fusion -> Suppression des arbres utilisés -> Insertion de l'arbre fusionné, jusqu'à n'avoir qu'un seul arbre dans notre deque. 

2. ArbreB& Arbre_fusion(ArbreB& arb1, ArbreB& arb2) : Fonction clé appellé par notre fonction principale de cryptage, elle permet la fusion de 2 arbres, et la génération des encodages de chaque lettre suivant le chemin de fusion.

2. void afficher_codage(string str): Nous permet d'afficher pour chaque lettre son encodage, et de traduire le texte ecrit en langage humain en binaire (apres codage huffman).

