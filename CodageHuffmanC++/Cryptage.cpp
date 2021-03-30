#include "ArbreB.hpp"
#include <deque>

#define NB_CARAC_RECONNUS 128
/**
 * @brief ArbreB::tab_occurence
 * @param occurence[], chaine
 *
 * Fonction qui stocke le nombre d'occurence de chaque lettre utilisé dans la chaine.
*/
void tab_occurence(int occurence[],string chaine){
	
    for(int i=0;i<NB_CARAC_RECONNUS;i++){
        occurence[i] = 0; //L'initialisation
    }
    for(long unsigned int i=0;i<chaine.size();i++){
        occurence[(int)chaine[i]]++;
    }
}

char get_char_from_index(int i){
    return (char)(i);
}

void triFusion(int i, int j,deque<ArbreB*> &arbvect , ArbreB tmp[]) {

    if(j <= i){ return;}
  
    int m = (i + j) / 2;
    triFusion(i, m, arbvect, tmp);     //trier la moitié gauche récursivement
    triFusion(m + 1, j, arbvect, tmp); //trier la moitié droite récursivement
    int pg = i;     //pg pointe au début du sous-tableau de gauche
    int pd = m + 1; //pd pointe au début du sous-tableau de droite
    int c;          //compteur
// on boucle de i à j pour remplir chaque élément du tableau final fusionné
    for(c = i; c <= j; c++) {
        if(pg == m + 1) { //le pointeur du sous-tableau de gauche a atteint la limite
            tmp[c] = *arbvect[pd];
            pd++;
        }else if (pd == j + 1) { //le pointeur du sous-tableau de droite a atteint la limite
            tmp[c] = *arbvect[pg];
            pg++;
        }else if (arbvect[pg]->getSommet()->getEtiquette() < arbvect[pd]->getSommet()->getEtiquette()) { //le pointeur du sous-tableau de gauche pointe vers un élément plus petit
            tmp[c] = *arbvect[pg];
            pg++;
        }else {  //le pointeur du sous-tableau de droite pointe vers un élément plus petit
            tmp[c] = *arbvect[pd];
            pd++;
        }
    }
    for(c = i; c <= j; c++) {  //copier les éléments de tmp[] à arbvect[]
        *arbvect[c] = tmp[c];
    }
}

/**
 * @brief ArbreB::Arbre_cryptage
 * @param str
 *
 * Fonction principale de la 2éme partie qui represente l'algorithme d'Huffman.
 * elle nous renvoie le cryptage de la chaine "str" sous forme d'un arbre.
 * tout en remplissant notre structure (occurence et le codage de chaque lettre) 
*/

ArbreB& ArbreB::Arbre_cryptage(string str){
    int tab_occ[NB_CARAC_RECONNUS];
    // Appel à tab_occurence pour le stockage des occurences
    tab_occurence(tab_occ, str);
    // Utilisation d'une deque Pour la construction de l'arbre de codage.
    deque<ArbreB*> arbvect;
    int nb_element = 0;
    Sommet *s = NULL;
    //Recupere les lettres et leurs occurences sous forme d'arbres dans la deque.
    for(int i= 0 ; i<NB_CARAC_RECONNUS ; i++){
        if(tab_occ[i] != 0){
            nb_element++;
            s = new Sommet(tab_occ[i],get_char_from_index(i));

            arbvect.push_back(new ArbreB(*s));
   
            delete s;
        }
    }
	if(arbvect.size() <= 1){
        //cout <<"doublé : " << arbvect[0]->racine->getLettre()<< "  "<< arbvect[0]->racine->getEtiquette()<<endl;
		return *arbvect[0];
	}
	//Tableau temporaire essentiel pour la fonction triFusion.
    ArbreB* tempx= new ArbreB[arbvect.size()];
	
	//Appel à la fonction triFusion qui tri selon le nombre d'occurence (tri croissant).
    triFusion(0,nb_element-1,arbvect, tempx);
   /* cout << "Voici les occurences de chaque lettre :" << endl;
    for(int i=0 ; i < nb_element ; i++){
        cout <<" Doublé : "<< arbvect[i]->getSommet()->getLettre() << "  "<<
                                        arbvect[i]->getSommet()->getEtiquette()<<endl;
    }
    cout<<endl;*/
    delete []tempx;
    ArbreB *arb = new ArbreB();
	
	// On boucle jusqu'à avoir un seul arbre dans la deque.
    while(arbvect.size()>=2){
		//On fusionne les deux premiers élemnents contenant le nombre d'occurences les plus petits.
        *arb = Arbre_fusion(*arbvect[0], *arbvect[1]);
		
		//On retire les deux élements qu'on a fusionné.
        delete arbvect[0];
        arbvect.pop_front();
        delete arbvect[0];
        arbvect.pop_front();
        
        bool trouve = false;
        //On insere l'arbre fusionné tout en gardant la deque triée.
        for(long unsigned int i = 0 ; i< arbvect.size() ; i++){
            if( (arbvect[i]->racine->getEtiquette() > arb->racine->getEtiquette()) && trouve ==false){
                arbvect.emplace(arbvect.begin()+i,new ArbreB(*arb));
                trouve = true;
                break;
            }
        }
        //Si on a pas inseré l'arbre fusionné dans la boucle précédente, on l'insere à la fin.
        if(trouve == false){
            arbvect.push_back(new ArbreB(*arb));
        }

    }
    delete arb;
    
    return *arbvect[0];
}

string ArbreB::cryptage_lettre(char lettre){
	size_t indice = this->codage->lettre_a_coder.find(lettre);
	if(indice == string::npos){
		return "#";
	}else{
		return this->codage->encodage[indice];
	}
}



string ArbreB::code_crypter(string st){
	string cryptage = "";
    long unsigned int i = 0;
	while(i < st.length()){
		cryptage += cryptage_lettre(st[i]);
		i++;
	}
	return cryptage;
}



/**
 * @brief ArbreB::afficher_codage
 * @param str
 *
 * Fonction qui affiche le scénario généré aprés l'entrée de l'utilisateur.
*/

void ArbreB::afficher_codage(string str){
	if((fils_gauche == NULL) && (fils_droit == NULL)){
		cout << "Vous avez saisie qu'une seule lettre, Donc il n'existe pas de codage."<<endl;
	}else{
		cout <<"Voici la table de codage générée (Lettre,Encodage) :" << endl;
        for(long unsigned int i=0; i<this->codage->lettre_a_coder.size(); i++){
			cout <<"("<<this->codage->lettre_a_coder[i]<<" , "<<this->codage->encodage[i] <<")"<<endl;
		}
		cout << "\nVoici la chaine que vous avez entré : " << str << endl;
		cout << "\nVoici son encodage :  ";
        for(long unsigned int i = 0 ; i < str.size() ; i++){
            for( long unsigned int j = 0 ; j < this->codage->lettre_a_coder.size() ; j++){
				if( str[i] == this->codage->lettre_a_coder[j] ){
					cout << this->codage->encodage[j]; 
				}
			}
		}

		cout<<endl;
	}
}


/**
 * @brief ArbreB::afficher_codage
 * @param str
 */
string ArbreB::stocker_table(string str){
    string str_tab="";
    if((fils_gauche == NULL) && (fils_droit == NULL)){
        str_tab += "Vous avez saisie qu'une seule lettre, Donc il n'existe pas de codage. \n";
    }else{
        str_tab +="Voici la table de codage générée (Lettre,Encodage) :\n";
        for(long unsigned int i=0; i<this->codage->lettre_a_coder.size(); i++){
            str_tab = str_tab+"( ";
            if(this->codage->lettre_a_coder[i]=='\n'){
                 str_tab = str_tab + "\\n";
            }
            else{
                str_tab = str_tab + this->codage->lettre_a_coder[i];
            }
            str_tab = str_tab + " , " + this->codage->encodage[i] +")\n";
        }
        str_tab =str_tab+ "\nVoici la chaine que vous avez entré :" +str + "\n";
        str_tab = str_tab+"\nVoici son encodage :  \n";
        for(long unsigned int i = 0 ; i < str.size() ; i++){
            for( long unsigned int j = 0 ; j < this->codage->lettre_a_coder.size() ; j++){
                if( str[i] == this->codage->lettre_a_coder[j] ){
                    str_tab =str_tab + this->codage->encodage[j];
                }
            }
        }

        str_tab = str_tab + "\n";
    }
    return  str_tab;
}
