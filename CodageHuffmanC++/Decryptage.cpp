#include "ArbreB.hpp"
#include <deque>


/**
 *  Fonction qui sert a decrypter une suite de 0 et de 1 si bien sur elle correspond
 *                                                      a une lettres de notre arbre
 *
 *  Si la suite ne correspond a aucune lettre (aucun chemin possible) on renvoie un cas d'erreur
 *
 * @brief ArbreB::Decryptage_lettre_rec
 * @param curseur
 * @param str_huf
 * @return
 */
char ArbreB::Decryptage_lettre_rec(long unsigned int& curseur, string str_huf){
    if(this->fils_gauche == NULL && this->fils_droit == NULL){
        return this->racine->getLettre();
    }
    else{
        if(str_huf[curseur] == '0' && this->fils_gauche != NULL){
			curseur++;
			return  this->fils_gauche->Decryptage_lettre_rec(curseur, str_huf);
		}
        else if(str_huf[curseur] == '1' && this->fils_droit != NULL ){
            curseur++;
            return this->fils_droit->Decryptage_lettre_rec(curseur, str_huf);
        }
        else if(this->fils_droit == NULL && str_huf[curseur]=='1'){
            cout<< "Le codage n'est pas reconnu"<< endl;
        
            return '$';
        }
        if(this->fils_gauche == NULL && str_huf[curseur]=='0'){
             cout<< "Le codage n'est pas reconnu"<< endl;
             
             return '$';
        }
        if(curseur > str_huf.length()){
            cout << "Erreur" << endl;
            return '$';
            
        }

	}
    return '$';
}

/**
 *  Fonction qui va decrypter tout l'encodage "str_huff" (suite 0 et 1)
 *  Puis elle retourne le resultat du décryptage (si tout va bien).
 *  Elle retourne une chaine vide dans le cas où l'encoudage n'est pas reconnu
 * @brief ArbreB::Decryptage_huffman
 * @param str_reponse
 * @param str_huf
 * @param user_entry
 * @return entry (string)
 */


string ArbreB::Decryptage_huffman(string str_huf,string& str_reponse ,bool user_entry){
    long unsigned int curseur=0 ; //curseur de lecture sur la chaine
    string entry = "";

    int nb_lettres =0;
    bool est_verifier = true;
    while( curseur < str_huf.length() ){
        char c = this->Decryptage_lettre_rec(curseur, str_huf);
        if(c == '$'){
            est_verifier = false;
            break;
        }
        entry += c;
        nb_lettres++;    
    }
    if(est_verifier == false){
        str_reponse = "La verification a échouer (le code ne peut même pas etre lu en entier)";
        return "";
    }
    //si c'est l'utilisateur qui a saisie un code alors on verifie
    // certaines autres contraintes avant de dire si le code est valide
    if(user_entry == true){
        bool existe = true;

        if(nb_lettres != this->getSommet()->getEtiquette()){
            str_reponse = "Le code ne correspond pas au texte en entrée : Le nombre de lettre"
                          " n'est meme pas égale au nombre d'occurence de l'arbre, "
                          "\nLe code a pu etre décoder.";
            existe = false;
        }
        if(existe == true ){
            for(long unsigned int i = 0 ; i< entry.length() ; i++){
                if(this->codage->lettre_a_coder.find(entry[i]) == string::npos){
                    existe = false;
                    str_reponse
                             = "Le code ne correspond pas au texte en entrée : Les lettres"
                               " contenus dans l'arbre n'ont pas toutes été utilisés,"
                               "\nLe code a pu etre décoder.";
                    break;
                }
            }
        }
        // si on arrive ici ça veut dire que le code peut correspondre a notre texte de base
        if(existe == true){
            str_reponse = "Le code peut correspondre au texte qui à créé l'arbre huffman,"
                          "on ne peut pas certifier l'exactitude!";
        }
    }


    return entry;
}


/**
  Cette fonction ne sert qu'au cas ou on a le texte en clair en entrée (typiquement elle sert quand dans notre
  programme on fait un decryptage par defaut de ce qui a été crypté en deuxieme partie
  Elle n'est plus appeler quand l'utilisateur saisi lui meme son code.
 * @brief ArbreB::verification_code_cryp
 * @param str
 * @param code
 */

void ArbreB::verification_code_cryp(string str,string code){
    long unsigned int i = 0;
    long unsigned int j = 0;
    bool bol;
    while( (i < str.length()) && (j < code.length()) ){
        bol = true;
        string cryp_lettre = cryptage_lettre(str[i]);
        if(cryp_lettre == "#"){
            break;
        }else{
            for(long unsigned int k=0; k<cryp_lettre.length(); k++){
                if(cryp_lettre[k] == code[j]){
                    j++;
                }else{
                    bol = false;
                    break;
                }
            }
            if(bol == true){
                i++;
            }else{
                break;
            }
        }
    }
    if( (i < str.length()) || (j < code.length()) ){
        cout << "Le texte n'a pas été bien codé selon l'arbre binaire de la deuxiéme partie" << endl;
        exit(3);
    }
    //else{
    //	cout << "Le texte a été bien codé selon l'arbre binaire de la deuxiéme partie" << endl;
    //}
}
