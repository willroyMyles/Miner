#pragma once
#include <qobject.h>
#include <qquickwindow.h>
#include <QQmlEngine>
#include <QWidget>
#include "literals.h"

class Literals;
class MinerFrontend : public QWidget
{
	Q_OBJECT
public:
	MinerFrontend(QWidget *parent = Q_NULLPTR);
	~MinerFrontend();

private:
//	QQuickWidget * minerWidget;
//	Literals lit;

};

