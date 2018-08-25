#ifndef LITERALS_H
#define LITERALS_H

#include <QObject>


class Literals : public QObject{
    Q_OBJECT
    Q_PROPERTY(int fontWeight READ fontWeight CONSTANT)
    Q_PROPERTY(QString fontcolor READ fontColor CONSTANT)

public:
    int fontWeight(){return 65;}
    QString fontColor(){return "#feffffff";}




};




#endif // LITERALS_H
