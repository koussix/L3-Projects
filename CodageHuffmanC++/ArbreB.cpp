#include "ArbreB.hpp"
#include <deque>

/**
 * @brief ArbreB::ArbreB
 * Constructeur par défaut de la class ArbreB
 */
ArbreB::ArbreB(){
    this->racine=NULL;
    this->fils_droit = NULL;
    this->fils_gauche= NULL;
    this->codage = NULL;
};

/**
 * @brief ArbreB::ArbreB
 * @param s
 * Constructeur parametre
 */
ArbreB::ArbreB(Sommet &s){
    //this->racine = new Sommet(s);
    this->racine= new Sommet(s);
    this->codage = new Codage_Huffman();
    this->codage->lettre_a_coder += string(1,s.getLettre());
    this->codage->encodage = new string[1];
    this->codage->encodage[0] = ""; 
    this->fils_droit = NULL;
    this->fils_gauche= NULL;
};

/**
 * @brief ArbreB::ArbreB
 * @param arb
 * Constructeur par recopie
 */
ArbreB::ArbreB(ArbreB& arb){
    this->racine = NULL;
    this->codage = NULL;
    this->fils_gauche= NULL;
    this->fils_droit = NULL;

    if(arb.racine){
        //this->racine = new Sommet(*arb.racine);
        copie_arbre(this, &arb);
    }
    
};

/**
 * @brief ArbreB::~ArbreB
 *
 * Destructeur de notre class ArbreB
 */
ArbreB::~ArbreB(){
    if(this->racine) delete (this->racine);
    if(this->fils_droit) delete (this->fils_droit);
    if(this->fils_gauche) delete (this->fils_gauche);
    if(this->codage){ 
        if(this->codage->encodage){ 
            delete [] this->codage->encodage;
            this->codage->encodage = NULL;
        }
        delete this->codage;
    }
    this->racine = NULL;
    this->fils_droit = NULL;
    this->fils_gauche = NULL;
    this->codage = NULL;
};

/**
 * @brief ArbreB::copie_arbre
 * @param arb1
 * @param arb2
 * Fonction de copie utilisé par notre constructeur par recopie
 */
void ArbreB::copie_arbre(ArbreB* arb1, ArbreB* arb2){
        arb1->racine = new Sommet(*arb2->racine);

        if(arb2->codage != NULL){
            arb1->codage = new Codage_Huffman();
            arb1->codage->lettre_a_coder = arb2->codage->lettre_a_coder;
            if(arb2->codage->encodage){
                int taille = arb2->codage->lettre_a_coder.size();
                arb1->codage->encodage = new string [taille];
                for(int i = 0 ; i < taille ; i++){  
                    arb1->codage->encodage[i] = arb2->codage->encodage[i];   
                }
            }
        }

        if(arb2->fils_gauche != NULL){
            arb1->fils_gauche = new ArbreB();
            arb1->copie_arbre(arb1->fils_gauche,arb2->fils_gauche);
            }
        if(arb2->fils_droit != NULL) {
            arb1->fils_droit = new ArbreB();
            arb1->copie_arbre(arb1->fils_droit,arb2->fils_droit);}
};

/**
 * @brief ArbreB::getSommet
 * @return
 */
Sommet* ArbreB::getSommet(){
    return this->racine;
};
/**
 * @brief ArbreB::getFils_gauche
 * @return
 */
ArbreB* ArbreB::getFils_gauche(){
    return this->fils_gauche;
};
/**
 * @brief ArbreB::getFils_droit
 * @return
 */
ArbreB* ArbreB::getFils_droit(){
    return this->fils_droit;
};

/**
 * @brief ArbreB::operator =
 * @param arb
 * @return
 *  SURCHARGE de l'operateur d'affectation
 */
ArbreB& ArbreB::operator=(ArbreB& arb){
    if(arb.racine != NULL){
        if(this->racine == NULL){
            this->codage = NULL;
            this->fils_gauche = NULL;
            this->fils_droit = NULL;
            copie_arbre(this , &arb);
        }
        else
        {   
            if(this->racine != NULL) delete racine;
            if(this->codage != NULL){
                if(this->codage->encodage != NULL){
                    delete [] this->codage->encodage;
                    this->codage->encodage = NULL;
                }
                delete this->codage;
            }
            if(this->fils_gauche!= NULL) delete this->fils_gauche;
            if(this->fils_droit != NULL) delete this->fils_droit;
            
            this-> racine = NULL;
            this->codage = NULL;
            this->fils_gauche=NULL;
            this->fils_droit=NULL;
            
            this->copie_arbre(this , &arb);
        }
        
    }
    else
    {   
        if(this->racine != NULL) delete racine;
        if(this->codage != NULL){
            if(this->codage->encodage != NULL){
                delete [] this->codage->encodage;
                this->codage->encodage = NULL;
            }
            delete this->codage;
        }
        if(this->fils_gauche!= NULL) delete this->fils_gauche;
        if(this->fils_droit != NULL) delete this->fils_droit;
        this-> racine = NULL;
        this->codage =NULL;
        this->fils_gauche=NULL;
        this->fils_droit=NULL;
    }
    return *this;
};

/**
 * @brief ArbreB::Arbre_ajouter_sommet
 * @param s
 * @return
 *
 * Fonction d'ajout d'un sommet dans l'abre, prend un sommet en
 * parametre
 *
 * La fonction suit la structure d'un arbre Peigne
 *
 */

ArbreB& ArbreB::Arbre_ajouter_sommet(Sommet& s){
    if(this->racine == NULL){
        this->racine = new Sommet(s);
        return *this;
    }
    if(this->fils_gauche == NULL){
        this->fils_gauche = new ArbreB(s);
        return *this;
    }
    if(this->fils_droit == NULL){
        this->fils_droit = new ArbreB(s);
        return *this;
    }
    return this->fils_gauche->Arbre_ajouter_sommet(s);
};

/**
 * @brief ArbreB::Arbre_ajouter_sommet
 * @param etiquette
 * @return
 *  Fonction d'ajout d'un sommet dans l'abre, prend un entier en
 * parametre
 */
ArbreB& ArbreB::Arbre_ajouter_sommet(int etiquette){
    Sommet s(etiquette);
    return  Arbre_ajouter_sommet(s);
};

/**
 * @brief ArbreB::Arbre_fusion
 * @param arb1
 * @param arb2
 * @return
 *
 * Fonction de fusion de deux arbre binaire pour en former qu'un
 */
ArbreB& ArbreB::Arbre_fusion(ArbreB& arb1, ArbreB& arb2){
    if(this->racine ) delete this->racine;
    if(this->codage ){
        if(this->codage->encodage){
            delete [] this->codage->encodage;
            this->codage->encodage = NULL;
        }
        delete this->codage;
    }
    if(this->fils_gauche) delete this->fils_gauche;
    if(this->fils_droit) delete this->fils_droit;

    // Notre etiquete de racine = etiquette arb1 + etiquette arb2
    
    racine = new Sommet(arb1.racine->getEtiquette() + arb2.racine->getEtiquette() );

    //REMPLISSAGE DE LA STRUCTURE HUFFMAN
    this->codage = new Codage_Huffman();
    int nb_cases =  arb1.codage->lettre_a_coder.size() + arb2.codage->lettre_a_coder.size(); 

    this->codage->lettre_a_coder =  arb2.codage->lettre_a_coder + arb1.codage->lettre_a_coder ;
    
    this->codage->encodage = new string[nb_cases];

    int taille_arb1 = arb2.codage->lettre_a_coder.size();

    for(int i=0 ; i<nb_cases ; i++)
    {
        if( i < taille_arb1 )
        {
           // this->codage->encodage[i] = "1";
            this->codage->encodage[i] = "0"+ arb2.codage->encodage[i];
           // this->codage->encodage[i] = arb2.codage->lettre_a_coder;
        }
        else
        {
            //this->codage->encodage[i] = "0";
            this->codage->encodage[i] = "1"+arb1.codage->encodage[i- taille_arb1];
            //this->codage->encodage[i] = arb1.codage->lettre_a_coder;
        }

    }


    fils_droit = new ArbreB(arb1);
    fils_gauche = new ArbreB(arb2);
    return *this;
};


/**
 * @brief ArbreB::Arbre_decomposition
 * @param arb1
 * @param arb2
 *
 * Decompose l'arbre en 2 sous Arbre (copie des deux sous arbre dans nos arbres en parametres)
 */
void ArbreB::Arbre_decomposition(ArbreB &arb1 , ArbreB& arb2){

    if(arb1.racine != NULL){
        delete arb1.racine;
        delete arb1.fils_gauche;
        delete arb1.fils_droit;
    }
    if(arb2.racine != NULL){
        delete arb2.racine;
        delete arb2.fils_gauche;
        delete arb2.fils_droit;
    }
    arb1.racine =NULL;
    arb1.fils_gauche = NULL;
    arb1.fils_droit =NULL;

    arb2.racine=NULL;
    arb2.fils_gauche= NULL;
    arb2.fils_droit = NULL;

    arb1.copie_arbre(&arb1 , this->fils_gauche);
    arb2.copie_arbre(&arb2 , this->fils_droit);

};

/**
 * @brief ArbreB::rechercher_element
 * @param num_sommet
 * @return
 *
 * Fonction de rechrche d'un element dans un arbre binaire
 */
bool ArbreB::rechercher_element(int num_sommet){
    if(this->racine == NULL){
        cout<< "L'ARBRE EST NULL"<<endl;
        exit(1);
    }
    if(this->racine->getEtiquette() == num_sommet ){
        return true;
    }
    if((this->fils_gauche != NULL) && (this->fils_droit != NULL) ){
        return (this->fils_droit->rechercher_element(num_sommet) || this->fils_gauche->rechercher_element(num_sommet));
    }    
    if(this->fils_gauche != NULL && this->fils_droit == NULL ){
        return this->fils_gauche->rechercher_element(num_sommet);
    }
    if(this->fils_gauche == NULL && this->fils_droit != NULL){
        return this->fils_droit->rechercher_element(num_sommet);
    }
    return false;
};

/**
 * @brief ArbreB::Arbre_supprimer_sommet
 * @param s
 * @return
 *
 * Fonction de suppression d'un noeud (on donne un entier en parametre)
 * La fonction fait en sorte de garder la structure d'arbre peigne qu'on a presente
 *
 */

ArbreB& ArbreB::Arbre_supprimer_sommet(int s){
    /* Si notre arbre n'est pas vide
     */
    if(racine){
        // CAS 1 : Suppression de la racine
        if(racine->getEtiquette() == s){
            // CAS 1.1 : Racine sans fils
                if((fils_droit == NULL) && (fils_gauche == NULL)){
                        delete this->racine;
                        racine =NULL;
                }
                // CAS 1.2 : La Racine possede un fils droit
                // On remonte le fils droit à la place de racine
                // On libere le fils.
                if(this->fils_droit != NULL){
                        ArbreB *tmp = this->fils_droit;
                        racine->setEtiquette(fils_droit->racine->getEtiquette());
                        fils_droit =NULL;
                        delete tmp;
                }else{
                    // CAS 1.3 : La Racine possede un fils gauche
                    // On pointe vers le sous Arbre gauche ( on le remonte à la place du noeud courant )
                        if(this->fils_gauche != NULL){
                                ArbreB *tmp = this->fils_gauche;
                                racine->setEtiquette(fils_gauche->racine->getEtiquette());
                                fils_droit = fils_gauche->fils_droit;
                                fils_gauche = fils_gauche->fils_gauche;
                                tmp->fils_droit = NULL;
                                tmp->fils_gauche = NULL;
                                delete tmp;
                        }
                }
        }else{ 
            /* Si le noeud a supprimer n'est pas notre racine alors
            *  On parcours les sous arbres DROIT et GAUCHE
            */

                if(fils_droit){
                    // CAS 2.1 : Si le noeud a supprimer est notre feuille droite ( structure arbre peigne )
                        if((fils_droit->fils_droit == NULL) && (fils_droit->fils_gauche == NULL)){
                                if(fils_droit->racine->getEtiquette() == s){
                                        delete fils_droit;
                                        fils_droit=NULL;
                                }
                        }else{
                            // CAS 2.2 : Appel recursif
                                fils_droit->Arbre_supprimer_sommet(s);
                        }
                }
                if(fils_gauche){
                    // CAS 2.3 : Si le noeud a supprimer est notre feuille gauche ( structure arbre peigne )
                        if((fils_gauche->fils_droit == NULL) && (fils_gauche->fils_gauche == NULL)){
                                if(fils_gauche->racine->getEtiquette() == s){
                                        delete fils_gauche;
                                        fils_gauche=NULL;
                                }
                        }else{
                            // CAS 2.2 : Appel recursif
                                fils_gauche->Arbre_supprimer_sommet(s);
                        }
                }
        }
    // On retourne notre objet
    return *this;
    }
    else{
        // CAS D'erreur
            cout << "ARBRE est vide" <<endl;
            delete this;
            exit(1);
    }
};

/**
 * @brief ArbreB::modifier_sommet
 * @param saisie
 * @param etiquette
 *
 * Fonction de modification de l'etiquette d'un sommet choisi par l'utilisateur
*/
void ArbreB::modifier_sommet(int saisie,int etiquette){
        
    if(!racine)
    {   // CAS D'ERREUR
        delete this;
        cout<< "L'ARBRE EST vide"<<endl;
        exit(1);
    }else{
         if(saisie == racine->getEtiquette()){
            racine->setEtiquette(etiquette);
         }
    }
    if(this->fils_gauche){
        this->fils_gauche->modifier_sommet(saisie,etiquette);
    }    
    if(this->fils_droit){
                this->fils_droit->modifier_sommet(saisie,etiquette);
    }
};

/**
 * @brief ArbreB::affiche
 * @param prefixe
 *
 * Fonction d'affichage, utilisé dans notre scénario terminal
*/
void ArbreB::affiche(string prefixe){
      cout << prefixe << "`";
      if (this->racine == NULL) { 
        cout << endl;
      } else {
          if(this->racine->getLettre() != '\0')
          {
            cout << this->racine->getEtiquette() <<":"<< this->racine->getLettre() <<endl;
          }
          else
          {
             cout << this->racine->getEtiquette() << endl;
          }
        if(this->fils_droit) this->fils_droit->affiche(prefixe + " |");
        if(this->fils_gauche)this->fils_gauche->affiche(prefixe + "  ");
        }
 }

void ArbreB::affiche_stock(string prefixe, string& retour){
      retour=retour + prefixe + "`";
      if (this->racine == NULL) {
        retour+="\n";
      } else {
          /*int a = 10;
          char *intStr = itoa(a);
          string str = string(intStr);*/
          if(this->racine->getLettre() != '\0')
          {
            if(this->racine->getLettre()== '\n'){
                retour = retour + to_string(this->racine->getEtiquette()) +":"+ "\\n" +"\n";
            }
            else
                retour = retour+ to_string(this->racine->getEtiquette()) +":"+ this->racine->getLettre() +"\n";
          }
          else
          {
             retour = retour + to_string(this->racine->getEtiquette()) +"\n";
          }
        if(this->fils_droit) this->fils_droit->affiche_stock(prefixe + " |",retour);
        if(this->fils_gauche)this->fils_gauche->affiche_stock(prefixe + "  ",retour);
        }
 }


/**
 * @brief ArbreB::afficher_infixe
 */
void ArbreB::afficher_infixe(){
    if(this->racine != NULL ){    
        if(this->fils_gauche){ this->fils_gauche->afficher_infixe();}

        cout<<this->racine->getEtiquette()<< endl;

        if(this->fils_droit){ this->fils_droit->afficher_infixe();}
    }
};
