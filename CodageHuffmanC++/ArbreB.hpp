#ifndef __ARBREB_HPP
#define __ARBREB_HPP
#include "Sommet.hpp"


struct Codage_Huffman{
    string lettre_a_coder = "";
    string *encodage = NULL;                            
};

class ArbreB
{
private:   
    Codage_Huffman* codage;
    Sommet* racine;
    ArbreB* fils_gauche;
    ArbreB* fils_droit;

public:
    ArbreB();
    ArbreB(Sommet& s);
    ArbreB(ArbreB& arb);
    void copie_arbre(ArbreB*arb1, ArbreB*arb2);
    ArbreB& Arbre_ajouter_sommet(Sommet& s);
    ArbreB& Arbre_ajouter_sommet(int etiquette);
    void modifier_sommet(int saisie,int etiquette);
    ArbreB& Arbre_supprimer_sommet(int s);
    ArbreB& Arbre_fusion(ArbreB& arb1, ArbreB& arb2);
    void Arbre_decomposition(ArbreB &arb1 , ArbreB& arb2);
    ArbreB& operator=(ArbreB& arb);
    ArbreB* getFils_gauche();
    ArbreB* getFils_droit();
    ArbreB& Arbre_cryptage(string str);
	string cryptage_lettre(char lettre);
    void verification_code_cryp(string str,string code);
    string Decryptage_huffman(string str_huf,string& str_reponse ,bool user_entry=false);
    char Decryptage_lettre_rec(long unsigned int& curseur,string str_huf);
	string code_crypter(string st);
    void affiche(string prefixe="");
    bool rechercher_element(int num_sommet);
    void afficher_infixe();
    void afficher_codage(string str);
    string stocker_table(string str);
    void affiche_stock(string prefixe, string& retour);

    //friend ostream& operator<<(ostream& flux, ArbreB& arb);
    Sommet* getSommet();
    ~ArbreB();
};



#endif
