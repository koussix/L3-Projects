#include "mymainwindow.h"
#include <QDialog>
#include <QInputDialog>


/**
 * Le constructeur de mymainwindow, représente la base de notre interface graphique.
 * @brief mymainwindow::mymainwindow()
 * @return 
 */

mymainwindow::mymainwindow(){

    this->setFont(QFont("Times New Roman", 18));
    this->resize(1000,1200);
    this->setWindowTitle("Arbre binaire");
    bool refaire = false;
    bool ok;

    string test = "";
    do{
    refaire = false;
    
    //Créer une boite de dialogue et stocker le texte saisie par l'utilisateur
    //dans "str"
    str = QInputDialog::getMultiLineText(this, tr("Partie 3 BEGIN"),
                                                     tr("Entrez un texte sans le '$' non géré:"), "Defaut", &ok);

    test = str.toStdString() ;
    for (unsigned long int i = 0 ; i<test.length(); i++){
        if(test[i] == '$'){
			// refaire la saisie si un caractére n'a pas été reconnu 
            refaire = true;
        }
    }

    if (!ok || str.isEmpty())
		// refaire la saisie si l'utilisateur n'a rien entré
        refaire = true;
    }while(refaire != false);


    Huffman = new ArbreB();
    cout<<endl;
    string strentry = str.toStdString();
    *Huffman = Huffman->Arbre_cryptage(strentry);
    testedit = new QTextEdit(this);
    string stocker="";
    Huffman->affiche_stock("",stocker);
    stocker = "Voici l'arbre correspondant à votre saisie \n" + stocker;
    
    // Le TextEdit correspond à l'arbre binaire de Huffman.
    testedit->setPlainText(QString::fromStdString(stocker));
    testedit->setReadOnly(true);
    testedit->setMinimumSize(500,300);
    testedit->setFontFamily("New Roman");
    QGridLayout* layout =new QGridLayout(this);
    layout->addWidget(testedit,0,0,Qt::AlignTop);
    testedit->show();
    str = QString::fromStdString(Huffman->stocker_table(strentry));
    
    // L'affichage des couples (lettre,encodage) et du codage du texte.
    testedit2 = new QTextEdit(this);
    testedit2->setPlainText(str);
    testedit2->setReadOnly(true);
    testedit2->setMinimumSize(500,300);
    layout->addWidget(testedit2,0,1,Qt::AlignTop);

    string code_decode = Huffman->code_crypter(strentry);
    Huffman->verification_code_cryp(strentry,code_decode);
    str = "PARTIE3: \n->Verification reussi l'arbre a bien été créé à partir de l'entrée utilisateur !\n"
          "->Le code correspondant au texte est :"+ QString::fromStdString(code_decode) +"\n->Decodage du code..\nVoici la chaine correspondante :";

    // comme ici on est sur que le texte correspond a notre texte il n'est pas necessaire de s'interesser
    // aux traitements reliés au bool_user (l'insertion d'un codage)
    string toto= "";
    code_decode = Huffman->Decryptage_huffman(code_decode,toto);
    str = str + QString::fromStdString(code_decode);
    
    // Afficher le résultat de décryptage du texte codé dans la 2éme partie.
    testedit3 = new QTextEdit(this);
    testedit3->setPlainText(str);
    testedit3->setMinimumSize(500,250);
    testedit3->setReadOnly(true);
    layout->addWidget(testedit3,1,1,Qt::AlignTop);
    
    // Donne la main à l'utilisateur pour saisir son codage.
    testedit4 = new QTextEdit(this);
    str = "\nVous pouvez aussi choisir de rentrer un code, le programme se chargera de vous dire s'il est reconnu"
          " par l'arbre généré !";
    testedit4->setPlainText(str);
    testedit4->setMaximumSize(500,500);
    testedit4->setReadOnly(true);
    layout->addWidget(testedit4,1,0,Qt::AlignTop);
    testedit5 = new QTextEdit(this);
    testedit5->setPlaceholderText("Saisir une suite de 0 et 1");
    testedit5->setMaximumSize(300,50);
    layout->addWidget(testedit5,1,0,Qt::AlignBottom);
    button = new QPushButton("ENVOYER");
    layout->addWidget(button,2,0,Qt::AlignTop);
    connect(button, SIGNAL(clicked()), this, SLOT(buttonpress()));
    setLayout(layout);

};


/**
 * destricteur
 * @brief mymainwindow::~mymainwindow()
 * @return 
 */
mymainwindow::~mymainwindow(){}

/**
 * Une fonction qui permet de gérer les saisies de l'utilisateur, et l'actualisation des TextEdit
 * @brief mymainwindow::buttonpress()
 * @return 
 */
void mymainwindow::buttonpress()
{
    string strcode = testedit5->toPlainText().toStdString();
    bool essayer_decoder = true;
    if(strcode.length()==0){
        essayer_decoder = false;
    }
    for(long unsigned int i = 0 ; i < strcode.length(); i++){
        if(strcode[i]!='0' && strcode[i]!= '1' ){
            essayer_decoder = false;
            break;
        }
    }
    if(essayer_decoder){
        testedit3->clear();
        string reponse_prgrm="";
        string decryptage = Huffman->Decryptage_huffman(strcode,reponse_prgrm,true);
        string global_reponse = reponse_prgrm;
        if(decryptage != ""){
            global_reponse = global_reponse + "\nVoici le decryptage correspondant : " +decryptage;

        }

        str = QString::fromStdString(global_reponse);
        testedit3->setPlainText(str);
    }

};
