#ifndef LITERALS_H
#define LITERALS_H

#include <QObject>
#include <QVariant>


class Literals : public QObject{
    Q_OBJECT
    Q_PROPERTY(QVariant fontWeight READ fontWeight CONSTANT)
    Q_PROPERTY(QVariant fontcolor READ fontColor CONSTANT)
    Q_PROPERTY(QVariant blueButtonColor READ blueButtonColor CONSTANT)

public:
    QVariant fontWeight(){return 65;}
    QVariant fontColor(){return "#feffffff";}
    QVariant blueButtonColor(){return "#ff00a9e3";}




};


#endif // LITERALS_H
