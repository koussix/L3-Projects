#include "Sommet.hpp"
/**
 * @brief Sommet::Sommet constructeur sans parametre
 */
Sommet::Sommet(){
    etiquette = 0;
    lettre = '\0';
}

/**
 * @brief Sommet::Sommet
 * @param etiquette
 * Constructeur avec etiquette en paramettre servira surtout dans
 * la premiere partie du projet.
 */

Sommet::Sommet(int etiquette){
	this->etiquette = etiquette;
	this->lettre='\0';
}

/**
 * @brief Sommet::Sommet
 * @param etiquette
 * @param lettre
 *  Constucteur parametrès avec 'int' et 'char', qui nous servira dans les prochaines
 * parties
 */
Sommet::Sommet(int etiquette,char lettre){
	this->etiquette = etiquette;
	this->lettre=lettre;
}

/**
 * @brief Sommet::Sommet
 * @param s
 *  Constructeur par recopie
 */
Sommet::Sommet(Sommet& s){
	this->etiquette = s.etiquette;
	this->lettre = s.lettre;
}

/**
 * @brief Sommet::~Sommet
 * Destructeur de la class
 */
Sommet::~Sommet(){
	//cout << "appel destruc sommet "<<endl;
}

/**
 * @brief Sommet::getEtiquette
 * @return
 */
int Sommet::getEtiquette(){
    return etiquette;
}

/**
 * @brief Sommet::setEtiquette
 * @param etiquette
 */
void Sommet::setEtiquette(int etiquette){
    this->etiquette=etiquette;
}

/**
 * @brief Sommet::getLettre
 * @return
 */
char Sommet::getLettre(){
    return lettre;
}

/**
 * @brief Sommet::setLettre
 * @param lettre
 */
void Sommet::setLettre(char lettre){
    this->lettre=lettre;
}

/**
 * @brief Sommet::operator =
 * @param s
 * @return
 * SURCHARGE de l'operateur d'affection
 */
Sommet& Sommet::operator=(Sommet& s){
	this->etiquette = s.etiquette;
	this->lettre = s.lettre;
	return *this;
}

/**
 * @brief Sommet::operator +=
 * @param s1
 * @return
 * SURCHARGE de l'operateur +=
 */
Sommet& Sommet::operator+=(Sommet &s1){
	this->etiquette += s1.etiquette;
	return *this;
}

/**
 * @brief operator <<
 * @param flux
 * @param s
 * @return
 * SURCHARGE de l'operateur <<
 */
ostream& operator<<(ostream& flux,Sommet& s){
	if(s.lettre == '\0')
		flux << "S(" << s.etiquette << ") ";
	else
		flux << "S(" << s.etiquette << "," << s.lettre << ") ";
	return flux;
}
