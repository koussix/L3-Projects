#ifndef MYMAINWINDOW_H
#define MYMAINWINDOW_H
#include <QMainWindow>
#include <QPushButton>
#include <QApplication>
#include <QObject>
#include <QVBoxLayout>
#include <QPainter>
#include <QString>
#include "ArbreB.hpp"
#include <QTextEdit>
#include <QScrollBar>
#include <QPaintEvent>
#include <QLineEdit>

class mymainwindow :public QWidget{
    Q_OBJECT
private:
    QPushButton *button ;
    QString str;
    QTextEdit* testedit;
    QTextEdit* testedit2;
    QTextEdit* testedit3;
    QTextEdit* testedit4;
    QTextEdit* testedit5;
    ArbreB *Huffman;


public:
    mymainwindow();
    ~mymainwindow();

public slots:
    void buttonpress();
//signals:
//    void recup_text(string& str);

};



#endif // MYMAINWINDOW_H
