#ifndef __SOMMET_HPP
#define __SOMMET_HPP

#include <iostream>
#include <stdio.h>

using namespace std;

class Sommet{

private:
	int etiquette;
	char lettre;
public:
	Sommet();
	Sommet(int etiquette);
	Sommet(int etiquette,char lettre);
	Sommet(Sommet& s);
	~Sommet();
	int getEtiquette();
	void setEtiquette(int etiquette);
	char getLettre();
	void setLettre(char lettre);
	Sommet& operator+=(Sommet &s);
	Sommet& operator=(Sommet& s);
	friend ostream& operator<<(ostream& flux,Sommet& s);
};

#endif
