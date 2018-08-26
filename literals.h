#ifndef LITERALS_H
#define LITERALS_H

#include <QColor>
#include <QObject>
#include <QVariant>


class Literals : public QObject{
    Q_OBJECT
    Q_PROPERTY(QVariant fontWeight READ fontWeight CONSTANT)
    Q_PROPERTY(QVariant fontcolor READ fontColor CONSTANT)
    Q_PROPERTY(QVariant blueButtonColor READ blueButtonColor CONSTANT)
    Q_PROPERTY(QVariant darkBackgroundColor READ darkBackgroundColor CONSTANT)
    Q_PROPERTY(QVariant chartBackgroundColor READ chartBackgroundColor CONSTANT)
    Q_PROPERTY(QVariant transparent READ transparent CONSTANT)

public:
    QVariant fontWeight(){return 65;}
    QVariant fontColor(){return "#feffffff";}
    QVariant blueButtonColor(){return "#ff00a9e3";}
    QVariant darkBackgroundColor(){return "#242424";}
    QVariant chartBackgroundColor(){return   QColor( 133,195,96)  ;}
    QVariant transparent(){return   QColor( 133,195,96, 0)  ;}




};


#endif // LITERALS_H
