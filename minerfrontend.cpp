#include "minerfrontend.h"
#include <qquickwindow.h>
#include <qquickview.h>
#include <QVBoxLayout>
#include <qqmlcontext.h>
#include "literal.h"
#include "minerprocess.h"
#include "dataprovider.h"
#include <QQmlApplicationEngine>
#include <QQmlComponent>
#include <QQuickItem>
#include <QDebug>




MinerFrontend::MinerFrontend(QWidget *parent) : QWidget(parent)
{
    QQuickView *qmlView = new QQuickView();

    Literal *lit = new Literal();
    qmlView->engine()->rootContext()->setContextProperty("Literals", lit);

    qmlRegisterType<DataProvider>("DataProvider", 1, 0, "DataProvider");
    qmlRegisterType<MinerManager>("MinerManager", 1, 0, "MinerManager");
    qmlView->setSource(QUrl("qrc:/main.qml"));


    QWidget *container = QWidget::createWindowContainer(qmlView, this);
//    container->show();

    auto layout = new QVBoxLayout;
    setLayout(layout);
    layout->addWidget(container);



	//QQuickWidget *quickWidget = new QQuickWidget;
	//qmlRegisterType<DataProvider>("DataProvider", 1, 0, "DataProvider");
	//qmlRegisterType<MinerManager>("MinerManager", 1, 0, "MinerManager");
	//quickWidget->rootContext()->setContextProperty("Literals", &lit);
	//quickWidget->setSource(QStringLiteral("qrc:/main.qml"));
	//quickWidget->show();

	/*QQmlApplicationEngine *engine = new QQmlApplicationEngine();
	Literals lit;
	engine->rootContext()->setContextProperty("Literals", &lit);
	qmlRegisterType<DataProvider>("DataProvider", 1, 0, "DataProvider");
	qmlRegisterType<MinerManager>("MinerManager", 1, 0, "MinerManager");

	engine->load(QUrl(QStringLiteral("qrc:/main.qml")));*/

//	QQmlApplicationEngine *engine = new QQmlApplicationEngine();
//	QQuickView *minerView = new QQuickView(engine, 0);

//	Literals lit;
//	engine->rootContext()->setContextProperty("Literals", &lit);
//	qmlRegisterType<DataProvider>("DataProvider", 1, 0, "DataProvider");
//	qmlRegisterType<MinerManager>("MinerManager", 1, 0, "MinerManager");
//	engine->load(QUrl(QStringLiteral("qrc:/main.qml")));

	//minerView->setSource(QUrl("qrc:/main.qml"));


}


MinerFrontend::~MinerFrontend()
{
    qDebug() << "closing" ;
}
