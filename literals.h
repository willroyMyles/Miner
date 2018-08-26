#ifndef LITERALS_H
#define LITERALS_H

#include <QColor>
#include <QObject>
#include <QVariant>


class Literals : public QObject{
    Q_OBJECT
    Q_PROPERTY(QVariant fontWeight READ fontWeight CONSTANT)
    Q_PROPERTY(QVariant fontWeightLighter READ fontWeightLighter CONSTANT)
    Q_PROPERTY(QVariant fontWeightLarger READ fontWeightLarger CONSTANT)
    Q_PROPERTY(QVariant borderWidth READ borderWidth CONSTANT)

    Q_PROPERTY(QVariant fontcolor READ fontColor CONSTANT)
    Q_PROPERTY(QVariant blueButtonColor READ blueButtonColor CONSTANT)
    Q_PROPERTY(QVariant darkBackgroundColor READ darkBackgroundColor CONSTANT)
    Q_PROPERTY(QVariant chartBackgroundColor READ chartBackgroundColor CONSTANT)
    Q_PROPERTY(QVariant transparent READ transparent CONSTANT)
    Q_PROPERTY(QVariant borderColor READ borderColor CONSTANT)

    Q_PROPERTY(QVariant buttonColor READ borderColor CONSTANT)
    Q_PROPERTY(QVariant buttonColorHovered READ buttonColorHovered CONSTANT)
    Q_PROPERTY(QVariant buttonColorPressed READ buttonColorPressed CONSTANT)
    Q_PROPERTY(QVariant blueButtonColorHovered READ blueButtonColorHovered CONSTANT)
    Q_PROPERTY(QVariant blueButtonColorPressed READ blueButtonColorPressed CONSTANT)


public:
    QVariant fontWeight(){return 65;}
    QVariant fontWeightLighter(){return 50;}
    QVariant fontWeightLarger(){return 85;}
    QVariant fontColor(){return "#eeffffff";}
    QVariant darkBackgroundColor(){return QColor(38,38,38);}
    QVariant chartBackgroundColor(){return   QColor( 133,195,96)  ;}
    QVariant transparent(){return   QColor( 133,195,96, 0)  ;}
    QVariant borderColor(){return   QColor( 76,76,76)  ;}
    QVariant borderWidth(){return  2 ;}

    QVariant buttonColor(){return   QColor( 76,76,76)  ;}
    QVariant buttonColorHovered(){return   QColor( 76,76,76)  ;}
    QVariant buttonColorPressed(){return   QColor( 76,76,76)  ;}
    QVariant blueButtonColor(){return QColor(0,176,229);}
    QVariant blueButtonColorHovered(){return   blueButtonColor().value<QColor>().darker(105) ;}
    QVariant blueButtonColorPressed(){return   blueButtonColor().value<QColor>().darker(250)  ;}




};


#endif // LITERALS_H
